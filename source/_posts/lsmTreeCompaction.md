---
title: LSM-Tree Compaction压缩策略
date: 2022-01-08 12:04:16
tags:
  - LSM-Tree
categories: 
  - 数据库
  - 基础  
---

<p></p>
<!-- more -->


## RUM猜想-三选二 [5]
  读取（Read）、更新（Update）和内存（Memory）
  {% asset_img  RUM.jpg  720 576  RUM猜想 %}

##   LSM-Tree 面临的三个问题  
+ 三个问题
  + 读放大 Read amplification ： 为了检索数据, 需要一层层的查找, 造成额外的磁盘IO操作
  + 写放大 Write amplification： 在合并过程中 不断地重写为新的文件， 从而导致写放大
  + 空间放大 Space amplification ：由于重复是允许的, 并且过期的数据不会被马上清除掉

## 评估和设计 compaction 策略的关键性能指标[1]
+ Compaction trigger：什么时候触发
+ Data layout：数据的物理存放方式是怎样的
   + leveling
   + tiering
+ Compaction granularity：每次移动多少数据量
+ Data movement policy：具体移动哪些data block

{% asset_img compaction-summary.png  LSM-Tree Compaction Summary %}

##  10 种 compaction 策略 
[todo]

## Compaction on Rocksdb
[level0 
level0+]

## 参考
1. [Research_R42.5 Constructing and Analyzing the LSM Compaction Design Space](https://www.bilibili.com/video/BV12U4y177g3)  论文 VLDB2021 bili
   [构建分析LSM Compaction Design Space](https://loopjump.com/pr-lsm-compaction-design-space/) ***
2. [VLDB 2021论文概述](https://zhuanlan.zhihu.com/p/413463723)   Overview
3. [rocksdb Compaction](https://github.com/facebook/rocksdb/wiki/Compaction)  ***
4. 《22｜RUM猜想：想要读写快还是存储省？又是三选二》 王磊 未
5. [Paper read: Designing Access Methods: The RUM Conjecture](https://zhuanlan.zhihu.com/p/404352955) ***