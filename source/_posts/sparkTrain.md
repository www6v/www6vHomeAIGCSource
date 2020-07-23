---
title: Spark公司内部培训
date: 2019-03-10 17:02:52
tags:
  - spark 
categories: 
  - 大数据
  - 流式计算
  - spark   

---

<p></p>
<!-- more -->  

关键词： Spark架构, Spark优化

[Spark公司内部培训](https://www6v.github.io/www6vHomeHexo/2019/03/10/sparkTrain/sparkTrain.pptx)

## 优化
+ 可靠性  驱动节点（Driver）失效  -> checkpoint
+ ReduceByKey vs GroupByKey
   ReduceByKey 先reduce，再shuffle， 更高效。
   GroupByKey  先shuffle，再reduce。
+ foreachRDD、foreachPartition和foreach  3个Action
   与connection的关系


