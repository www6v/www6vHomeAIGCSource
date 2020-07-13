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

## 一.  总结
{% asset_img  spark.jpg  spark总结 %}

## 二.  Spark优化

### 1. 数据倾斜处理
产品经理曾经讲过一个案例，他想把用户日志和用户表通过用户ID进行join，但是日志表有几亿条记录的**用户ID是null**，Hive把**null当作一个字段值shuffle到同一个Reduce，结果这个Reduce跑了两天也没跑完，SQL当然也执行不完。像这种情况的数据倾斜，因为null字段没有意义，**所以可以在where条件里加一个userID != null过滤掉就可以了**。


### 2. 配置参数优化。
+ case1
当时使用的这些服务器的CPU的核心数是48核，而应用配置的最大Executor数目是120，每台服务器30个任务，虽然30个任务在每个CPU核上都100%运行，但是总的CPU使用率仍只有60%多。

具体优化也很简单，设置应用启动参数的Executor数为48×4=192即可。

+ case2  spark和kafka的优化
{% asset_img  spark-task-num.JPG  图一. 优化前,kafka的partition为3，spark的task数为3 %}
{% asset_img  spark-task-num(kafka-partition增加到10后).JPG  图二.优化后,kafka的partition增加到10后，spark的task数为10 %}


### 3. MapReduce、Spark代码优化
[Spark公司内部培训](https://www6v.github.io/www6vHomeHexo/2019/03/10/sparkTrain/sparkTrain.pptx)

### 4. SQL语句优化
典型的就是Hive的**MapJoin**语法，如果join的一张表比较小，比如只有几MB，那么就可以用MapJoin进行连接，Hive会将这张小表当作Cache数据全部加载到所有的Map任务中，在Map阶段完成join操作，无需shuffle。


## 参考:

1. [计费项目/spark streaming项目](https://github.com/www6v/urtc-bill/blob/master/src/main/java/ucloud/utrc/bill/SparkStreamingKafka.scala)
2. 《Spark大数据处理：技术、应用与性能优化》 高彦杰
3. 《Spark大数据处理技术》 夏俊鸾,黄洁,程浩等
4. [Spark中foreachRDD、foreachPartition和foreach解读](https://blog.csdn.net/Scapel/article/details/84030362)
5. [从0开始学大数据 - Spark的性能优化案例分析（上）]()  李智慧
6. [从0开始学大数据 - Spark的性能优化案例分析（下）]()  李智慧



