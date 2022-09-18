---
title: 异步化总结
date: 2015-12-05 12:11:22
tags:
  - 异步
categories:
  - 分布式 
  - 基础
  - 异步化   
---

<p></p>
<!-- more -->

{% asset_img  async.jpg  服务异步化总结 %}

## 一. 并行 范式/编程模型

并行 范式/编程模型  |  系统/语言  
:-:|:-:
线程和锁| Java
函数式(Future，Promise）| Java8 Streaming API, lambda表达式<br> Spark/Flink 算子<br> Clojure reducer
分离标识和状态| Clojure
Actor| Scala Actor, Akka 
CSP| Golang协程, Kotlin协程 
Reactive | RxJava<br> Flux (Reactor Core)<br> RSocket 

> ReactiveX: An API for asynchronous programming  with observable streams
> 响应式流（Reactive Stream）: 具备“异步非阻塞”特性和“流量控制”能力的数据流.
> RSocket 是一个支持 reactive-stream 语义的开源网络通信协议，它将 reactive 语义的复杂逻辑封装了起来，使得上层可以方便实现网络程序。

## 二. Java8、RxJava、Reactor比较[11]
<div style="text-align: center;">
	
![reactor](https://user-images.githubusercontent.com/5608425/66807471-a329d180-ef5b-11e9-9d8a-28724638916e.jpeg)
Java8、RxJava、Reactor比较  
</div>

> 核心特性 async，back-pressure(Stream)

## 参考:

1. [google Guava包的ListenableFuture解析](http://ifeve.com/google-guava-listenablefuture/) 罗立树 
2. 谈谈服务化体系中的异步（上） 花钱的年华
3. [苏宁 11.11：如何基于异步化打造会员任务平台？-基于异步化的性能优化实践](https://www.infoq.cn/article/member-task-platform-practice)  葛苏杰
4. [Web服务请求异步化介绍（概念篇）](https://blog.csdn.net/cenwenchu79/article/details/5703430) 放翁（文初）  good
5. Java中的纤程库 - Quasar 鸟窝
6. [SEDA: An Architecture for Well-Conditioned, Scalable Internet Services](https://www.researchgate.net/publication/2391753_SEDA_An_Architecture_for_Well-Conditioned_Scalable_Internet_Services)
13. 《七周七并发》

---
##### Reactive，ReactiveX
7. [The introduction to Reactive Programming](https://github.com/benjycui/introrx-chinese-edition?utm_source=tuicool&utm_medium=referral)
8. [全面异步化：淘宝反应式架构升级探索](https://mp.weixin.qq.com/s/Cfg-7MzabvPOLWrrlTVXzA)
9. [Introduction to RSocket](https://www.baeldung.com/rsocket)
10. [我为什么不再推荐RxJava](https://juejin.im/post/5cd04b6e51882540e53fdfa2)
11. [八个层面比较 Java 8, RxJava, Reactor](https://cloud.tencent.com/developer/article/1356284) good
12. [reactivex 官网](http://reactivex.io/)
13. [reactive-streams-jvm git](https://github.com/www6v/reactive-streams-jvm)
14. [Reactive Streams](http://www.reactive-streams.org/)
15. [（1）什么是响应式编程——响应式Spring的道法术器](https://blog.csdn.net/get_set/article/details/79455258) 未
16. [（2）响应式流——响应式Spring的道法术器](https://blog.csdn.net/get_set/article/details/79466402) 未