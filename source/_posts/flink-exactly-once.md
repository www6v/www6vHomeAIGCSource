---
title: Flink 端到端Exactly-once
date: 2022-02-01 22:30:47
tags:
  - flink
categories: 
  - 大数据 
  - 流式计算 
  - flink
---

<p></p>
<!-- more -->


## 端到端Exactly-once
   

##### 实现端到端 exactly-once 的具体过程可以分解如下

(1)启动检查点保存

(2)算子任务对状态做快照

(3)Sink 任务开启事务，进行预提交

(4)检查点保存完成，提交事务


## 参考：
1. [Flink端到端Exactly-once](https://zhuanlan.zhihu.com/p/68797265) 王星辰
2. [An Overview of End-to-End Exactly-Once Processing in Apache Flink (with Apache Kafka, too!)](https://flink.apache.org/features/2018/03/01/end-to-end-exactly-once-apache-flink.html)
3. 尚硅谷 flink(Java) - bilibili  
4. [(十)简单解释: 分布式数据流的异步快照(Flink的核心)](https://zhuanlan.zhihu.com/p/43536305) 原理 - aws SDE - 未
5. [端到端一致性,流系统Spark/Flink/Kafka/DataFlow对比总结(压箱宝具呕血之作)](https://zhuanlan.zhihu.com/p/77677075) 原理 - aws SDE - 未




