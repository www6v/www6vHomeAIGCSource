---
title: 分布式一致性总结
date: 2016-02-09 18:19:56
tags:
  - 分布式
  - 一致性
  - 事务
categories: 
  - 分布式
  - 一致性    
  - 事务
---

<p></p>
<!-- more -->


{% asset_img  consistent.jpg  分布式一致性总结 %}



## 一. 一致性

<div style="text-align: center;">
![consistent-relationship](https://user-images.githubusercontent.com/5608425/65506192-989c8f00-defd-11e9-8ce4-df9b2bd8a96f.jpg)
</div>

一致性[上到下，强到弱]|协议|特性|举例
:-:|:-:|:-:|:-:
强一致性|R+W>N[ReadQurum-WriteQurum]| 可定制 |Dynamo 三副本，定制灵活
强一致性|2阶段,3阶段 #1| 延迟大，吞吐低。全局锁资源| JTA(XA)
强一致性|paxos #1|难理解，延迟大，吞吐中等，全局锁资源|分布式锁系统Chubby			
顺序一直性| |类似多线程程序执行顺序的模型| Zookeeper的读 <br>1.两个主流程，三个阶段 <br> 2.Zab（Qurum）:2f+1个节点，允许f个节点失败
因果一致性|时钟向量Vector clock[11][12] || 微信朋友圈的评论, Dynamo
最终一致性|反熵,gossip[9] |  | Cassandra， BT(Bit-Torrent)
最终一致性|raft[10]   | 相对Paxos简单。主从，三个阶段   | etcd
最终一致性|Master-Slave   |延迟低，吞吐高<br>主动推送/被动拉取  | Mysql 
最终一致性|Master-Master  |延迟低，吞吐高                      | Mysql	
弱一致性||| Backups（备份）


> 线性一致性  #1： 又叫原子一致性，一个操作对于系统的其他部分是不可中断的	
	  
	
## 二. 柔性事务 最终一致性

模式 |  流程 | 流程细节 
:-:|:-:|:-:
EBay模式 #2【8】 |  **正向流程**<br> [本地事务+幂等业务接口+half消息] | 消息状态<br> 1. 初始化：消息为待处理状态<br> 2. 业务成功：消息为待发送状态<br>3. 业务失败：消息删除 
 |    **反向流程**（异常流程，补偿流程） | 中间件询问业务执行结果，更新消息状态 
TCC #4|1.主流程控制整个事务 2.分流程提供Confirm和Cancel方法。| Try:  阶段1的业务执行  Confirm: 阶段2的业务执行  Cancel: 回滚Try阶段执行的业务流程和数据
Saga 1PC (一阶段)| 基于补偿的消息驱动的用于解决long-running process业务。 |  a  
补偿 | 状态查询（成功or失败）+补偿| 定时校验异常 + 补偿


模式 | 工程 | 事务seata/Fescar
:-:|:-:|:-:
EBay模式 #2【8】|  Eg:  阿里Notify | XA, RocketMQ事务消息
TCC #4| Eg: 支付宝DTS #3 |蚂蚁 XTS(内部)/DTX(蚂蚁金融云) #3 <br>**入侵性**<br>  TCC #4 FMT
两阶段 |  | 阿里 TXC(内部)/GTS(阿里云) <br>**非入侵性** <br>AT[4] 基于 支持本地 ACID 事务 的 "关系型数据库" <br> MT[5] 支持把"自定义"的分支事务纳入到全局事务的管理中
 

## 三. 柔性事务 - 消息

![mq-normal](https://user-images.githubusercontent.com/5608425/66023796-d2d0e680-e524-11e9-8748-1a26f3d0f157.JPG)
![mq-reverse](https://user-images.githubusercontent.com/5608425/66023797-d2d0e680-e524-11e9-85e6-f845863fe4a8.JPG)

<style>
table th:first-of-type {
  width: 100px;
}
</style>


## 参考：

### 一致性
1. [保证分布式系统数据一致性的6种方案](https://weibo.com/ttarticle/p/show?id=2309403965965003062676)  高可用架构  good
2. [深入解析NoSQL数据库的分布式算法](https://www.csdn.net/article/2015-01-30/2823782)   good
3. ZooKeeper真不是最终一致性的，而是顺序一致性 陈东明
4. 为什么程序员需要关心顺序一致性（Sequential Consistency）而不是Cache一致性（Cache Coherence） carlosstephen
5. 线性一致性(Linearizability)是并发控制的基础 陈东明
6. ENode 1.0 - Saga的思想与实现 汤雪华
7. 《大数据日知录：架构与算法》 张俊林
8. [Base: An Acid Alternative](https://queue.acm.org/detail.cfm?id=1394128)  Ebay模式  good
9. [gossip-visualization](https://rrmoelker.github.io/gossip-visualization/)  gossip 
10. [raft](../../../../2019/06/21/raft/) self  
11. [Dynamo: Amazon’s Highly Available Key-value Store](http://bnrg.eecs.berkeley.edu/~randy/Courses/CS294.F07/Dynamo.pdf) paper 未
12. [Why Vector Clocks Are Hard](https://riak.com/posts/technical/why-vector-clocks-are-hard/) 未

### Fescar && TCC
1. 分布式事务之TCC事务 梁钟霖
2. 分布式事务之TCC服务设计和实现注意事项 绍辉
3. https://github.com/www6v/tcc-transaction
4. [AT Mode](https://github.com/seata/seata/wiki/AT-Mode)  Fescar
5. [Manual Transaction 模式](https://github.com/seata/seata/wiki/MT-Mode)
6. [更开放的分布式事务 | Fescar 品牌升级，更名为 Seata](https://mp.weixin.qq.com/s/S0touTyVWfolEqgFaAjLxg)
7. [关于开源分布式事务中间件Fescar，我们总结了开发者关心的13个问题](https://mp.weixin.qq.com/s/XTCZEZdmToWrETbR1GtR4g)

### 应用
1. [数据一致性检测应用场景与最佳实践](https://github.com/StabilityMan/StabilityGuide/blob/master/docs/processing/lostprevention/%E6%95%B0%E6%8D%AE%E4%B8%80%E8%87%B4%E6%80%A7%E6%A3%80%E6%B5%8B%E5%BA%94%E7%94%A8%E5%9C%BA%E6%99%AF%E4%B8%8E%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5.md) 阿里 未
