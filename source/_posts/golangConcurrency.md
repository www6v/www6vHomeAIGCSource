---
title: Golang Concurrency
date: 2022-06-19 12:22:27
tags:
  - Golang
categories:
  - Golang 
  - Concurrency
---

<p></p>
<!-- more -->


## 目录
<!-- toc -->


## 并发 [2][1]
##### 并发原语
+ sync.Once [3]
  - 保证在 Go 程序运行期间的某段代码只会执行一次

+ sync.Pool [3]
  + 两种场景中可以使用Pool做优化
    - 进程中的inuse-objects数过多,  gc mark 消耗大量CPU
    - 进程中的inuse-objects数过多, 进程RSS占用过高
  + 最佳实践
    请求生命周期开始时，pool.Get, 请求结束时, pool.Put

+ semaphore 信号量 [3]
  - 是锁的实现基础, 所有同步原语的基础设施
  - 内部结构
    + treap tree+heap
      - 二插搜索树
        树上的每个节点都是一个链表
      - 小顶堆
  
+ sync.Mutex  互斥锁 [3]
   - 内部结构
     + state
       饥饿模式:  最新进自旋的goroutine优先级最高
       非饥饿模式:  排队
     + sema 信号量
   
+ sync.RWMutex 读写锁 [3]
   - 内部结构
     + w
     + writerSem
     + readerSem
     + readerCount
     + readerWait

+ sync.Map  [3]
  - 线程安全的Map
  - 内部结构
    + mu
    + read
    + dirty
    + misses
  - 设计
    + map+lock 多核扩展性差一点
    + sync.Map 在读多写少的情况下，基本上不需要加锁
  
+ sync.WaitGroup   [3]
  - 等待一组 Goroutine 的返回
  - 内部结构
    + state1

+ sync.Cond
  - 让一组的 Goroutine 都在满足特定条件时被唤醒

+ sync.Context
  - 进行上下文信息传递、提供超时和取消机制、控制子 goroutine 的执行

##### Context
进行上下文信息传递、提供超时和取消机制、控制子 goroutine 的执行
``` golang
 func WithCancel(parent Context) (ctx Context, cancel CancelFunc) 
 func WithDeadline(parent Context, d time.Time) (Context, CancelFunc) 
 func WithTimeout(parent Context, timeout time.Duration) (Context, CancelFunc) 
```
[context](https://pkg.go.dev/context)

## 应用&扩展
##### 控制 goroutine 的并发数量 [5]

##### 并发编程模式 [3][4]
+ fan-in
  合并两个channel
+ or channel 
  多个channel有任一个channel有返回,  就直接返回这个值。
+ pipeline
 串联在一起的channel 

##### 扩展并发原语 
errgroup 
Semaphore
SingleFlight


## 参考
1. [GOLANG ROADMAP](https://www.golangroadmap.com/class/gointerview/)
    [GOLANG ROADMAP](https://www.golangroadmap.com/)  
    邀请码：caspar 
    邀请码：Gopher-10645-1382
2. 《Go 并发编程实战课》 极客时间  鸟窝
3. 《15 辅导 + 案例分析 + 答疑-更多课程》  体系课_Go高级工程师实战营(完结) 
4. << 14 | Channel：透过代码看典型的应用模式 >>   Go 并发编程实战课  鸟窝
5. [1.6 来，控制一下 goroutine 的并发数量](https://eddycjy.gitbook.io/golang/di-1-ke-za-tan/control-goroutine)