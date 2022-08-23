---
title: CQRS 简介和案例分析
date: 2018-02-25 10:00:12
tags:
  - CQRS
  - 读写分离
categories: 
  - 架构
  - CQRS    
---
 
CQRS全称是指Command Query ResponsibilitySeparation.CQRS的核心是一个简单的概念, 使用一个模型来读信息, 使用另一个模型来更新信息. 它是CQS原理在各个软件领域中的应用而产生的一种模式. CQRS把整个系统分成两个部分: 命令部分和查询部分. Command部分关注更新,  Query部分关注读取.

<!--more--> 
 
其实你可能早就接触过CQRS相关的概念,熟悉数据库的读者不会对索引陌生.
Query部分:如果数据表有索引,  读数据表更加的快速.
Command部分:如果数据表有index,update表时需要更新index, 所以update更加的慢.
 
本文主要从CQRS在高伸缩性系统和领域驱动设计(DDD)两方面的应用阐述其优势。
 
   CQRS的出现有以下两种驱动力
   1. 多参与者协作的环境
多个参与者会使用和修改相同的数据集.  参与者可以是行为人用户, 或者是软件.
   2. 数据总是过时的
在多协作的环境中, 数据一旦显示给了一个用户, 相同的数据可能已经被其它的参与者修改了, 说明数据已经过时了.
在哲学领域有一个命题, 你是否能踏进同一条河两次? 在多协作的环境中也有类似的问题, 你看到的数据总是过时的.
 
***案例***:
在查询出还有电影场次后,  你开始填自己的记录信息, 这时可能别人已经订购了你已经选择的座位, 或者这个时候, 一个事件到达银行说你信用卡有拖欠, 但最后你提交了这次订购，结果订购失败。
 
 
## CQRS与模型
 
在与command模型的交互中产生了事件,  顺序事件的累积可以捕获状态的所有变化, 这种交互模式称为事件源(Event Sourcing) .
 
事件源(Event Sourcing)使得系统有了审计的功能, 回放事件可以使系统恢复到某个时间点的状态. 事件源(Event Sourcing)使command部分引入了异步的机制, 队列中的消息不需要马上处理, event handler可以异步的消费事件.当commands部分产生错误后, 直接向客户端回个错误并不友好, 这时可以引入回滚和重试机制.  在系统恢复正常之后, 队列中的消息重新发送并且用户接受到确认.
 
