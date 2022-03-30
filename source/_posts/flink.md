---
title: Flink
date: 2019-07-29 22:22:52
tags:
  - flink
categories: 
  - 大数据 
  - 流式计算 
  - flink   
---

<p></p>
<!-- more -->

## 一. 总结
{% asset_img   flink.jpg  flink  %} 

+ 组件
  JobManager 
    ResourceManager
    Dispatcher
    JobMaster

  TaskManager 
     Task Slot

+ 概念
   1. 数据流图
   2. 并行度
   3. 算子链
     (1)一对一(One-to-one，forwarding)
        这种关系类似于 Spark 中的窄依赖。
     (2)重分区(Redistributing)
        这种算子间的关系类似于 Spark 中的宽依赖。

   4. 执行图
   5. 任务(Tasks)和任务槽(Task Slots)


## 二. Flink on Kubernetes 
[Flink on Kubernetes](https://github.com/www6v/dev-ops/tree/master/yaml-prod/flink)  Flink官方的方案


## 参考：
1. [Flink架构及其工作原理](https://www.cnblogs.com/code2one/p/10123112.html)
2. <<Flink原理、实战与性能优化>>  张利兵
3. [Flink使用Broadcast State实现流处理配置实时更新](http://ju.outofmemory.cn/entry/371335)
4. [Apache Flink状态管理和容错机制介绍](https://www.iteblog.com/archives/2417.html)
5. 尚硅谷 flink(Java) - bilibili 

