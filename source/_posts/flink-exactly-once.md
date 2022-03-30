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




