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

## 总结 [4]

| JOIN 类型                   | 触发join | 场景                                                         | 实时性 | 准确度                       | 内存占用                     | waterrmark                              | 时间属性           |
| --------------------------- | -------- | ------------------------------------------------------------ | ------ | ---------------------------- | ---------------------------- | --------------------------------------- | ------------------ |
| 双流join                    | **双流** | 每一个数据流有变更都会触发join，并且状态会保存               | 高     | 先低后高（逐步更新）         | 高（需要设置状态生存时间）   | 否                                      | 事件时间、处理时间 |
| 时间区间 JOIN               | **双流** | 拥有相同key且 事件时间处于 lowerBoundTime 和 upperBoundTime之间的元素进行join | 中     | 中（取决于区间大小）         | 中（取决于区间大小）         | 是（都需要）                            | 事件时间、处理时间 |
| 时态表 JOIN（版本表）       | 单流     | 单流和版本表的join，具有历史版本状态管理功能。流表：事件时间，版本表：事件时间和主键 | 中     | 高（取决于具体实现）         | 高（取决于版本表大小 ）      | 是（都需要）                            | 事件时间           |
| 时态表 JOIN（Join Lookup ） | 单流     | 单流和维表的join，join要求一个表具有处理时间属性（流表），另一个表由查找源连接器支持（维表，实现了LookupableTableSource） | 高     | 高（取决于是否缓存、异步等） | 低（取决于是否缓存、异步等） | 是（流表）                              | 处理时间           |
| JOIN LATERAL                | 单流     | 单流和UDTF的join。JOIN LATERAL 的右边不是一个物理表，而是一个视图（view）或者Table-valued Funciton。不具备状态管理功能 | 高     | 高（取决于是否缓存、异步等） | 低（取决于是否缓存、异步等） | 否                                      |                    |
| 窗口 JOIN                   | **双流** | 相同key且位于相同时间窗口的元素进行 join                     | 低     | 低（取决于窗口大小和类型）   | 中（取决于窗口大小）         | 是（都需要）watermark取双流中较慢的为准 | 事件时间、处理时间 |



## 参考

1. [Flink中的双流Join详解](https://blog.csdn.net/m0_49834705/article/details/119421944)
2. [面试高频|趣味Flink双流JOIN](https://zhuanlan.zhihu.com/p/452924664)
3. [流处理系统中状态的表示和存储](https://www.skyzh.dev/posts/articles/2022-01-15-store-of-streaming-states/) *** 未
  + Full State - 算子维护自己的完整状态      
    - Join State 的存储
    - Aggregation State 的存储
    - 总结  
4. [大厂案例|基于Flink实现跨库JOIN的数据同步预研方案](https://mp.weixin.qq.com/s/Sc1tgBWPVfGIcVuYr-UrKA)  ***   