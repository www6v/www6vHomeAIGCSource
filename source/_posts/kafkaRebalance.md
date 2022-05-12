---
title: Kafka Rebalance机制 
date: 2022-05-11 17:56:31
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


## Rebalance 的 弊端

+ Rebalance 影响 Consumer 端 TPS
  在 Rebalance 期间，Consumer 会停下手头的事情，什么也干不了
+ 如果你的 Group 下成员很多， Rebalance 会很慢。
+ Rebalance 效率不高
  Group 下的 所有成员都要参与进来，而且通常不会考虑局部性原理


## Rebalance 发生的时机有三个
+ 组成员数量发生变化
+ 订阅主题数量发生变化
+ 订阅主题的分区数发生变化

##  “不必要的”的Rebalance 
+ 第一类非必要 Rebalance 是因为未能及时发送心跳，导致 Consumer 被“踢出”Group 而引发的。
因此，你需要仔细地设置session.timeout.ms 和 heartbeat.interval.ms的 值。

+ 第二类非必要 Rebalance 是 Consumer 消费时间过长导致的。
  max.poll.interval.ms参数值的设置显得尤为关键。


## 参考：
17 | 消费者组重平衡能避免吗?  胡夕







