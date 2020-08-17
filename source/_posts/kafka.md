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

### kafka中的选主
<div style="text-align: center;">
	 表. 选主
</div>

|组件| 详细
:-:|:-:|:-:
kafka|Controller leader| 依赖zk选主, kafka只有一个Controller
|Partition leader | leader在ISR中
|Consumer leader的选举| 消费组内的消费者选举出一个消费组的leader
zookeeper| zk自身的选主 | Zab协议(原子广播+奔溃恢复)
 | 其他系统依赖zk选主| 使用zk的临时节点， session结束， 临时节点消失


### Partition
1. 首领 leader ， 首领副本
2. 跟随者 follower， 跟随者副本
3. 首选首领


### kafka的副本机制
AR = ISR + OSR
好处
1. 方便实现**“Read-your-writes”**
2. 方便实现**单调读（Monotonic Reads）**

## 参考:

1. Kafka剖析（一）：Kafka背景及架构介绍 郭俊
2. Kafka设计解析（六）- Kafka高性能关键技术解析 郭俊
3. 《kafka权威指南》 薛命灯 第3，5章
4. Kafka文件存储机制那些事 幽灵之使
5. [分布式发布订阅消息系统 - Kafka架构设计](https://www.oschina.net/translate/kafka-design?cmp&p=1)  官方文档翻译 未
6. [Kafka科普系列 | 原来Kafka中的选举有这么多？](https://mp.weixin.qq.com/s?__biz=MzU0MzQ5MDA0Mw==&mid=2247485365&idx=1&sn=f55d8d2e1d6e82d23b6f60b847382c25&chksm=fb0bed21cc7c64370398daf3caf0f639c46db1989583ca035391cb82a29d3ca66d94f860cca8&token=1885824046&lang=zh_CN&scene=21#wechat_redirect)  朱小厮