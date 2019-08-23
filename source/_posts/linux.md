---
title: Linux总结
date: 2019-08-22 15:46:10
tags:
  - linux
categories:
  - 性能
  - linux   
---

<p hidden></p>
<!-- more -->


<div style="text-align: center;">

![内核体系结构](https://user-images.githubusercontent.com/5608425/63564514-e5f0ae00-c597-11e9-9d32-985d0771c207.png) 内核体系结构

![系统调用](https://user-images.githubusercontent.com/5608425/63564517-e721db00-c597-11e9-86eb-2e5d502a2c52.jpg)  系统调用

![进程执行](https://user-images.githubusercontent.com/5608425/63564515-e6894480-c597-11e9-90c2-eba751ad0c08.jpg) 进程执行

![文件的数据结构](https://user-images.githubusercontent.com/5608425/63564376-6e228380-c597-11e9-8e74-97768f54c984.jpg)   文件的数据结构

</div>

一. 内核初始化
+ Systemd 1号进程在用户态将运行一个用户进程, 1号进程和子进程形成一棵进程树。
+ 内核态2号进程： 使用 kernel_thread 函数创建进程。  线程 == 轻量级进程

二. 调度策略
+ 实时调度策略
  SCHED_FIFO、SCHED_RR、SCHED_DEADLINE
+ 普通调度策略
  SCHED_NORMAL、SCHED_BATCH、SCHED_IDLE
+ 完全公平调度算法
  CFS: Completely Fair Scheduling 
+ 调度方式
  主动调度, 抢占式调度  


## 参考：
1. [趣谈Linux操作系统 - 03 你可以把Linux内核当成一家软件外包公司的老板]()   刘超
2. [趣谈Linux操作系统 - 08_内核初始化：生意做大了就得成立公]()    刘超
3. [趣谈Linux操作系统 - 10_进程：公司接这么多项目，如何管]()   刘超
4. [趣谈Linux操作系统 - 15-调度（上）：如何制定项目管理流程？]()  刘超
6. [趣谈Linux操作系统 - 29-虚拟文件系统：文件多了就需要档案管理系统]()   刘超









 