![单一模型(图1)，模型的分离(图2)，模型的融合(图3)](http://www6v.github.io/www6vHome/cqrs.files/image001.jpg "单一模型(图1)，模型的分离(图2)，模型的融合(图3)")

  Query与Command两种行为的分离使得两个服务公用模型的分离也成为自然(图2)。单一模型(图1)分离成了两个模型:查询模型和命令模型.接口相应也分离成查询接口和命令接口. 客户端通过命令接口路由变化信息到命令模型. 查询模型和命令模型之间往往通过异步方式同步数据. 客户端通过查询接口读取查询模型以得到更新后的数据.
 
但是模型在上下文中孤立的存在并不多见，更多模型之间会有相互的渗透，融合(图3)。共享内核表示了命令模型和查询模型之间重合的部分. (DDD)
在DDD领域中, 通用子系统可以代表更通用的服务. 在存储系统中, 通用子系统代表了在存储介质上的数据结构的融合, 公用.
 
结合Event Souring 和模型共享内核来了解一下通用存储引擎的设计思路
 
***案例: BigTable和Cassandra的通用存储引擎***
 
![通用存储引擎图4](http://www6v.github.io/www6vHome/cqrs.files/image002.jpg "通用存储引擎图4")
   
数据写入时需要先写操作日志, 操作日志可以看成是Event Souring的持久化保存.成功后应用到内存中的MemTable中. 当内存中的MemTable达到一定大小, 需要将MemTable dump到磁盘中生成SSTable.由于数据同时存在MemTable和可能多个SSTable中, 读取操作需要按老到新合并SSTable和内存中的MemTable数据. 可以看到写操作对应的命令模型是MemTable, 读操作对应的查询模型是MemTable和多个SSTable,MemTable在读写时成为了共享模型, 以达到’提高写性能,  亦不降低读性能’的目的.
 
 
## CQRS与RESTFUL
 
在REST风格的系统中, 资源动词, 名词, 表现三个维度上的分离, 形成了资源行为(统一接口),  资源状态,  资源表现形式.
REST的6个约束中包括统一接口, 能够使客户端和服务端独立的演化。统一接口包括PUT, GET, POST等Http方法.  PUT,  POST类的接口可以归为command部分, GET 类的接口可以归为query部分.
CQRS使得资源行为维度能够再分, 形成对服务层, 模型层, 数据存取层(DAO), 数据源层的纵向切分,  形成command和query两个子系统.REST统一接口是系统的水平接口，CQRS可以看成是系统的垂直接口。
在系统中, C和Q的分离可以看成是对系统中最粗粒度层次的划分.
 
***案例:Facebook缓存架构***
 
![Facebook缓存架构图5](http://www6v.github.io/www6vHome/cqrs.files/image003.jpg "Facebook缓存架构图5")

 
•  整体REST架构分成PUT(Query部分), POST(Command部分)两个部分.
•  Cache分Page cache, fragment cache, row cache, vector Cache, cache命中率见图。
•  Page Cache和Fragment cache存放了API各种请求格式的数据，包括4种资源表现形式 XML, JSON, RSS, ATOM。
•  发表Tweets是先放入Kestrel, 再异步处理，Kestrel用的也是memcached协议。Kestrel可以看成Event Souring, Vector Cache是Command部分和Query部分之间的共享模型. 
 
## CQRS与一致性
 
根据弱CAP原理，在分布式系统中，往往需要达到(一致性, 可用性,分区容忍性)三者的平衡，增强其中的一方就会削弱另外两方。在分布式系统中, P总是需要保证的, 所以需要在C和A之间做取舍.  CQRS中的S(分离)隐喻了P, 即分区容忍性.
 
贯彻CQRS的系统通过多种方式来实现各种级别的一致性，其中包括MS, MM(MMS, MMM), 两阶段提交, Paxos
 
强一致性：假如A 先写入了一个值到存储系统，存储系统保证后续A，B,C的读取操作都将返回最新值。
弱一致性：假如A先写入了一个值到存储系统，存储系统不能保证后续A，B，C的读取操作能读取到最新值。
最终一致性：最终一致性是弱一致性的一种特例。假如A首先write了一个值到存储系统，存储系统保证如果在A，B，C后续读取之前没有其它写操作更新同样的值的话，最终所有的读取操作都会读取到A写入的最新值。
#####  MS
在分布式系统中，通过读写多个数据副本来做到读写分离。
MS方式中, Master会承担起写请求(Command部分)的负载, Slave会承担起读请求(Query部分)的负载.
多个slave副本通过同步, 异步, 半同步的方式达到与Master数据的一致性.异步同步对延时和吞吐量这两个性能指标有好处.
在读多写少的系统中, 增加读的副本可以相对廉价的提高Query部分(读请求端)的水平可伸缩性.  如果有大量突增请求, 可以相应调高读的副本数.--query部分的可伸缩性
 
#####  MM
Multi-master指一个系统存在多个master, 每个master都具有read-write能力，可以根据时间戳或业务逻辑合并版本。具备最终一致性。
 
***案例***
BigTable: 同一个时刻同一个tablet只能被一台Tablet Server服务. 强一致性的分布式索引.
   GFS:  MS实现的弱一致性分布式存储系统.
   Dynamo和Cassandra: MM实现的具备最终一致性的存储系统. 可能出现同一个key被多台机器操作的情况.多台机器上执行的顺序是无法保证的. 需要依赖基于vector lock的冲突合并方法解决冲突. 默认的解决方案是”last write wins”, 即在读的时候合并多个写者产生的多个版本的数据.
 
--To do
## CQRS与数据存储
 
  Command部分:　相对关注事务处理,持久化为关系结构数据. 在数据库中, 使用第3范式.
  Query部分: 相对关注性能. 使用反范式的方式来最小化数据的级联.  在数据库中, 可以使用第一范式, 也可以结合使用nosql技术.
 
***案例:　Mysql + Redies混合存储(sql + nosql混合存储)***
 
![Mysql + Redies混合存储图6](http://www6v.github.io/www6vHome/cqrs.files/image004.png "Mysql + Redies混合存储图6")
   
MySQL把数据同步到NoSQL中,这种架构适用于需要把数据同步到多种类型的存储中。
Nosql通过装做是mysql的slave, 从mysql同步数据.MySQL到NoSQL同步的实现可以使用MySQL UDF函数，MySQL binlog的解析来实现。
 
## CQRS与分布式事务
 
两阶段提交是实现分布式事务的常用方式, 协议比较通用. 但两阶段提交中所有事务序列化的通过master coordinator, 是吞吐率和延迟的杀手.
 
CQRS是完全建立在BASE(Basic Availability, Soft-state, Eventual consistency)事务基础上的. 在CQRS实现中, 通过降低对写端的压力, 减少锁的竞争和死锁的可能, 来增加写端的性能.各种实现方式会有自定义的协议, 相对于两阶段提交灵活但不够通用.
 
在对性能要求不高的系统中, 应该采用两阶段提交加快开发. 在对性能要求不是很高系统中,  应该考虑采用消息队列.
 
***案例1:　ebay分布式事务***
消息队列上的CQRS + 消息应用状态表
 
  1. 更新业务表A
  2. 更新业务表B的事件放入消息队列
  3. 提交事务1(包括步骤1, 2)
 
  4. 查询队列中的消息,  更新业务表B.
  5. 插入消息应用状态表message_applied
  6. 提交事务2(包括步骤5, 6)
 
  7. 如果上述事务成功之后, dequeue message
  8. 删除消息应用状态表中的事件
 
在关注第2点和第4点之后, 可以看到队列的插入(command)和查询(query) 放在了两个事务中.
 
***案例2:  淘宝分布式事务***
日志表上的CQRS + 去重表
 
1.  更新业务表A
2.  更新业务表B的事件放入日志表, 并自动生成一个唯一的transactionID。
3.  提交事务1(包括步骤1, 2)
                                                              
4. 消息中间件保证从主机1上读取更新业务表B的事件和transactionID, 并且这个消息路由到主机2.
 
5. 更新业务表B
6. 将transactionID插入去重表
7. 提交事务2(包括步骤5, 6)
 

![ebay分布式事务图7, 淘宝分布式事务图8](http://www6v.github.io/www6vHome/cqrs.files/image005.jpg "ebay分布式事务图7, 淘宝分布式事务图8")

 
这两个实现方式, 它们有之间的共性, 就是有一个元素被分步骤的使用了CQRS.在案例1中是消息队列，案例2中是日志表. 从CQRS的角度看, 这两种实现方式没有本质的区别, 方式2可以看成是方式1的变体.
 
案例2中的去重表等价于案例1中的消息应用状态表.
案例2看似复杂, 多了步骤4, 实际是保持事务1,2同步临界区的最小化, 等于是把案例1中查询队列中的消息(步骤4)剥离出事务, 防止不必要的查询错误导致回滚整个事务.
案例1的事务1牵涉到了业务表A和队列的混合型业务事务,实现复杂。案例2的两个事务都是数据库的系统事务, 可以使用两阶段提交, 相对通用.
案例2的去重表没有删除过, 能保证最终的消息都是已经成功的事务.案例1 有dequeue message步骤, 并在事务外, 在出现故障后, message_applied会留下一些垃圾内容. --
 
## CQRS与CDN
 
在大规模web站点中, 动态数据和静态数据(图片)的分离是优化的通用策略.
   CQRS能够在Query端做到极致的优化, 例如缓存, 分区, 备份(replication), 分布式的CDN. CDN是一种离用户相对近的边缘缓存, 能提高用户体验.
 
***案例:   ***
淘宝CDN

![](http://www6v.github.io/www6vHome/cqrs.files/image006.jpg )

## CQRS原理
 
CQRS来源于Bertrand Meyer提出的CQS原理。CQS原理从OOP中推导出来，大致是说如果你返回一个值你就不能改变状态。如果你改变了状态，你的返回值必须是void类型的。
 
CQS原理其实在很多领域都有应用, 包括OOP中字段的的setter/getter,Java String(copy-on-write), Java thread(ConcurrentHashMap
读写分离锁), snapshot(copy-on-write), 数据库索引, 数据库sql(DML, DDL)中都可以看到CQS原理的影子.
 
## 小结:
 
CQS中的分离(S)粒度,小到对象状态的setter和getter方法, 大到子系统的形成.
就如Greg谈到的， CQRS本身是个简单的小模式，有趣的是在结合两个服务时所要考虑的架构属性。
CQRS在复杂性管理和提高系统伸缩性有着独特的优势。
 
## 参考:
1. [clarified CQRS](http://wenku.baidu.com/view/002c419851e79b896802265e.html)
2. [CQRS](http://martinfowler.com/bliki/CQRS.html) 
3. [CQRS Documents by Greg Young](http://wenku.baidu.com/view/6aaa6c0690c69ec3d5bb751e.html)  
4. [NoSQL架构实践（一）——以NoSQL为辅](http://www.infoq.com/cn/news/2011/02/nosql-architecture-practice/) 
5. DDD -- domain driven design (共享内存)  --  Even Eric 
6. [Rethinking architecture with CQRS](http://oojdon.iteye.com/blog/903203)  
7. [Twitter架构图(cache篇)](http://timyang.net/architecture/twitter-cache-architecture/) 
8.  Event Sourcing -- Martin fowler
 
 

