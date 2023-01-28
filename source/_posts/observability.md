---
title: 可观测性
date: 2019-08-31 11:54:42
tags:
  - 可观测性
categories:
  - 分布式
  - 可观测性
  - 总结
---

<p></p>
<!-- more -->



**关键词**:  可观测性,  全链路,  APM， Metric， Log


## Overview
![metric-tracing-logging](https://user-images.githubusercontent.com/5608425/64059064-216a2880-cbe7-11e9-9ee7-141334d93959.png)


模式| 产品/框架 
:-:| :-: 
Log aggregation|  ELK， AWS Cloud Watch
Application metrics + alert| Prometheus 、AWS Cloud Watch
Distributed tracing| Zipkin ，Jaeger，pinpoint（无侵入）, skywalking（无侵入）, CAT
Exception tracking| Zipkin ，Jaeger，pinpoint（无侵入）, skywalking（无侵入）, CAT

##  监控指标和原则

+ USE 原则  [面向"资源监控指标"]
  + 利用率（Utilization），资源被有效利用起来提供服务的平均时间占比
  + 饱和度（Saturation），资源拥挤的程度，比如工作队列的长度
  + 错误率（Errors），错误的数量

+ RED 原则  [面向"服务监控指标"] 
  + 每秒请求数量（Rate）
  + 每秒错误数量（Errors）
  + 服务响应时间（Duration）

+ google 四个黄金监控指标  [面向服务]
  + 延迟    latancy
  + 通信量  throughtout
  + 错误    error
  + 饱和度  
  
## 参考
1. [Metrics, tracing 和 logging 的关系](https://wu-sheng.github.io/me/articles/metrics-tracing-and-logging)
2. [观察之道：带你走进可观察性](https://mp.weixin.qq.com/s?__biz=MzIzNjUxMzk2NQ==&mid=2247489564&idx=1&sn=46d9103444bef97e89e897224a896268&chksm=e8d7e7dedfa06ec8d687c1292a1d82ff9e579430afafb9d003e18c13d4ec7e1682dbd4c642d9&scene=27#wechat_redirect)



