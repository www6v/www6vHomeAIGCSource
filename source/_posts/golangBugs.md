---
title: Golang 基础-Errors&Bugs
date: 2022-07-07 11:59:53
tags:
  - Golang
categories:
  - Golang
  - 基础
---

<p></p>
<!-- more -->


## 目录
<!-- toc -->


# Errors
### 异常处理 [4]

# Bugs
+ Golang 循环变量引用问题[7]

# 故障 [20]
CPU 用爆了？ 90%？
内存用爆了？OOM？
Goroutine 用爆了？ 80w？
线程数爆了？
延迟太高？



# 监控指标 [20]
+ goroutine数，线程数
  - goroutine 多， 通过pprof看goroutine在干啥，等锁
+ GC频率
  ``` go
    GODEBUG='gctrace=1' go run ./cmd/main.go 
  ```
+ MemStats 结构体
  - 常规统计信息（General statistics）
  - 分配堆内存统计（Heap memory statistics）
  - 栈内存统计（Stack memory statistics）
  - 堆外内存统计信息（Off-heap memory statistics）
  - 垃圾回收器统计信息（Garbage collector statistics）
  - 按 per-size class 大小分配统计（BySize reports per-size class allocation statistics）


# 问题排查套路 [20]
+ 阻塞问题
  + 排除外部问题
    例如依赖的上游服务(db, redis, mq)延迟过高，在监控系统中查看
  + 锁阻塞
    - 减少临界区范围
    - 降低锁粒度
      - Global lock -> sharded lock
      - Global lock -> connection level lock
      - Connection level lock -> request level lock
    - 同步改异步
      - 日志场景: 同步日志 -> 异步日志
      - Metric 上报场景: select -> select+default
    - 个别场景使用双buffer 完全消灭阻塞

+ CPU占用过高
  看CPU profile -> 优化占用CPU较多的部分逻辑
  + 应用逻辑导致
    - Json序列化
    - MD5算法hash成本太高 -> 使用cityhash, murmurhash
    - 其他应用逻辑 -> 只能case by case分析
  + GC使用CPU过高
    - 减少堆上对象分配
      - sync.Pool 进行堆对象重用
      - Map -> slice
      - 指针 -> 非指针对象
      - 多个小对象 -> 合并为一个大对象
    - offheap
    - 降低GC频率
      - 修改GOGC
      - Make 全局大slice
  + 调度相关的函数使用CPU过高
    - 尝试使用goroutine pool 减少goroutine的创建与销毁
    - 控制最大 goroutine数量

+ 内存占用过高
  - 看prometheus 
      + 内存RSS是多少
        oomkiller
      + goroutine数量多少
        普通任务 - goroutine不多， 重点关注heap profile中的inuse
        定时任务类 - 需要看alloc
      + goroutine栈占用多少
   + 堆内存 占用内存空间过高
     - sync.Pool 对象复用
     - 为不同大小的对象提供不同大小level的sync.Pool  (参考fasthttp)
     - offheap
   + goroutine栈占用过多内存
     - 减少goroutine数量
       + 如每个连接一读一写  -> 合并为一个连接一个goroutine
       + goroutine pool 限制最大 goroutine数量[21]
       + 使用裸 epoll库(evio, gev等) 修改网络编程方式(只适用于对延迟不敏感的业务)
     - 通过修改代码， 减少函数调用层级(难)

+ goroutine数量过多
  - 从profile网页去看 goroutine在干什么
    查死锁 阻塞问题
    不在意延迟的选择第三方库优化


# go压测工具
+ wrk
+ wrk2
+ Vegeta
+ ghz


# 参考
+  4. [【go实战系列五】 go1.19.2与pkg中error如何wrap与unwrap Errors | 将error进行wrap向上处理思想 | pkg/errors](https://blog.csdn.net/wanglei19891210/article/details/128092331)
+  7. [随笔：Golang 循环变量引用问题以及官方语义修复](https://cloud.tencent.com/developer/article/2240620)
+  20. 《28 直播：服务上线后 - 成为 Go 语言性能调优专家》 
+  21. {% post_link 'golangConcurrency' %} self

