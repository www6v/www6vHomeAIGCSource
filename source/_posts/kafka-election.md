---
title: Kafka 中的选主
date: 2021-05-16 10:37:20
tags:
  - kafka
categories:
  - 分布式
  - 中间件 
  - 消息系统
  - Kafka   
---

<p></p>
<!-- more -->


### 一. Kafka中的选主
<div style="text-align: center;">
	 表. 选主
</div>

/|组件| 详细
:-:|:-:|:-:
kafka|Controller leader| 依赖zk选主, kafka只有一个Controller
|Partition leader | leader在ISR中
|Consumer leader的选举| 消费组内的消费者选举出一个消费组的leader
zookeeper| zk自身的选主 | Zab协议(原子广播+奔溃恢复)
 | 其他系统依赖zk选主| 使用zk的临时节点， session结束， 临时节点消失

+    Kafka中有那些地方需要选举？这些地方的选举策略又有哪些？

6. [Kafka科普系列 | 原来Kafka中的选举有这么多？](https://mp.weixin.qq.com/s?__biz=MzU0MzQ5MDA0Mw==&mid=2247485365&idx=1&sn=f55d8d2e1d6e82d23b6f60b847382c25&chksm=fb0bed21cc7c64370398daf3caf0f639c46db1989583ca035391cb82a29d3ca66d94f860cca8&token=1885824046&lang=zh_CN&scene=21#wechat_redirect)  朱小厮
[Kafka科普系列 | 原来Kafka中的选举有这么多](https://honeypps.com/mq/kafka-basic-knowledge-of-selection/)