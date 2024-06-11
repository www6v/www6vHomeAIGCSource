---
title: (原理)推理 Ray
date: 2023-06-11 09:16:45
tags:
  - infer
categories: 
  - AIGC
  - infer 
---

<p></p>
<!-- more -->


# Architecture Overview
### Application concepts [1]
+ Task - A remote function invocation. 
+ Object - An application value.
+ Actor - a stateful worker process (an instance of a `@ray.remote` class).
+ Driver - The program root, or the “main” program.
+ Job - The collection of tasks, objects, and actors originating (recursively) from the same driver, and their runtime environment.

### Design [1]
+ Components
  - One or more worker processes
  - A raylet. 
    - scheduler
    - object store
  - head node
    - Global Control Service (GCS)
    - driver process(es)
    - cluster-level services


# Spark vs. Ray[10]

+ 总的来说，Ray和Spark的主要差别在于他们的**抽象层次**。**Spark**对并行进行抽象和限制，不允许用户编写真正并行的应用，从而使框架有更多的控制权。**Ray**的层次要低得多，虽然给用户提供了更多灵活性，但更难编程。可以说，**Ray揭示和暴露了并行，而Spark抽象和隐藏了并行**。

+ 就架构而言，**Spark**采用**BSP模型**，是无副作用的，而**Ray**本质上是一个**RPC 框架+Actor框架+对象存储**。

# 参考
1xx. [基于 Ray 的大规模离线推理](https://developer.volcengine.com/articles/7241442880106004536) 字节
   [字节跳动基于 Ray 的大规模离线推理](https://mp.weixin.qq.com/s/mU2RymHIHj8mJiDWBUAdWA)


1xx. [Ray Design Patterns](https://docs.google.com/document/d/167rnnDFIVRhHhK4mznEIemOtj63IOhtIPvSYaPgI4Fg/edit#heading=h.eg7m6lz2y48u) 查看->模式

1xx. [大模型训练部署利器--开源分布式计算框架Ray原理介绍](https://blog.csdn.net/2401_83124266/article/details/136428395)

### Spark vs. Ray
10. [加州大学伯克利分校为何能连续孵化出 Mesos,Spark,Alluxio,Ray 等重量级开源项目?](https://www.zhihu.com/question/432813259/answer/2335473370) 孙挺Sunt

1xx. [分布式领域计算模型及Spark&Ray实现对比](https://blog.csdn.net/junerli/article/details/138476201)

### Internal
1. [Ray v2 Architecture](https://docs.google.com/document/d/1tBw9A4j62ruI5omIJbMxly-la5w4q_TjyJgJL_jN2fI/preview#heading=h.iyrm5j2gcdoq)

1xx. [Ray 分布式计算框架介绍](https://zhuanlan.zhihu.com/p/111340572)

1xx. [Ray 1.0 架构解读](https://zhuanlan.zhihu.com/p/344736949)

