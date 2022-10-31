---
title: RocketMQ总结
date: 2019-06-18 14:39:50
tags:
  - 消息系统
  - RocketMQ
categories:
  - 分布式 
  - 中间件
  - 消息系统
  - RocketMQ   
---

<p></p>
<!-- more -->

关键词: 顺序消息[6][9][10], 重复消息, 事务消息, 消息存储

{% asset_img  rocketMQ.jpg  RocketMQ %}


## 参考:

1. [Apache RocketMQ背后的设计思路与最佳实践](https://yq.aliyun.com/articles/71889?spm=5176.100239.blogcont55626.10.FWVVKw) 阿里 冯嘉
2. [十分钟入门RocketMQ](https://yq.aliyun.com/articles/66101?spm=5176.100239.blogcont55634.18.ODias7)  阿里 尘央
3. [RocketMQ 关键特性](https://yq.aliyun.com/articles/66110?spm=a2c4e.11155435.0.0.2cb97b3fBOIG8W)
4. [《RocketMq》二、存储篇](https://blog.csdn.net/xxxxxx91116/article/details/50333161)
5. [分布式消息队列RocketMQ与Kafka架构上的巨大差异之2 -- CommitLog与ConsumeQueue](https://blog.csdn.net/gh670011677/article/details/75095469)
6. [分布式开放消息系统(RocketMQ)的原理与实践](https://www.jianshu.com/p/453c6e7ff81c)   CHEN川  good
7. [RocketMQ 4.3正式发布，支持分布式事务](https://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=2651008627&idx=1&sn=a308010e080e1aa7784abb4a1bcaadb7&chksm=bdbed6208ac95f3614f4055821e870882ea207e8a58af48f043e78cb4391e6f1206b41f86a88&scene=27#wechat_redirect)
8. [中台战略](https://www6v.github.io/www6vHomeHexo/2019/05/02/middleStage/) self
9. [聊一聊顺序消息（RocketMQ顺序消息的实现机制）](https://www.cnblogs.com/hzmark/p/orderly_message.html)  杭州.Mark
   producer: selector, 相同orderid的发送到同一个topic;
   consumer: 多消费者加锁竞争消息
10. [收发顺序消息](https://help.aliyun.com/document_detail/49323.html)  阿里云文档



