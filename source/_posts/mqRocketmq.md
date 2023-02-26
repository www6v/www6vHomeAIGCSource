---
title: RocketMQ总结
date: 2019-06-18 14:39:50
tags:
  - 消息系统
categories:
  - 消息系统
  - RocketMQ   
---

<p></p>
<!-- more -->

关键词: 顺序消息[6][9][10], 重复消息, 事务消息

{% asset_img  rocketMQ.jpg  RocketMQ %}


## 参考:
##### Overview
1. [Apache RocketMQ背后的设计思路与最佳实践](https://yq.aliyun.com/articles/71889?spm=5176.100239.blogcont55626.10.FWVVKw) 阿里 冯嘉
2. [十分钟入门RocketMQ](https://yq.aliyun.com/articles/66101?spm=5176.100239.blogcont55634.18.ODias7)  阿里 尘央
3. [RocketMQ 关键特性](https://yq.aliyun.com/articles/66110?spm=a2c4e.11155435.0.0.2cb97b3fBOIG8W) ***

4. xxx
5. xxx
6. [分布式开放消息系统(RocketMQ)的原理与实践](https://zhuanlan.zhihu.com/p/396726719)   CHEN川  ***  消息的顺序问题  消息的重复问题

##### 事务
7. [RocketMQ 4.3正式发布，支持分布式事务](https://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=2651008627&idx=1&sn=a308010e080e1aa7784abb4a1bcaadb7)
8. {%  post_link 'middleStage' %}  self

##### 顺序消息
9. [聊一聊顺序消息（RocketMQ顺序消息的实现机制）](https://www.cnblogs.com/hzmark/p/orderly_message.html)  杭州.Mark
   producer: selector, 相同orderid的发送到同一个topic;
   consumer: 多消费者加锁竞争消息
10. [收发顺序消息](https://help.aliyun.com/document_detail/49323.html)  阿里云文档



