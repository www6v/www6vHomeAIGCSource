---
title: Kafka消费者总结
date: 2016-06-25 18:46:27
tags:
  - kafka  
categories:
  - 分布式
  - 中间件 
  - 消息系统
  - Kafka   
---

{% asset_img  kafka-consumer.jpg  Kafka消费者总结 %}

### 消费者
1. 批量消费
2. 消费者的ZeroCopy: 
   直接把消息从文件里发送到网络通道， 而不需要内核与用户态之间数据的来回复制。

## 参考:

1. Kafka设计解析（四）：Kafka Consumer解析 郭俊
2. [Kafka分区分配策略（1）——RangeAssignor](https://blog.csdn.net/u013256816/article/details/81123600) 朱小厮
3. [Kafka分区分配策略（2）——RoundRobinAssignor和StickyAssignor](https://blog.csdn.net/u013256816/article/details/81123625) 朱小厮
4. Kafka分区分配策略（3）——自定义分区分配策略 朱小厮
5. Kafka的Lag计算误区及正确实现 朱小厮
6. 《kafka权威指南》 薛命灯 第3，4 ，5章
7. Kafka Consumer机制优化-保证每条消息至少消费一次 幽灵之使


