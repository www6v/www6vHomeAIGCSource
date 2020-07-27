---
title: 可观察性-链路追踪-Metric
date: 2019-08-31 11:54:42
tags:
  - 可观察性
categories:
  - 分布式
  - 服务治理
  - 可观察性
---

<p hidden></p>
<!-- more -->

![metric-tracing-logging](https://user-images.githubusercontent.com/5608425/64059064-216a2880-cbe7-11e9-9ee7-141334d93959.png)


模式| 产品/框架
:-:|:-:|:-:
Log aggregation|  ELK， AWS Cloud Watch
Application metrics + alert| Prometheus 、AWS Cloud Watch
Distributed tracing| Zipkin ，Jaeger，pinpoint（无侵入）, skywalking（无侵入）, CAT
Exception tracking| Zipkin ，Jaeger，pinpoint（无侵入）, skywalking（无侵入）, CAT

## 一. 监控指标和原则
### USE 原则 -> 面向"资源监控指标"
+ 利用率（Utilization），资源被有效利用起来提供服务的平均时间占比；
+ 饱和度（Saturation），资源拥挤的程度，比如工作队列的长度；
+ 错误率（Errors），错误的数量。

### RED 原则 ->  面向"服务监控指标"
+ 每秒请求数量（Rate）；
+ 每秒错误数量（Errors）；
+ 服务响应时间（Duration）。

### google 四个黄金监控指标
+ 延迟
+ 通信量
+ 错误
+ 饱和度

## 二. Log
ELK，EFK

{% asset_img  log.JPG   log %}

## 三. Metric 之 Prometheus
1. 非分布式， 联邦
2. pushgataway
3. 服务发现
4. 拉模式  

{% asset_img  metric.JPG   metric的类型 %}

## 四. APM 
{% asset_img  apm.JPG   APM产品比对 %}

{% asset_img  apm1.JPG   APM产品比对 %}

## 参考:
1. [Metrics, tracing 和 logging 的关系](https://wu-sheng.github.io/me/articles/metrics-tracing-and-logging)
2. [观察之道：带你走进可观察性](https://mp.weixin.qq.com/s?__biz=MzIzNjUxMzk2NQ==&mid=2247489564&idx=1&sn=46d9103444bef97e89e897224a896268&chksm=e8d7e7dedfa06ec8d687c1292a1d82ff9e579430afafb9d003e18c13d4ec7e1682dbd4c642d9&scene=27#wechat_redirect)
3. [日志：每个软件工程师都应该知道的有关实时数据的统一概念](https://github.com/oldratlee/translations/blob/master/log-what-every-software-engineer-should-know-about-real-time-datas-unifying/README.md)  论文翻译 good 未
4. [容器日志采集利器Log-Pilot](https://yq.aliyun.com/articles/674327)  阿里开源的Log-Pilot 容器日志采集模式
5. [Pattern: Microservice Architecture](https://microservices.io/patterns/microservices.html)
6. [深入剖析Kubernetes - 48 | Prometheus、Metrics Server与Kubernetes监控体系]() 张磊
7. [微服务架构实战160讲 第七模块 ：微服务监控告警Prometheus架构和实践 119.监控模式分类]() 杨波 partial
8. [微服务架构实战160讲 第四模块 ：微服务调用链监控CAT架构和实践 69.调用链监控产品和比较]() 杨波

### APM, tracing
1. [OpenTracing语义标准](https://github.com/opentracing-contrib/opentracing-specification-zh/blob/master/specification.md)
2. [Dapper，大规模分布式系统的跟踪系统](http://bigbully.github.io/Dapper-translation/)  论文
3. [如何检测 Web 服务请求丢失问题](https://mp.weixin.qq.com/s/QA_BTF1D3GJJ7_nYQ6oAzQ) 问题排查 应用： Nginx tracing + Tomcat tracing
4. [剖析 | SOFARPC 框架之 SOFARPC 链路追踪剖析](https://www.sofastack.tech/blog/sofa-rpc-link-tracking/) 未
5. [虾米SRE实践_监控体系升级之路](https://github.com/StabilityMan/StabilityGuide/blob/master/docs/processing/monitor/%E8%99%BE%E7%B1%B3SRE%E5%AE%9E%E8%B7%B5_%E7%9B%91%E6%8E%A7%E4%BD%93%E7%B3%BB%E5%8D%87%E7%BA%A7%E4%B9%8B%E8%B7%AF.md) good
6. [分布式调用链调研（pinpoint,skywalking,jaeger,zipkin等对比）](https://my.oschina.net/u/3770892/blog/3005395) good 对比的表格
