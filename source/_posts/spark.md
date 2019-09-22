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

{% asset_img  spark.jpg  spark总结 %}


{% asset_img  spark-task-num.JPG  图一. 优化前,kafka的partition为3，spark的task数为3 %}
{% asset_img  spark-task-num(kafka-partition增加到10后).JPG  图二.优化后,kafka的partition增加到10后，spark的task数为10 %}

## 参考:

1. [计费项目/spark streaming项目](https://github.com/www6v/urtc-bill/blob/master/src/main/java/ucloud/utrc/bill/SparkStreamingKafka.scala)
2. 《Spark大数据处理：技术、应用与性能优化》 高彦杰
3. 《Spark大数据处理技术》 夏俊鸾,黄洁,程浩等
4. [Spark中foreachRDD、foreachPartition和foreach解读](https://blog.csdn.net/Scapel/article/details/84030362)



