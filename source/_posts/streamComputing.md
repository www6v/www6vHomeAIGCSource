---
title: Flink和Spark对比
date: 2019-07-19 07:37:56
tags:
  - flink
  - spark  
categories: 
  - 大数据
  - 流式计算
  - 对比总结    
---


特性 | spark | flink
:-: | :-: | :-: 
本质 |  batch |  event 
State | RDD |  Keyed State(Value, List, Map) <br> Operator State(List)
算子 | Transformation<br> Action |  Source<br> Transform<br> Sink 
API | 1.SparkSQL(DataFrame， DataSet)<br> 2. Spark Streaming <br> | 1. Table<br> 2. DataStream <br> 3.DataSet    
Time | 无 | Event Time<br> Ingestion Time<br> Processing Time
Windows | Sliding  | Tumbling<br> Sliding <br> Session
可靠性 | linage<br> master checkpoint|  Savepoint<br>External Checkpoint


## 参考:
1. [Apache Flink状态管理和容错机制介绍](https://www.iteblog.com/archives/2417.html)
2. [Streaming System 第二章：The What- Where- When- and How of Data Processing](https://yq.aliyun.com/articles/674450) 未
3. [Streaming System 第三章：Watermarks](https://yq.aliyun.com/articles/682873) 未