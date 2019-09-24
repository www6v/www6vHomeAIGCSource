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

<div style="text-align: center;">
![consistent-relationship](https://user-images.githubusercontent.com/5608425/65506192-989c8f00-defd-11e9-8ce4-df9b2bd8a96f.jpg)
</div>

一致性[上到下，强到弱]|协议|特性|举例
:-:|:-:|:-:|:-:
强一致性|R+W>N[ReadQurum-WriteQurum]||Eg :Dynamo 三副本，定制灵活
       |2阶段,3阶段【1】| 延迟大，吞吐低。全局锁资源|Eg : JTA(XA)
       |paxos【1】|难理解，延迟大，吞吐中等，全局锁资源|Eg :分布式锁系统Chubby			
顺序一直性| |类似多线程程序执行顺序的模型| 	Eg: Zookeeper的读 <br>1.两个主流程，三个阶段 <br> 2.Zab（Qurum）:2f+1个节点，允许f个节点失败
因果一致性|时钟向量 Vector clock ||Eg : 微信朋友圈的评论
最终一致性|反熵||Eg : Cassandra， BT(Bit-Torrent)
         |raft|相对Paxos简单。主从，三个阶段|Eg : etcd
         |Master-Slave|延迟低，吞吐高<br>主动推送/被动拉取|Eg : Mysql 
         |Master-Master|延迟低，吞吐高|Eg : Mysql	
弱一致性|||Eg : Backups（备份）


	

> 线性一致性【1】： 又叫原子一致性，一个操作对于系统的其他部分是不可中断的	
	  
	

## 参考：

### 一致性
1. [保证分布式系统数据一致性的6种方案](https://weibo.com/ttarticle/p/show?id=2309403965965003062676)  高可用架构  good
2. [深入解析NoSQL数据库的分布式算法](https://www.csdn.net/article/2015-01-30/2823782)   good
3. ZooKeeper真不是最终一致性的，而是顺序一致性 陈东明
4. 为什么程序员需要关心顺序一致性（Sequential Consistency）而不是Cache一致性（Cache Coherence） carlosstephen
5. 线性一致性(Linearizability)是并发控制的基础 陈东明
6. ENode 1.0 - Saga的思想与实现 汤雪华
7. 《大数据日知录：架构与算法》 张俊林


### Fescar && TCC
1. 分布式事务之TCC事务 梁钟霖
2. 分布式事务之TCC服务设计和实现注意事项 绍辉
3. https://github.com/www6v/tcc-transaction
4. [AT Mode](https://github.com/seata/seata/wiki/AT-Mode)
5. [Manual Transaction 模式](https://github.com/seata/seata/wiki/MT-Mode)
6. [更开放的分布式事务 | Fescar 品牌升级，更名为 Seata](https://mp.weixin.qq.com/s/S0touTyVWfolEqgFaAjLxg)
7. [关于开源分布式事务中间件Fescar，我们总结了开发者关心的13个问题](https://mp.weixin.qq.com/s/XTCZEZdmToWrETbR1GtR4g)

### 应用
1. [数据一致性检测应用场景与最佳实践](https://github.com/StabilityMan/StabilityGuide/blob/master/docs/processing/lostprevention/%E6%95%B0%E6%8D%AE%E4%B8%80%E8%87%B4%E6%80%A7%E6%A3%80%E6%B5%8B%E5%BA%94%E7%94%A8%E5%9C%BA%E6%99%AF%E4%B8%8E%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5.md) 阿里 未
