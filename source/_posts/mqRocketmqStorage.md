---
title: RocketMQ 文件系统
date: 2023-02-26 23:02:36
tags:
  - 消息系统
categories:
  - 消息系统
  - RocketMQ   
---

<p></p>
<!-- more -->

## RocketMQ 文件系统 

##### Overview [8]
{% asset_img  mqRocketmqFile.png     rocketmq文件系统 %}

##### 逻辑存储层
+ Overview
{% asset_img  rocketmq-storage.png   720  468 逻辑存储层 %}

{% asset_img  rocketmq-file.png  逻辑存储层 %}

+ ComsumerQueue[10]
{% asset_img  ComsumerQueue.JPG  ComsumerQueue %}


##### 存储映像层[8]

mappedByteBuffer 则是一块映射到 CommitLog 文件的内存（具体可以了解 mmap ）

###### 刷盘机制[3][8]
+ 同步刷盘
+ 异步刷盘

## 参考
##### 存储

3. [RocketMQ 关键特性](https://yq.aliyun.com/articles/66110?spm=a2c4e.11155435.0.0.2cb97b3fBOIG8W) ***

4. [《RocketMq》二、存储篇](https://blog.csdn.net/xxxxxx91116/article/details/50333161)  *
5. [分布式消息队列RocketMQ与Kafka架构上的巨大差异之2 -- CommitLog与ConsumeQueue](https://blog.csdn.net/gh670011677/article/details/75095469) **
6. [分布式开放消息系统(RocketMQ)的原理与实践](https://zhuanlan.zhihu.com/p/396726719)   CHEN川  ***  消息的顺序问题  消息的重复问题

7. [RocketMQ架构原理解析（三）：消息索引（ConsumeQueue & IndexFile）](https://blog.csdn.net/sjzsylkn/article/details/121897405) 未
8. [RocketMQ源码详解 | Broker篇 · 其二：文件系统](https://www.cnblogs.com/enoc/p/rocketmq-so-no-yon.html)  消息管理的结构层次  ***
9. [RocketMQ源码详解 | Broker篇 · 其三：CommitLog、索引、消费队列](https://www.cnblogs.com/enoc/p/rocketmq-so-no-gou.html)  未  
10. [【IT老齐134】请简述RocketMQ消息存储与检索原理](https://www.bilibili.com/video/BV173411H7JR/)       ***   
