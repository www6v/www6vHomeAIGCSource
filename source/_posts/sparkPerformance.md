---
title: Spark 性能优化
date: 2022-05-19 10:55:56
tags:
  - spark 
categories:
  - 大数据 
  - 计算  
  - 流式计算
  - spark   
---

<p></p>
<!-- more -->


##  Spark优化
### 1. 数据倾斜处理
把用户日志和用户表通过用户ID进行join，但是日志表有几亿条记录的**用户ID是null**，Hive把**null当作一个字段值shuffle到同一个Reduce，结果这个Reduce跑了两天也没跑完，SQL当然也执行不完。像这种情况的数据倾斜，因为null字段没有意义，**所以可以在where条件里加一个userID != null过滤掉就可以了**。


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

### 5. 操作系统配置优化
> 当transparent huge pages打开的时候，sys态CPU消耗就会增加，而不同Linux版本的transparent huge pages默认是否打开是不同的，对于默认打开transparent huge pages的Linux执行下面的指令，关闭transparent huge pages。



##  Spark优化
+  Spark2.0 CBO
spark.sql.cbo.enabled

+ 广播Join
大表 Join 小表(<10M)
MapJoin - 规避shuffle
强制广播

+ SMB Join（sort merge bucket）
大表 Join 大表
分桶 - 分桶表join

+ 数据倾斜 - 单表数据倾斜
产生原因： groupby 产生 shuffle  
spark sql 自己的优化 - hashAggrartaion预聚合
解决方案： 二次聚合（加随机数打散）

+ 拆分大key，打散大表， 扩容小表
A表（有大key的表） - A1表（有大key），A2表
B表（小表）
方案：
A1表 的key加随机数 ”Join“ B1表（key加随机数）
A2表 ”Join“ B表 

## 参考：
5. [从0开始学大数据 - Spark的性能优化案例分析（上）]()  李智慧
6. [从0开始学大数据 - Spark的性能优化案例分析（下）]()  李智慧
bilibili - 尚硅谷-大数据Spark3.0调优

