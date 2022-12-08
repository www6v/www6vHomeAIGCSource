---
title: Flink Checkpoint
date: 2022-02-03 21:31:11
tags:
  - flink
categories: 
  - 大数据 
  - 计算  
  - 流式计算 
  - flink
---

<p></p>
<!-- more -->


##  CheckPoint的保存
  **当所有任务都恰好处理完一个相同的输入数据的时候，将它们的状态保存下来**

## 从CheckPoint恢复状态
（1）重启应用
（2）**读取检查点，重置状态**
（3）**重放数据**
    重置偏移量
（4）继续处理数据

## CheckPoint 算法
+  检查点的“分界线”（Checkpoint Barrier） 
watermark 指示的是“之前的数据全部到齐了”，而 barrier 指示的是“之前所有数据的状
态更改保存入当前检查点”：它们都是一个“截止时间”的标志。

+ 分布式快照算法
  - Flink 使用了 Chandy-Lamport 算法的一种变体，被称为“异步分界线快照” (asynchronous barrier snapshotting)算法。
  - 算法的核心两个原则:
    1. 当上游任务向多个并行下游任务发送 barrier 时，需要广播出去;
    2. 而当多个上游任务向同一个下游任务传递 barrier 时， 需要在下游任务执行“分界线对齐”(barrier alignment)操作，也就是需要等到所有并行分区 的 barrier 都到齐，才可以开始状态的保存。

## 参考：
1. 尚硅谷 flink(Java) - bilibili 
    《尚硅谷大数据技术之flink（java）》 第 10 章 容错机制

