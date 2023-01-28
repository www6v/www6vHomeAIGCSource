---
title: 可观测性-Skywalking
date: 2022-03-18 22:15:49
tags:
  - 可观测性
categories:
  - 分布式
  - 可观测性
  - tracing
---

<p></p>
<!-- more -->

## 定位
APM: Tracing + Metric

## 架构
{% asset_img arch.jpeg  架构  %}

## agent
+ rpc
  dubbo，springboot
+ mesh 
  istio, envoy  
+ 中间件
  nginx, kong
  tomcat   
+ db
  mysql
+ linux
  ebpf  
+ k8s

## live demo 
[live demo](http://demo.skywalking.apache.org/general)

## 参考
+ [java基础教程全面的深入学习Skywalking](https://www.bilibili.com/video/BV1ZJ411s7Mn) 入门
+ [SkyWalking分布式系统应用程序性能监控工具-上](https://www.cnblogs.com/itxiaoshen/p/16513711.html)
+ [安装Java agent](https://skyapm.github.io/document-cn-translation-of-skywalking/zh/8.0.0/setup/service-agent/java-agent/)
+ [SkyWalking 在无人驾驶领域的实践](https://skywalking.apache.org/zh/2022-04-13-skywalking-in-autonomous-driving/) 未
+ [ApacheSkyWalking](https://space.bilibili.com/390683219)  bilibili
+ [[视频] 云原生学院 - 后分布式追踪时代的性能问题定位——方法级性能剖析](https://skywalking.apache.org/zh/2020-08-13-cloud-native-academy/) 吴晟 未
