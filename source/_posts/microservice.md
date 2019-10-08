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
   + 重试机制
   + 限流
   + 熔断机制
   + 隔离
   + 降级（本地缓存）
   + 流量调度、负载均衡
   [微服务熔断与隔离](https://yq.aliyun.com/articles/7443?spm=5176.100238.yqhn2.2.XS3jCO)

### 3. 服务注册和发现
<div style="text-align: center;">
![service-find](https://user-images.githubusercontent.com/5608425/66263484-fa29fb00-e825-11e9-83aa-47bcb97d7580.png)
服务注册和发现
</div>

模式
+ Client-side Discovery  
+ Server-side Discovery patterns

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
  REST（JAX-RS）
  RPC（Dubbo）

+ 异步消息
  Kafka, 
  Notify, 
  MetaQ

   <div style="text-align: center;">
   ![micro-service-architecture-comms](https://user-images.githubusercontent.com/5608425/66257280-8528d800-e7c9-11e9-95f4-bfe436d9d283.png)
   </div>

### 5. 服务部署和发布

[微服务部署：蓝绿部署、滚动部署、灰度发布、金丝雀发布](https://my.oschina.net/xiaominmin/blog/3070053)

+ 部署模式
+ Single Service per Host  
+ Multiple Services per Host patterns

### 6. 数据调用


### 7. 可观察性
   [鹰眼跟踪、限流降级，EDAS的微服务解决之道](https://yq.aliyun.com/articles/60994?spm=5176.100239.blogcont61320.29.6SwFH6)
   [可观察性](../../../../2019/08/31/observability/) self

   <div style="text-align: center;">
   ![apm-fault](https://user-images.githubusercontent.com/5608425/66256533-43942f00-e7c1-11e9-8fe8-80565025c792.png)
   APM 故障
   ![apm-tracing](https://user-images.githubusercontent.com/5608425/66256535-4727b600-e7c1-11e9-82c9-cd2222fce9bb.png)
   APM 稳定性
   </div>

### 8. 服务划分和组合

> 微服务不是指"微小"的服务, 而是如何"拆分"服务,然后"组合"服务.

DDD 领域驱动设计, 上下文划分
  
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

## 五. 原则和缺点（挑战）


[微服务架构——不是免费的午餐](https://www.phodal.com/blog/microservices-is-not-a-free-lunch/) 
[有关微服务架构的争论：更简单还是更复杂？](http://www.infoq.com/cn/news/2014/05/micro-server-architecture-debate) 


原则 |优点 |缺点 |挑战
:-: |:-: |:-: |:-:
**分布式**服务组成的系统； 去中心化| 可用性高|多服务运维难度 | 分布式系统的复杂性
按照业务而不是技术来划分组织| 服务独立无依赖 |系统部署依赖| 事务、异步、测试面临挑战
做有生命的**产品**而不是项目| 技术栈灵活||  运营开销
Smart endpoints and dumb pipes（强服务个体和轻量级通信）; 可组合的服务|独立按需扩展|服务间通信成本 | 隐式接口[接口变更成本]
自动化运维（**DevOps**） | | 系统集成测试 | DevOps 要求
**容错**| 可用性高 |  数据一致性 | 性能监控; 分布式系统的复杂性
快速**演化**| 开发简单 |重复工作  | 系统集成测试 
 

## 五. SOA、微服务、云原生演进

关注点  |SOA  |微服务 |云原生
:-:|:-:|:-:|:-:
研发过程| CMM/RUP | Agile| Agile 
交付流程| 手工/自动化 | DevOps,DevSecOps| GitOps/AIOps/NoOps
服务通信| Web Service（WSDL，Soap）| REST/私有RPC协议（Dubbo）|REST/gRPC,Envoy xDS协议等开放协议
服务治理| ESB        | 微服务/API网管（SpringCloud） | 服务网格（istio， Linked）
应用运行环境| 物理机/虚拟机|虚拟机/容器 | Kubernete（操作系统）+ Serverless（Knative）
基础设施| IDC | 公有云/私有云 | 无边界的云（多云/混合云、 云+边+端）    

## 参考:
1. [Introduction to Microservices](https://www.nginx.com/blog/introduction-to-microservices/)  英文  
2. [Introduction to Microservices](https://kb.cnblogs.com/page/521880/)  中文  优缺点
3. [微服务（Microservice）那点事](https://yq.aliyun.com/articles/2764?spm=5176.100239.blogcont59193.8.R9MzN9) good
4. [Pattern: Microservice Architecture](https://microservices.io/patterns/microservices.html)  good
5. [一致性](../../../2016/02/09/consistent/)  self
6. [微服务：分解应用以实现可部署性和可扩展性](http://www.infoq.com/cn/articles/microservices-intro)  Chris Richardson
7. [《Linux/Unix设计思想》随笔 ——Linux/Unix哲学概述](https://www.cnblogs.com/suter/p/3401952.html)  未
8. [微服务学习资料汇总](https://www.infoq.cn/article/2014/07/microservice-learning-resources/)  good
9. [微服务架构技术栈选型手册](https://www.infoq.cn/article/micro-service-technology-stack/?utm_source=infoq&utm_medium=popular_widget&utm_campaign=popular_content_list&utm_content=homepage) 未
10. [从 SOA 到微服务，企业分布式应用架构在云原生时代如何重塑？](https://mp.weixin.qq.com/s/zl0Z-bCoLDFGD8GFYh68CQ) 阿里 易立 good



