---
title: 异步化 总结
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

## 目录
<!-- toc -->

{% asset_img  async.jpg  服务异步化总结 %}

# 异步编程范式-Callback [0]
### Continuation == 回调函数 
  + 编程模式    Continuation-passing style（CPS）
    1. 把调用者 f() 还未执行的部分包成一个函数对象 cont，一同传给被调用者 g()；
    2. 正常运行 g() 函数体；
    3. g() 完成后，连同它的结果一起回调 cont，从而继续执行 f() 里剩余的代码。
       {% asset_img  'CSP.jpg' %}  
 
### Callback实现 
  而异步 IO 中，进程发起 IO 操作时也会一并输入回调（也就是 Continuation），这大大解放了生产力 —— **现场无需等待，可以立即返回去做其他事情**。一旦 IO 成功后，AIO 的 Event Loop 会调用刚刚设置的回调函数，把剩下的工作完成。这种模式有时也被称为 Fire and Forget。
  通过实现的 Continuation，**线程不再受 IO 阻塞，可以自由自在地跑满 CPU**。
  
### Callback语法糖：Promise
  **Promise 是对异步调用结果的一个封装**，在 Java 中它叫作 **CompletableFuture**  或者 **ListenableFuture** (Guava)。
  Promise 改善了 Callback 的可读性，也让异常处理稍稍优雅了些。
  
### 反应式编程(Promise 的极大增强)  
  相比 Promise，反应式引入了流（Flow）的概念。 


# 异步编程范式- Coroutine [0]
### CPS 变换：Coroutine 与 async/await
在异步函数调用时加上 await，编译器就会自动把它转化为协程（Coroutine），而非昂贵的线程。

### 用户态线程
goroutine 

#  并行 范式/编程模型
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


#  Java8、RxJava、Reactor比较[11]
{%   asset_img    reactor.jpeg     Java8、RxJava、Reactor比较  %}

+ 核心特性 async，back-pressure(Stream)


# 参考
0. [异步编程的几种方式 ](http://ericfu.me/several-ways-to-aync/) *** 
1. [google Guava包的ListenableFuture解析](http://ifeve.com/google-guava-listenablefuture/) 罗立树 
2. 谈谈服务化体系中的异步（上） 花钱的年华
3. [苏宁 11.11：如何基于异步化打造会员任务平台？-基于异步化的性能优化实践](https://www.infoq.cn/article/member-task-platform-practice)  葛苏杰
4. [Web服务请求异步化介绍（概念篇）](https://blog.csdn.net/cenwenchu79/article/details/5703430) 放翁（文初）  ***
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