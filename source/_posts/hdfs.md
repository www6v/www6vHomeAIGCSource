---
title: HDFS NameNode HA 解决方案
date: 2018-06-07 10:29:55
tags:
  - 大数据
  - HDFS
  - 可用性
categories: 
  - 大数据  
  - HDFS    
---
　                      
HDFS NameNode是可靠和高效的, 简单的架构使HDFS能够在上千个节点可靠的存放生产级的数据. 但是, HDFS NameNode也是一个集群中的单点(SPOF). 开源社区也提供了几个HA的解决方案.
<!-- more -->    
 
HDFS Namenode 宕机后启动时构建状态的两个相对长的阶段包括:　 I. 加载fsimage,并回放editlog.    II. datanode块的汇报, blockMap的构建. HDFS Namenode HA主要是指Ediglog的HA,  不包括FSImage
 
  
  
## 1   HDFS  HA 解决方案
 
### Secondary NameNode(SNN)
 
Secondary NameNode 周期的合并edits和fsimage，能减少集群重启的时间。SNN会周期的做检查点(默认一个小时). 如果ＮＮ宕机, 宕机前和上一次checkpoint这个时间段的状态变更会丢失, 所以元数据并不是最新.　
 
当NameNode(NN)失效的时 候，Secondary NN并无法立刻提供服务.
 
 
### BackupNode(BN):
 
BackupNode是社区版Hadoop 0.21提供的一种高可用方案。它不仅实现了SecondaryNameNode的功能，还实现了复写功能，即同时向Active Namenode和Standby Namenode写入EditLog，这样也避免了共享存储会遇到的“IO Fencing”问题。 SNN  是每隔一段时间去  NN  下载  fsimage  和  edits  文件，而NN  可以实时的将日志传送给  BN ，然后将操作合并到  fsimage  里。
 
