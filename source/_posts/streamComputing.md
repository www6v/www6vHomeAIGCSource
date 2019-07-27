---
title: flink & spark
date: 2019-07-19 07:37:56
tags:
  - flink
  - spark  
categories: 
  - 流计算    
---


特性 | spark | flink
:-: | :-: | :-: 
本质 |  batch |  event 
State | RDD |  Keyed State(Value, List, Map) <br> Operator State(List)
算子 | Transformation<br> Action |  Source<br> Transform<br> Sink 
API | SparkSQL， DataFrame， DataSet<br> Spark Streaming <br> | Table<br> DataStream <br> DataSet    
Time | 无 | Event Time<br> Ingestion Time<br> Processing Time
Windows | Sliding  | Tumbling<br> Sliding <br> Session
可靠性 | linage<br> master checkpoint|  Savepoint<br>External Checkpoint


## 参考:
1. [Apache Flink状态管理和容错机制介绍](https://www.iteblog.com/archives/2417.html)