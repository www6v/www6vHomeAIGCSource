---
title: Golang GMP
date: 2022-03-08 12:15:08
tags:
  - Golang
categories:
  - Golang
  - GMP 
---

<p></p>
<!-- more -->

##  Goroutine的调度


{% asset_img goroutine.JPG goroutine的调度 %}
**System Thread** : kernel entity
**Processor** : go实现的协程处理器
**Goroutine** : 协程


Processor在不同的系统线程里, 每个Processor挂载着一个协程队列，Processor依次调用Gorouine，
只有一个Gorouine是正在运行状态的。
case1: **一个协程运行时间运行的特别长**。 守护线程计数， 如果processor完成的goroutine数量一直不变。在这个协程的任务栈里插入一个中断的标记，读到这个中断标记后，goroutine会把自己中断下来插入到等待队列的队尾。
case2: **某个协程被io中断后**， Processer会把自己移动到另一个可用的系统线程当中， 执行队列里的任务。 
       当这个协程io中断被唤醒后，会把自己加入到某个Processor的队列里， 或者加入到全局的等待队列里。


+ 看参考文档里的图

{% asset_img  GMP.jpg  GMP  %}


+ 协程跟线程是有区别的，线程由 CPU 调度是抢占式的，协程由用户态调度是协作式的，一个协程让出 CPU 后，才执行下一个协程。

##### 调度器的设计策略
+ work stealing 机制
+ hand off 机制

## 参考：
1. [Golang的GMP原理与调度](https://blog.csdn.net/qq_44205272/article/details/111565957) ***

2. [#64 深入浅出 Golang Runtime 【 Go 夜读 】](https://www.bilibili.com/video/BV1oE411y7qG/)  goroutine ,  go network , gc *** 未

3. [Golang深入理解GPM模型](https://www.bilibili.com/video/BV19r4y1w7Nx?spm_id_from=333.880.my_history.page.click)  *** 未



