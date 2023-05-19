---
title: 消息系统 顺序消息
date: 2021-05-19 12:02:22
tags:
  - 消息系统
categories:
  - 消息系统
  - 顺序消息
---

<p></p>
<!-- more -->

- 顺序消息
  - pull模型+单线程生产/消费[metaq]
  - 严格顺序消息(场景:数据库复制),单个生产者/消费者[jmq,Rocketmq]
     - jmq方案，任意时刻都有两个消息副本
       - 单个生产者生产，其余生产者会抛出异常[jmq]
       - 单个消费者消费，其余消费者会抛出异常[jmq]
       - 正常流程:消息队列分配在两组以上的BROKER组，每个BROKER组由MASTER-SLAVE组成。消息同步写入单个broker的MASTER。
       - 异常处理流程：Master宕机后，slave只能消费读。生产failover到下一个可用的Broker组，等宕机的broker组的slave消费完，然后消费被挑选到的可用的Broker组的slave
       - 协调者 controller：BROKER组的集群信息在协调者上保存为一个单向的链表，消费者和发送者各有一份独立的链表数据。
     - rocketmq方案
       - 从业务层面来保证消息的顺序而不仅仅是依赖于消息系统.比如，订单号相同的消息会被先后发送到同一个队列中
   -  partition 内部有序, 局部有序[kafka]


## 参考
3. 高可用保证消息绝对顺序消费的BROKER设计方案 丁俊
