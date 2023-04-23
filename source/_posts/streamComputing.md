---
title: 流式计算-Flink vs. Spark
date: 2019-07-19 07:37:56
tags:
  - flink
  - spark  
categories: 
  - 大数据
  - 计算  
  - 流式计算
  - 对比总结    
---

<p></p>
<!-- more -->

### Flink vs. Spark

特性  | Flink | Spark 
---|---|----
本质 |  event |  batch 
State |  Keyed State(Value, List, Map) <br> Operator State(List)| RDD 
算子[What] |  Source<br> Transform<br> Sink | Transformation<br> Action 
API [What] | 1. Table<br> 2. DataStream <br> 3.DataSet    | 1.SparkSQL(DataFrame， DataSet)<br> 2. Spark Streaming <br> 
Time[When] | Event Time<br> Ingestion Time<br> Processing Time| 无 
Windows[Where] | Tumbling<br> Sliding <br> Session| Sliding <br> batchDuration,windowDuration,slideDuration  
可靠性 |  Savepoint<br>External Checkpoint| linage<br> master checkpoint



###  Beam vs. Flink vs. Spark  [6]
+ What

|                     | Beam model | Flink | Spark |
| ------------------: | :--------: | :---: | :---: |
| ParDo               | √          | √     | √     |
| GroupByKey          | √          | √     | ~     |
| Flatten             | √          | √     | √     |
| Combine             | √          | √     | √     |
| Composite Transfrom | √          | ~     | ~     |
| Side Inputs         | √          | ~     | ~     |
| Source API          | √          | ~     | √     |
| Aggregators         | ~          | ~     | ~      |
| Keyed States        | × | × | × |

  

+ Where      

|                        | Beam model | Flink | Spark |
| ---------------------: | :--------: | :---: | :---: |
|         Global windows |     √      |   √   |   √   |
|          Fixed windows |     √      |   √   |   ~   |
|        Sliding windows |     √      |   √   |   ×   |
|        Session windows |     √      |   √   |   ×   |
|         Custom windows |     √      |   √   |   ×   |
| Custom merging windows |     √      |   √   |   ×   |
|      Timestamp control |     √      |   √   |   ×   |



+ When

|                             | Beam model | Flink | Spark |
| --------------------------: | :--------: | :---: | :---: |
|     Configurable triggering |     √      |   √   |   ×   |
|         Event-time triggers |     √      |   √   |   ×   |
|   Proccessing-time triggers |     √      |   √   |   √   |
|              Count triggers |     √      |   √   |   ×   |
| [Meta]data driven  triggers |     ×      |   ×   |   ×   |
|          Composite triggers |     √      |   √   |   ×   |
|            Allowed lateness |     √      |   √   |   ×   |
|                      Timers |     ×      |   ×   |   ×   |



+ How

|                           | Beam model | Flink | Spark |
| ------------------------- | ---------- | ----- | ----- |
| Discarding                | √          | √     | √     |
| Accumulating              | √          | √     | ×     |
| Accumulating @ Retracting | ×          | ×     | ×     |




## 参考
1. [Apache Flink状态管理和容错机制介绍](https://www.iteblog.com/archives/2417.html)
2. [Streaming System 第二章：The What- Where- When- and How of Data Processing](https://yq.aliyun.com/articles/674450) 未
3. [Streaming System 第三章：Watermarks](https://yq.aliyun.com/articles/682873) 未
4. [大数据架构如何做到流批一体？](https://yq.aliyun.com/articles/706954) 未
5. <<Spark大数据处理技术>> 10.2节
6. [Apache Beam是什么？](https://www.cnblogs.com/zlslch/p/7609417.html)