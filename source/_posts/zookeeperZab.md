---
title: Zookeeper-Zab
date: 2015-11-29 12:06:43
tags:
  - Zookeeper
categories:
  - 中间件
  - Zookeeper 
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

#  Zab协议
### Overview  [1]

{% asset_img  zab.jpg  Zookeeper的分布式一致性协议Zab %}

#  ZAB的四个阶段 [3]
### 后三个阶段 [5]
{% asset_img  zab-overview.jpg  Zookeeper的分布式一致性协议Zab  %}

###  阶段一   选举阶段（Leader Election） [4]
+ 成为Leader的条件：
  - 选epoch最大的
  - epoch相等，选zxid最大的
  - epoch和zxid都相等，选server_id最大的（zoo.cfg 中配置的 myid）


+ 服务器状态
  - LOOKING 不确定Leader状态。该状态下的服务器认为当前集群中没有Leader，会发起Leader选举
  - FOLLOWING 跟随者状态。表明当前服务器角色是Follower，并且它知道Leader是谁
  - LEADING 领导者状态。表明当前服务器角色是Leader，它会维护与Follower间的心跳
  - OBSERVING 观察者状态。表明当前服务器角色是Observer，与Folower唯一的不同在于不参与选举，也不参与集群写操作时的投票

+ 快速选举（Fast Leader Election）
节点在选举开始时，都默认投票给自己，当接收其他节点的选票时，会根据上面的 Leader条件 判断并且更改自己的选票，然后重新发送选票给其他节点。当有一个节点的得票超过半数，该节点会设置自己的状态为 Leading ，其他节点会设置自己的状态为 Following。

{%  asset_img  fast-election.jpg  %}

### 阶段二   发现阶段
在这个阶段中，Followers和上一轮选举出的准Leader进行通信，同步Followers最近接受的事务Proposal。**这个阶段主要目的是发现当前大多数节点接受的最新提议，并且准Leader生成新的epoch，让Followers接受，更新它们的acceptedEpoch。**

一个Follower只会连接一个Leader，如果有一个节点F认为另一个Follower P是Leader，F在尝试连接P时会被拒绝，F被拒绝后，就会进入选举阶段。

###  阶段三   同步阶段
同步阶段主要是利用 Leader 前一阶段获得的最新 Proposal 历史，**同步集群中所有的副本**。

只有当 quorum（超过半数的节点） 都同步完成，准 Leader 才会成为真正的 Leader。Follower 只会接收 zxid 比自己 lastZxid 大的 Proposal。

###  阶段四   广播阶段
到了这个阶段，Zookeeper 集群才能正式对外提供事务服务，并且 Leader 可以进行消息广播。同时，如果有新的节点加入，还需要对新节点进行同步。
需要注意的是，Zab 提交事务并不像 2PC 一样需要全部 Follower 都 Ack，只需要得到 quorum（超过半数的节点）的Ack 就可以。

{% asset_img  broadcast.jpg  %}

###  



# 参考

1. 《PAXOS到ZOOKEEPER分布式一致性原理与实践》 第4章 倪超
2. [分布式服务框架 Zookeeper — 管理分布式环境中的数据](https://www.ibm.com/developerworks/cn/opensource/os-cn-zookeeper/) 失效
3. [Zookeeper一致性协议——ZAB ](https://www.cnblogs.com/Jacian/p/14212401.html)   *** 
4. [深入浅出Zookeeper（一） Zookeeper架构及FastLeaderElection机制 ](http://www.jasongj.com/zookeeper/fastleaderelection/) *** 
5. [分布式一致性协议 - ZAB](https://cloud.tencent.com/developer/article/1729207)

[Zab: High-performance broadcast for primary-backup systems](https://www.semanticscholar.org/paper/Zab%3A-High-performance-broadcast-for-primary-backup-Junqueira-Reed/b02c6b00bd5dbdbd951fddb00b906c82fa80f0b3)  paper 未