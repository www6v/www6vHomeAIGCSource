---
title: Kubernetes自动伸缩和HPA
date: 2019-11-16 11:55:37
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->


{% asset_img   k8sAutoScale.jpg  Kubernetes自动伸缩  %}

## 一. Custom Metrics 
![hpa3](https://user-images.githubusercontent.com/5608425/68987952-a3730080-086a-11ea-9a69-6b2c41de98ed.JPG)


![hpa1](https://user-images.githubusercontent.com/5608425/68987950-a3730080-086a-11ea-83b8-1b6e06e3c659.jpg)

Kubernetes 里的 Custom Metrics 机制，也是借助 Aggregator APIServer 扩展机
制来实现的。这里的具体原理是，当你把 Custom Metrics APIServer 启动之后，Kubernetes
里就会出现一个叫作custom.metrics.k8s.io的 API。而当你访问这个 URL 时，
Aggregator 就会把你的请求转发给 Custom Metrics APIServer 。
而 Custom Metrics APIServer 的实现，其实就是一个 Prometheus 项目的 Adaptor。

## 二.  自定义指标与Prometheus
![hpa5](https://user-images.githubusercontent.com/5608425/68987954-a40b9700-086a-11ea-985a-10d423d2cd15.JPG)
k8s-prome theus-adapter

## 三. HPA

![hpa2](https://user-images.githubusercontent.com/5608425/68987951-a3730080-086a-11ea-82d6-78ba5efcdfa5.jpg)

## 参考:
1. [《Kubernetes进阶实战》]() 马永亮
2. [深入剖析Kubernetes - 49  Custom Metrics 让Auto Scaling不再“食之无味”]() 张磊


 


