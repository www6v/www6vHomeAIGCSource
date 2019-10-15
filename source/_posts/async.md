---
title: 服务异步化总结
date: 2015-12-05 12:11:22
tags:
  - 服务化
  - 异步
  - 性能
categories:
  - 分布式 
  - 服务治理
  - 异步化   
---

{% asset_img  async.jpg  服务异步化总结 %}


并行范式   |  系统/语言  
:-:|:-:|:-:
线程和锁| Java
函数式(Future，Promise）| Java8 Streaming API, lambda表达式<br> Spark/Flink 算子<br> Clojure reducer
分离标识和状态| Clojure
Actor| Scala Actor, Akka 
CSP| Golang协程, Kotlin协程 


## 参考:

1. [google Guava包的ListenableFuture解析](http://ifeve.com/google-guava-listenablefuture/) 罗立树 
2. 谈谈服务化体系中的异步（上） 花钱的年华
3. [苏宁 11.11：如何基于异步化打造会员任务平台？-基于异步化的性能优化实践](https://www.infoq.cn/article/member-task-platform-practice)  葛苏杰
4. [Web服务请求异步化介绍（概念篇）](https://blog.csdn.net/cenwenchu79/article/details/5703430) 放翁（文初）  good
5. Java中的纤程库 - Quasar 鸟窝
6. [SEDA: An Architecture for Well-Conditioned, Scalable Internet Services](https://www.researchgate.net/publication/2391753_SEDA_An_Architecture_for_Well-Conditioned_Scalable_Internet_Services)

---
##### Reactive
7. [The introduction to Reactive Programming](https://github.com/benjycui/introrx-chinese-edition?utm_source=tuicool&utm_medium=referral)
8. [全面异步化：淘宝反应式架构升级探索](https://mp.weixin.qq.com/s/Cfg-7MzabvPOLWrrlTVXzA)
9. [Introduction to RSocket](https://www.baeldung.com/rsocket)
10. [我为什么不再推荐RxJava](https://juejin.im/post/5cd04b6e51882540e53fdfa2)
