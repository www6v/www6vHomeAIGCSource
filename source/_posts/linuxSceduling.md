---
title: Linux 调度
date: 2022-05-29 17:24:17
tags:
  - kernel
categories:
  - linux 
  - kernel   
  - 调度
---

<p></p>
<!-- more -->


## 操作系统中有
+ 进程调度器（Process Scheduler）、
+ 网络调度器（Network Scheduler）和 
+ I/O 调度器（I/O Scheduler）

##  进程调度策略
+ 实时调度策略
  SCHED_FIFO、SCHED_RR、SCHED_DEADLINE
+ 普通调度策略
  SCHED_NORMAL、SCHED_BATCH、SCHED_IDLE
+ 完全公平调度算法
  CFS: Completely Fair Scheduling 
+ 调度方式
  主动调度, 抢占式调度

## 进程调度分类
+ 短期调度
+ 中期调度
+ 长期调度


## Linux的IO调度算法
+ Deadline 
+ CFQ 
+ Noop

## 参考：
+ [趣谈Linux操作系统 - 15-调度（上）：如何制定项目管理流程？]()  刘超
+ [调度系统设计精要](https://draveness.me/system-design-scheduler/)