![](http://www6v.github.io/www6vHome/hdfs.files/image001.jpg )
 
BackupNode 很便宜, 简易, 也考虑到了以下的用例: 主节点在运行, Standby 在线下维护. 主节点宕机并且不能重启.  Standby需要启动并接管主节点.   如果Standby不可用，Active Namenode会把EditLog备份到其他的地方。
 
BackupNode只能算主从温备，因为Datanode只会向Active Namenode汇报和保持心跳，一旦Active Namenode发生故障，需要人工切换到BackupNode上，并且需要在BackupNode上把BlocksMap状态完全构建起来，这样的切换 时间在分钟~小时级别。
 
 
### AvatarNode:
 
Facebook的AvatarNode是业界较早的Namenode HA方案，它是基于HDFS 0.20实现的，如下图所示。由于采用的是人工切换，所以实现相对简单。AvatarNode对Namenode进行了封装，处于工作状态的叫 Primary Avatar，处于热备状态的叫Standby Avatar(封装了Namenode和SecondaryNameNode)，两者通过NFS共享EditLog所在目录。在工作状态 下，Primary Avatar中的Namenode实例接收Client的请求并进行处理，Datanode会向Primary和Standby两个同时发送 blockReport和心跳，Standby Avatar不断地从共享的EditLog中持续写入的新事务，并推送给它的Namenode实例，此时Standby Avatar内部的Namenode处于安全模式状态，不对外提供服务，但是状态与Primary Avatar中的保持一致。一旦Primary发生故障，管理员进行Failover切换：首先将原来的Primary进程杀死(避免了“Split Brain”和“IO Fencing”问题)，然后将原来的Standby设置为Primary，新的Primary会保证回放完成所有的EditLog事务，然后退出安全模 式，对外接收服务请求。为了实现对客户端透明，AvatarNode主从采用相同的虚拟IP，切换时将新的Primary设置为该虚拟IP即可。整个流程 可在秒~分钟级别完成。
 

![](http://www6v.github.io/www6vHome/hdfs.files/image002.jpg )
 
![](http://www6v.github.io/www6vHome/hdfs.files/image003.jpg ) 
 
### Hadoop 2.0  HA

Hadoop 2.0 HA 在很多地方借鉴了 AvatarNode:
 
 
![](http://www6v.github.io/www6vHome/hdfs.files/image004.jpg )
 
 
 I. 同步edits信息
 NN active和NN standby之间共享存储(share storage) edits信息, 通常用NFS. 这相当于单点故障的位置转移到了中高端的存储设备内部, 依赖外部存储的可靠性.  NN内部每次元数据变动后的flush操作，加上NFS的close-to-open，数据的一致性得到了保证。在使用了NFS做editLog的standby这个阶段后, 社区下个阶段更推崇使用BookKeeper做EditLog的存储. 并且这些功能是实现为可插拔的.
 
 
   II. FailoverController作为NN进程的WatchDog
   FailoverController是一种协调器(coordination), 作为ZooKeeper的客户端, 主要的指责是领导者选举(leader election),  在NN宕机之后, 自动化的选举出领导者, 并透明的切换到standby上.
     错误检测机制通过ZK的临时节点(ephemeral nodes)来实现的, 用心跳和现在的系统集成在一起. 在NN full gc时, 会stop the world, 对这类GC有特殊的管理, 防止误认为NN active已宕机, 剥离出来的FailoverController能解决这个问题.
 
 
III. fail-over选择
用户想要对fail-over做手工或者自动的热备份, Hadoop 2.0  HA提供了这两种选择.
 
IV. DN block reports
向standby回报块(block reports)的逻辑重用了AvatarNode部分的代码.
 
 
### Quorum Journal Manager /Paxos HA
 
目前采用最多的就是用共享存储NAS+NFS, 但这些存储设备要求是HA的. 可以使用RAID技术, 利用磁盘阵列的手段,  提升数据的安全性. 但RAID也有缺陷, 这个机器的磁盘不可能无限的增加. 单机容量受到磁盘架个数的限制.
   换一个思路, 可以通过集群, 将多台pc server联系到一起, 使用软件逻辑而非硬件逻辑来进行数据的多磁盘备份.由此产生了Quorum-based Journaling这个HA解决方案.
 
  
![](http://www6v.github.io/www6vHome/hdfs.files/image005.gif )  

概述一下Quorum-based Journaling: 多个后台进程的Quorum commits，把这样的后台进程表示为JournalNodes。每一个JournalNode暴露一个简单的RPC接口，允许NameNode读 写edit log，这个log是存在本地磁盘上。当NameNode要写一个edit时，它发送这个edit给集群中所有的JournalNodes，等待大多数节 点的回复。一旦大多数回复成功，这个edit就被认为提交了。

Quorum-based相对于两阶段提交更轻量级, 但延迟也比较厉害. QJM有相应的对策,  QJM中存储日志的JournalNode不会因为其中一台的延迟而影响整体的延迟，而且也不会因为JournalNode的数量增多而影响性能（因为NN向JournalNode发送日志是并行的）
 
 
## 2.     机制
在看了些解决方案之后, 再看一下各个HA解决方案之后的实现机制
 
   I. 表决: 相同的组件输入相同的输入, 他们的计算后的简单输出发送给表决者. 如果表决者检测到异常行为, 就终止这个组件的行为. 表决算法可以是”多数规则”等算法.
  也叫协调器 coordination, eg. 两阶段的deterministic coordinator, PAXOS/Qurumn coordinator .  
 
  II. 主动冗余:　系统中的组件以并行的方式接受请求, 仅仅使用一个组件的响应.　异常发生时,　系统的停机时间是通常是秒级,　因为备份组件的状态是最新的,　如果是自动切换,　停机时间会缩的更短.
  Eg. Hadoop 2.0 HA中DN同时向NN Active和NN Standby发送block report.

  扩展: mapreduce的推测执行 (speculative execution)
 
  III. 被动冗余:　系统中的一个组件接受请求,　然后通知备用组件进行状态的更新.　何时接管主组件的工作可以由备用组件或其它组件决定.　主组件会发出状态同步的命令.　
   Eg. AvatarNode 和 Hadoop 2.0 HA中, NN Active 同步EditLog到NN Standby中.
   扩展:　Datanode一备三
　　　
  IV. Checkpoint还原点: 可以看成是对组件健康状态的一次快照.
  Eg. SNN                                                                                                
  扩展: Oracle checkpoint, VM snapshot
 
  V. 状态同步(状态外移): 备用组件在提供服务之前需要和主组件的状态一致. 恢复组件重新提供服务前要同步到失效之前正常的状态.　
  Eg.  Hadoop 2.0 HA中, 通过被动冗余的editlog和主动冗余的block report, NN Standby回放editlog与fsimage合并来实时和NN Active的状态保持一致.
  扩展:  Mysql slave 的binlog同步, Redis slave RDD 文件同步
 
  VI. 命令/响应(主动) :　一个组件发出一个命令,　并希望在预定义的时间内收到一个来自对方组件的响应.
Eg,  FailoverController发送命令给NN active, 如果NN active宕机, 就不能返回相应.
　
　VII. 心跳:　一个组件定期发出一个消息(心跳),　另一个组件收听这个消息,　知道组件是否健康.　
  Eg: FailoverController通过检测到NN active不健康,  会停止发心跳给zookeeper,  zookeeper知道NN acive已宕机, 会做领导者的选举.
 
 
  VII. 影子服务: 备用组件和主组件的状态一致, 但主组件不宕机的情况下不对外提供服务.
  Eg. AvatarNode 和 Hadoop 2.0 HA中的standby

 

VIII. 冷备份: standby没有运行, standby能通过读fsimage和editlog, 等待block report来建立需要的状态.
 
VIIII. 温备份: standby装载了fsimage和editlog, 但没有最近的block report.
 
X. 热备份: standby有足够的驻内存的状态来取代active.
 

## 3.  权衡

 
Backup node异步写有丢失小部分数据的可能,但吞吐量好,　延迟低, 能达到最终一致性. BackupNode 在宕机时, 还是需要把状态的远端外部存储拿回, 这又成了共享存储.
 
如果对数据完整性要求比较高, 可以使用两阶段提交和PAXOS. 两阶段提交在没有timeout的机制时, 强依赖备用组件.  实现相对重量级, 由于要同步提交或者回滚, 所以延迟高, 并且吞吐量低.

Quorum尝试复制多份数据,　只要有过半的节点成功,　即整个备份过程成功. PAXOS的多个变体通过合理的放弃一些性能与一致性，集群可以容忍几乎多达n/2个数的节点失效。这种折中在两阶段提交与 PAXOS 协议的区别里体现得很明显。所以社区并未出现基于两阶段提交的HA方案, 而是出现了Quorum-based Journaling in CDH4.1

 
   在failover后的客户端重定向, 生产中的解决方案, 往往通过virtual IP address提供namenode服务,  standby接管为acitive后会也使用这个虚拟ip
 
 
 

   下图从几个维度给出各种HA解决方案的比较
 
|        | 备份方式 | 协议   | 是否丢数据 | 可用性 | 切换时间 |    机制 |
| ------ | ------  | ------ | ------    | ------ | ------ |  ------ | 
|Backup node|温备|Master-Slave|丢数据|基本可用|分钟~小时级|Checkpoint + EditLog被动冗余| 
|AvatarNode|热备|数据安全的Master-Slave|不会丢数据|高可用/依赖外部可用性|秒~分钟级别|blockmap 主动冗余 +  EditLog被动冗余 + 影子服务| 
|HDFS HA 2.0(NFS)|热备|数据安全的Master-Slave|不会丢数据|依赖外部可用性/依赖外部可用性|5-20s|blockmap 主动冗余 +  EditLog被动冗余 + 影子服务| 
|QJM/Qurom Journal Manager|热备|PAXOS|不会丢数据|高可用|小于1分钟|EditLog被动冗余(Quorum-based)|
 
 
CAP理论是一个相对论,  说明在分布式系统中提供的是相对的可用性, 一致性.  Hadoop namenode 的可用性也是相对的可用, 以下是一些小结:
 
Backup Node:  延迟比较低, 吞吐量比较高, 并能容忍少量的数据丢失.   

Hadoop HA 2.0: 要求数据不能丢失.  即可以使用NFS, 也可以使用Bookkeeper, 既可以手动切换,也可以自动切换Standby NN. 切换时间短. 

Quorum-based journaling: 要求数据不能丢失, 并且对延迟要求不高的情况, 也不希望使用昂贵的外部存储. 
 
 
## 参考:
1. [ High Availability Framework for HDFS NN](https://issues.apache.org/jira/browse/HDFS-1623)  
2. [海量存储系列1-15](http://www.docin.com/p-532877866.html) 
3. [Hadoop 2.0 NameNode HA和Federation实践](http://www.infoq.com/cn/articles/hadoop-2-0-namenode-ha-federation-practice-zh) 
4. [基于QJM/Qurom Journal Manager/Paxos的HDFS HA原理及代码分析](http://yanbohappy.sinaapp.com/?p=205) 
5. [Quorum-based Journaling in CDH4.1](http://www.tuicool.com/articles/EZnE7v) 
6. [Facebook如何使用Avartarnode提升HDFS可靠性](http://www.infoq.com/cn/news/2012/08/facebook-avatarnode)
7. [hadoop HA使用Quorum Journal的设计](http://www.itinit.net/thread-2468-1-1.html) 
8. [http://blog.nosqlfan.com/html/4139.html](NoSQL数据库的分布式算法)
 

