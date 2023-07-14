---
title: DPDK
date: 2022-01-25 22:45:02
tags:
  - linux
categories:
  - linux 
  - kernel
  - DPDK
---

<p></p>
<!-- more -->


## DPDK的优化方式
+ cache和内存
  huge page，cacheline align， 线程绑定， 预取， NUMA 
+ 并行计算
  - 多核
  - 亲和性
  - 指令并发与数据并行
    SIMD 单指令多数据
+ 流分类 多队列
  - 网卡多队列  多队列网卡
     不同核操作不同的队列
  - 流分类
     RSS  

## DPDK可以调用的内核接口
  KNI（Kernel NIC Interface）      

## 参考
1. [为什么dpdk越来越受欢迎，看完以后，让人醍醐灌顶](https://www.bilibili.com/video/BV1cy4y117UG?spm_id_from=333.880.my_history.page.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036)  V
2. <<深入浅出DPDK>>