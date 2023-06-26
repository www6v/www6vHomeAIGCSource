---
title: Golang内置类型-Map
date: 2022-09-22 14:05:36
tags:
  - Golang
categories:
  - Golang
  - 基础
---

<p></p>
<!-- more -->

## Map

{% asset_img golang-map.jpg Golang Map %}

+ map的内部实现
  + hmap
    + bucket
      - topHash
        **快速定位key,以空间换时间**
        每个 bucket 的 tophash 区域其实是用来快速定位 key 位置的. 这是一种以空间换时间的思路。
      - key
      - value
        Go 运行时采用了**把 key 和 value 分开存储的方式，而不是采用一个 kv 接着一个 kv 的 kv 紧邻方式存储**，这带来的其实是算法上的复杂性，但却减少了因内存对齐带来的内存浪费。
      - overflow
  + bmap

+ map的使用
  value没有任何的限制, key有严格的限制

+ 并发
  - 不可以并发读写
    可以并发读

+ 扩容 [2]
  - buckets && oldbuckets 
  - **两种扩容方式 [渐进式扩容, 类似redis rehash]**
    - 因为 overflow bucket 过多导致的“扩容”，实际上运行时会新建一个和现有规模一样的 bucket 数组，然后在 assign 和 delete 时做排空和迁移。
    - 因为当前数据数量超出 LoadFactor 指定水位而进行的扩容，那么运行时会建立一个两倍于现有规模的 bucket 数组，但真正的排空和迁移工作也是在 assign 和 delete 时逐步进行的。

## 参考:
+ [Go面试题系列：Go map的底层实现原理](https://www.bilibili.com/video/BV1194y1o77s/?spm_id_from=pageDriver&vd_source=f6e8c1128f9f264c5ab8d9411a644036)
+ [16|复合数据类型：原始map类型的实现机制是这样的？]() TonyBai

