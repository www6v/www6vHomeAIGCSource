---
title: Golang Map
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
        快速定位key,以空间换时间
      - key
      - value
      - overflow
  + bmap

+ map的使用
  value没有任何的限制, key有严格的限制

+ 并发
  - 不可以并发读写
    可以并发读

+ 扩容
  - buckets && oldbuckets 

## 参考:
[Go面试题系列：Go map的底层实现原理](https://www.bilibili.com/video/BV1194y1o77s/?spm_id_from=pageDriver&vd_source=f6e8c1128f9f264c5ab8d9411a644036)
[16|复合数据类型：原始map类型的实现机制是这样的？]() TonyBai


