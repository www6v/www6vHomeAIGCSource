---
title: Kafka总结
date: 2016-05-11 18:41:01
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

{% asset_img  kafka.png  Kafka总结 %}

### 一. kafka中的选主
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


### 二. Partition
1. 首领 leader ， 首领副本
2. 跟随者 follower， 跟随者副本
3. 首选首领


### 三. kafka的副本机制
1. AR = ISR + OSR。 
ISR 不只是追随者副本集合，它必然包括 Leader 副本。
2. ISR中副本有主从之分，但是**读写都是主副本**， 从副本只负责**拉取**主副本的数据。
好处（一致性方面）
+ 方便实现**“Read-your-writes”**
+ 方便实现**单调读（Monotonic Reads）**
3. Kafka 判断 Follower 是否与 Leader 同步的标准,**不是看"相差的消息数"，而是看"落后的时间"。**
   **落后的时间**就是 Broker 端参数 replica.lag.time.max.ms 参数值。
   这个参数的含义是Follower 副本能够落后 Leader 副本的最长时间间隔，当前默认值是 10 秒。
4. Unclean 领导者选举（Unclean Leader Election） 
[Kafka 可靠性总结](../../../../2016/07/05/kafkaReliability/) self

## 参考:

1. Kafka剖析（一）：Kafka背景及架构介绍 郭俊
2. Kafka设计解析（六）- Kafka高性能关键技术解析 郭俊
3. 《kafka权威指南》 薛命灯 第3，5章
4. Kafka文件存储机制那些事 幽灵之使
5. [分布式发布订阅消息系统 - Kafka架构设计](https://www.oschina.net/translate/kafka-design?cmp&p=1)  官方文档翻译 未
6. [Kafka科普系列 | 原来Kafka中的选举有这么多？](https://mp.weixin.qq.com/s?__biz=MzU0MzQ5MDA0Mw==&mid=2247485365&idx=1&sn=f55d8d2e1d6e82d23b6f60b847382c25&chksm=fb0bed21cc7c64370398daf3caf0f639c46db1989583ca035391cb82a29d3ca66d94f860cca8&token=1885824046&lang=zh_CN&scene=21#wechat_redirect)  朱小厮
7. [Kafka核心技术与实战 - 23丨Kafka副本机制详解]() 胡夕