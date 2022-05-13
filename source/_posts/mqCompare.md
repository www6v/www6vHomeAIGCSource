---
title: MQ总结(Kafka, Rocketmq, Rabbitmq)
date: 2022-05-12 22:17:03
tags:
  - 消息系统
categories:
  - 分布式
  - 中间件 
  - 消息系统
  - 总结  
---

<p></p>
<!-- more -->


功能 | RocketMQ | Kafka | RabbitMQ
:-: | :-: |:-: | :-:
可靠性* | - 同步刷盘<br> - 异步刷盘| 异步刷盘，丢数据概率高 |  同步刷盘
横向扩展能力 | 支持 |  支持 | - 集群扩容依赖前端 <br> - LVS 负载均衡调度
消费模型* | Push/Pull |  Pull | Push/Pull
定时消息* | 支持（只支持18个固定 Level）| 不支持 | 支持
顺序消息* | 支持 | 支持  | 不支持
消息堆积能力 | 百亿级别 影响性能 | 影响性能 | 影响性能
消息堆积查询 | 支持 | 不支持 | 不支持
消息回溯 | 支持 | 支持（位置，时间） | 不支持
消息重试 | 支持 |  生产者有重试机制 | 支持
死信队列 | 支持 | 不支持 | 支持
性能（常规）* | 非常好 十万级 QPS | 非常好 百万级 QPS | 一般 万级 QPS
性能（万级 Topic 场景）| 非常好 十万级 QPS |  低 | 低
性能（海量消息堆积场景） | 非常好 十万级 QPS |  低 | 低
全链路消息轨迹 | 不支持 | 不支持 | 不支持

## 参数：
[Kafka、RabbitMQ、RocketMQ等消息中间件的对比](https://blog.csdn.net/belvine/article/details/80842240)