---
title: 微服务
date: 2019-09-09 15:02:28
tags:
  - 微服务
categories:
  - 分布式
  - 服务治理
  - 微服务
---

<p hidden></p>
<!-- more -->

## 一. 微服务相关的问题
### 1. API网关
   + 灰度发布、
   + 负载均衡、 
   + 鉴权、 
   + 监控、
   + 缓存
   [使用 API 网关构建微服务](https://www.infoq.cn/article/construct-micro-service-using-api-gateway/)

### 2. 服务容错,
   + 熔断
   + 隔离
   [微服务熔断与隔离](https://yq.aliyun.com/articles/7443?spm=5176.100238.yqhn2.2.XS3jCO)

### 3. 服务注册和发现

### 4. 服务间调用
   [Micro Service Architecture](https://yobriefca.se/blog/2013/04/29/micro-service-architecture/)
   [Microservice 微服务的理论模型和现实路径](http://blog.csdn.net/mindfloating/article/details/51221780)

##### 服务契约
+ API，具体接口的 API 接入技术说明。
+ 能力，服务能力的描述。
+ 契约，提供这些能力所约定的一些限制条件说明。
+ 版本，支持的最新和历史的版本说明。

##### 调用协议
+ 同步 HTTP
+ 异步消息

   <div style="text-align: center;">
   ![micro-service-architecture-comms](https://user-images.githubusercontent.com/5608425/66257280-8528d800-e7c9-11e9-95f4-bfe436d9d283.png)
   </div>

### 5. 服务部署

### 6. 数据调用

### 7. 可观察性
   [鹰眼跟踪、限流降级，EDAS的微服务解决之道](https://yq.aliyun.com/articles/60994?spm=5176.100239.blogcont61320.29.6SwFH6)
   <div style="text-align: center;">
   ![apm-fault](https://user-images.githubusercontent.com/5608425/66256533-43942f00-e7c1-11e9-8fe8-80565025c792.png)
   APM 故障
   ![apm-tracing](https://user-images.githubusercontent.com/5608425/66256535-4727b600-e7c1-11e9-82c9-cd2222fce9bb.png)
   APM 稳定性
   </div>

  
## 二. 微服务设计模式 
<div style="text-align: center;">
![PatternsRelatedToMicroservices](https://user-images.githubusercontent.com/5608425/66229516-8ea43880-e714-11e9-8f56-0a70cc695882.jpg)
微服务设计模式    
</div>    
    

## 三. The Scale Cube 可伸缩性
[The Scale Cube](https://akfpartners.com/techblog/2008/05/08/splitting-applications-or-services-for-scale/)


>   X-Axis: Horizontal Duplication and Cloning of services and data
    Y-Axis: Functional Decomposition and Segmentation - Microservices (or micro-services)
    Z-Axis: Service and Data Partitioning along Customer Boundaries - Shards/Pods

>   X-Axis: Replicate && Load Balance
    Y-Axis: Servcie
    Z-Axis: Data Sharding

## 四. 微服务的优势和代价

[MicroservicePremium](https://martinfowler.com/bliki/MicroservicePremium.html) Martin Fowler. 

<div style="text-align: center;">
![productivity](https://user-images.githubusercontent.com/5608425/66262608-af54b700-e816-11e9-9e16-3b95d76e14e2.png)
生产率和复杂度之间的关系。
</div>

> 在不复杂的系统中， 更适合monolithic的应用。
  复杂度增长时， 微服务的生产率能持续保持，在生产率方面是可伸缩的。

## 五. 原则
+ 去中心化
+ 可组合的服务


## 参考:
1. [Introduction to Microservices](https://www.nginx.com/blog/introduction-to-microservices/)  英文  
2. [Introduction to Microservices](https://kb.cnblogs.com/page/521880/)  中文  优缺点
3. [微服务（Microservice）那点事](https://yq.aliyun.com/articles/2764?spm=5176.100239.blogcont59193.8.R9MzN9) good
4. [Pattern: Microservice Architecture](https://microservices.io/patterns/microservices.html)  good
5. [一致性](../../../2016/02/09/consistent/)  self
6. [微服务：分解应用以实现可部署性和可扩展性](http://www.infoq.com/cn/articles/microservices-intro)  Chris Richardson



