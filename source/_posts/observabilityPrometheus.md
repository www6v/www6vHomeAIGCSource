---
title: 可观测性-Prometheus
date: 2022-04-10 21:58:17
tags:
  - prometheus
categories: 
  - 可观测性
  - metric
---

<p></p>
<!-- more -->



##  Metric 之 Prometheus [9]

+  非分布式， 联邦
+  pushgataway
+  服务发现
+  拉模式  

{% asset_img  metric.JPG   metric的类型 %}



## 业务场景
+ 业务指标
+ metric


## 多云, 多地域监控
在远端云上部署Prometheus agent


## Prometheus 存储层的演进 [7]
+ 1st Generation: Prototype
  - key
    - metric name
    - labels
    - timestamp
  - value
+ 2nd Generation: Prometheus V1
  - 压缩
    - Timestamp Compression: Double Delta
    - Value Compression
  - Chunk Encoding  
    1KB
+ 3rd Generation: Prometheus V2

## Prometheus服务发现机制[10]



## 参考：
3. [第十八期: 玩转云原生容器场景的Prometheus监控]()  腾讯云 云原生正发声  #todo 重看一遍
##### 存储层
7. [Prometheus 存储层的演进](https://cloud.tencent.com/developer/article/1847798)  ***
##### Metric
8. [深入剖析Kubernetes - 48 | Prometheus、Metrics Server与Kubernetes监控体系]() 张磊
9. [微服务架构实战160讲 第七模块 ：微服务监控告警Prometheus架构和实践 119.监控模式分类]() 杨波 partial
##### 服务发现机制
10. [kubernetes架构师课程](https://www.bilibili.com/video/BV16t4y1w7r6)














