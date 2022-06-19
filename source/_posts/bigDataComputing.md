---
title: 大数据 计算Computing
date: 2022-06-17 22:55:22
tags:
  - 计算
categories: 
  - 大数据 
  - 计算 
  - 总结  
---

<p></p>
<!-- more -->


计算能力| 数据来源 | 数据处理方式 | 底层框架 | 延迟性
:-:|:-:|:-:|:-:|:-:
批计算 | 历史数据 | 批处理 | MapReduce <br> Spark  | 要求不高 
流计算 | 源源不断的流式数据 | 微批处理 & 逐条处理 | Spark Streaming<br>Flink |  毫秒/秒级延迟
在线查询 | 历史数据 | 逐条处理/检索过滤 | ES <br> Redis | 毫秒
ad-hoc 即席分析| 历史数据 | 批处理/聚合 | Impala <br> Kylin <br> ClickHouse | 毫秒/秒级延迟


## 参考：
《数据中台 - 让数据用起来》
