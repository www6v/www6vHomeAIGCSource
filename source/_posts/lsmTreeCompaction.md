---
title: LSM-Tree Compaction压缩
date: 2022-01-08 12:04:16
tags:
  - LSM-Tree
categories: 
  - 数据库
  - 基础  
---

<p></p>
<!-- more -->

## 放大 
+ Read amplification 读放大：完成每次读请求所需要的额外读盘次数。
+ Write amplification 写放大：完成每次写请求所需要的额外写盘数据。
+ Space amplification 空间放大：存放一定数据所需要的额外存盘空间。

## 评估和设计 compaction 策略的关键性能指标[1]
+ 压缩触发器
+ 数据布局(Data Layout)
   + leveling
   + tiering
+  压缩粒度
+  数据移动策略

{% asset_img compaction-summary.png  LSM-Tree Compaction Summary %}

##  10 种 compaction 策略[todo]


## 参考
1. [Research_R42.5 Constructing and Analyzing the LSM Compaction Design Space](https://www.bilibili.com/video/BV12U4y177g3?vd_source=f6e8c1128f9f264c5ab8d9411a644036)  论文 VLDB2021 bili
2. [构建分析LSM Compaction Design Space](https://loopjump.com/pr-lsm-compaction-design-space/) ***
3. [VLDB 2021论文概述](https://zhuanlan.zhihu.com/p/413463723)   Overview