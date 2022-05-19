---
title: Spark
date: 2019-03-09 16:38:49
tags:
  - spark 
categories:
  - 大数据 
  - 流式计算
  - spark   
---

<p></p>
<!-- more -->   

##  总结
{% asset_img  spark.jpg  spark总结 %}


##  Structured Streaming 
1. time 
事件时间 event time
处理时间 processing time

2. DSL
```	
df = … // 这个 DataFrame 代表学校学生的数据流，schema 是{name: string, age: number, height
df.select("name").where("age > 10") // 返回年龄大于 10 岁的学生名字列表
df.groupBy("grade").count() // 返回每个年级学生的人数
df.sort_values([‘age’], ascending=False).head(100) // 返回 100 个年龄最大的学生
```

3. API 
**Spark Streaming** 提供的 DStream API 与 RDD API 很类似，相对**比较低 level**。
**Structured Streaming** 提供的 DataFrame API 就是这么一个相对**高 level **的 API，大部分
开发者都很**熟悉关系型数据库和 SQL**。

4. 实时性
**Spark Streaming** 是准实时的，它能做到的最小延迟在一秒左右。 **秒级**
**Structured Streaming** 引入了**连续处理**的模式，可以做到真正的**毫秒级**延迟。

##  spark-sql
{% asset_img  rdd-dataset-dataframe.PNG  RDD,DataFrame,DataSet比较 %}


##  Spark Streaming Kafka 反压（Backpressure）


##  互联网运营常用数据指标
1. 新增用户数
新增用户数有日新增用户数、周新增用户数、月新增用户数等几种统计口径
2. 用户留存率
用户留存率 = 留存用户数 / 当期新增用户数
3. 活跃用户数
有日活跃用户数、月活跃用户数
6. 用户转化率
转化率 = 有购买行为的用户数 / 总访问用户数
4. PV
用户每次点击，每个页面跳转，被称为一个PV（Page View）
5. GMV
GMV即成交总金额（Gross Merchandise Volume），是电商网站统计营业额（流水


## 参考:

1. [计费项目/spark streaming项目](https://github.com/www6v/r-tc-bill/blob/master/src/main/java/cloud/rtc/bill/SparkStreamingKafka.scala)
2. 《Spark大数据处理：技术、应用与性能优化》 高彦杰
3. 《Spark大数据处理技术》 夏俊鸾,黄洁,程浩等
4. [Spark中foreachRDD、foreachPartition和foreach解读](https://blog.csdn.net/Scapel/article/details/84030362)
7. [Spark SQL：Spark数据查询的利器]  蔡元楠
8. [Structured Streaming：如何用DataFrame API进行实时数据分析?]  蔡元楠
9. [Structured Streaming编程指南](https://github.com/xy2953396112/spark-sourcecodes-analysis/blob/master/structured-streaming/Structured-Streaming-%E7%BC%96%E7%A8%8B%E6%8C%87%E5%8D%97.md)  官方文档的中文版本  good  未 
10. [从0开始学大数据 - 32讲互联网运营数据指标与可视化监控]()  李智慧



