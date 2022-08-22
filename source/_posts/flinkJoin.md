---
title: Flink 双流Join
date: 2022-01-22 11:26:05
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

## 双流Join

##### 基于窗口的JOIN操作 
+ Window Join
  + Tumbling Window Join
  + Sliding Window Join
  + Session Widnow Join
+ Interval Join

> Flink是通过State状态来缓存等待join的实时流

#####  基于原生State的Connect算子操作 


## 参考
[Flink中的双流Join详解](https://blog.csdn.net/m0_49834705/article/details/119421944)
[面试高频|趣味Flink双流JOIN](https://zhuanlan.zhihu.com/p/452924664)