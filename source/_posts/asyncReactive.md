---
title: 异步化 Reactive
date: 2022-07-21 13:31:54
tags:
  - 异步化
categories:
  - 分布式
  - 基础
  - 异步化
---

<p></p>
<!-- more -->



## 目录
<!-- toc -->

# Reactive

 + ReactiveX 
   An API for asynchronous programming  with observable streams
 + 响应式流（Reactive Stream） 
   具备“异步非阻塞”特性和“流量控制”能力的数据流.
 + RSocket 
    是一个支持 reactive-stream 语义的开源网络通信协议，它将 reactive 语义的复杂逻辑封装了起来，使得上层可以方便实现网络程序。

#  Java8、RxJava、Reactor比较[11]

{%   asset_img    reactor.jpeg     Java8、RxJava、Reactor比较  %}

+ 核心特性 async，back-pressure(Stream)



# 全异步化
+ 全异步化(基于消息和事件)【7,8】
	- 框架  Akka （Actor+mailbox）
	- 库  RxJava (Observable+event) 
	- 协议 RSocket 

# 参考
##### Reactive，ReactiveX
7. [The introduction to Reactive Programming](https://github.com/benjycui/introrx-chinese-edition?utm_source=tuicool&utm_medium=referral)
8. [全面异步化：淘宝反应式架构升级探索](https://mp.weixin.qq.com/s/Cfg-7MzabvPOLWrrlTVXzA)
9. [Introduction to RSocket](https://www.baeldung.com/rsocket)
10. [我为什么不再推荐RxJava](https://juejin.im/post/5cd04b6e51882540e53fdfa2)
11. [八个层面比较 Java 8, RxJava, Reactor](https://cloud.tencent.com/developer/article/1356284) good
12. [reactivex 官网](http://reactivex.io/)
13. [reactive-streams-jvm git](https://github.com/www6v/reactive-streams-jvm)
14. [Reactive Streams](http://www.reactive-streams.org/)
100. [（1）什么是响应式编程——响应式Spring的道法术器](https://blog.csdn.net/get_set/article/details/79455258) 未
101. [（2）响应式流——响应式Spring的道法术器](https://blog.csdn.net/get_set/article/details/79466402) 未
