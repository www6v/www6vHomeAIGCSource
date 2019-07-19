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
State | RDD |  keyed State(Value, List, Map)&& operator State(List)
算子 | Transformation, Action |  Source, Transform, Sink 
API | DataFrame，DataSet | Table, DataStream + DataSet    
Time |  | Event Time,Ingestion Time, Processing Time
Windows | Sliding  | Tumbling, Sliding , Session
可靠性 | linage， master checkpoint|  Savepoint，External Checkpoint


## 参考:
1. [Apache Flink状态管理和容错机制介绍](https://www.iteblog.com/archives/2417.html)