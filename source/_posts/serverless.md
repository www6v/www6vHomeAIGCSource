---
title: Serverless
date: 2019-10-10 10:50:53
tags:
  - serverless
categories:
  - 分布式 
  - 云原生
  - serverless
---

<p></p>
<!-- more -->

## 一. Serverless定义

Serverless = Faas + Baas[5]

> Faas: 相对通用的形式表示无服务计算
Faas例子: Cloud Functions

> Baas:特定领域的、高度优化的无服务计算实现
Baas例子: S3(Object Storage), DynamoDB（Key-Value Database），Cloud Pub/Sub (Messaging) 

<div style="text-align: center; width: 70%; height: 70%"> 

![serverless](https://user-images.githubusercontent.com/5608425/66545940-5fefed00-eb6e-11e9-85d8-3279f6db2d61.jpg)
Serverless
</div>



## 二. serverless和serverful的对比
<div style="text-align: center;">

![serverless-serverful](https://user-images.githubusercontent.com/5608425/66544428-af341e80-eb6a-11e9-9a82-527cb0268300.jpg)
serverless和serverful的对比
</div>

### serverless
1. 事件驱动的
2. **计算与存储解耦**
   状态存储在外部（Baas） 
3. 资源受限的
4. **以实际使用的资源量付费，而不是根据分配的资源数**
5. **执行代码而不需要管理资源分配**
   自动提供如下服务:
   选择实例、扩缩容、部署、容错、监控、日志、安全补丁
6. **自动扩缩容**
   有负载时自动**扩容**;
   没有负载的情况下将资源一直**缩容**到零;
7. 多租户，安全隔离

## 三. 使用的场景

[Serverless应用场景](https://help.aliyun.com/document_detail/65565.html) 阿里云文档 未

### 事件驱动以及响应式架构
+ IoT物联网,低频请求;      
+ 视频转码;
+ 定制图片;
+ 抽取数据  ETL 大数据;
+ 人脸识别;
+ **固定时间触发**计算资源利用低的业务;
  夜间或者服务空闲时间来处理繁忙时候的交易数据(大数据)
  运行批量数据，来生成数据报表(大数据)
+ 定制事件
  用户注册时发邮件验证邮箱地址
 

### 流量突发场景
+ 短周期内的**流量峰值**
  外卖企业的用餐时期负载高峰，
  安防行业的负载高峰是夜间

### 大数据处理   

## 四. 挑战和优化

### 4.1 加快函数运行环境的创建
1. AWS Lambda 中使用的方法是维护一个热的 VM 实例池[5]
2. 阿里Cloud Service Engine(CSE) 内部产品， 应用容器启动加速[3]
<div style="text-align: center; width: 80%; height: 80%"> 

   ![ali-serverless-optimiaze](https://user-images.githubusercontent.com/5608425/66549078-18b92a80-eb75-11e9-9c23-f86a1e711934.jpg)
</div>
+ L1: 容器提前启动，并且对容器进行冻结。
    应用实例 CPU 占用率为0，RAM 占用相当于之前的1/20。
+ L2: 磁盘快照： 容器持久化到磁盘
    时间消耗主要是数据的网络传输时间+内存拷贝时间。
+ L3: 完全冷启动
3. 阿里云  函数计算的预留实例[11]
   预留实例的执行环境是长驻的，彻底消除冷启动对业务的影响
4. [9]
5. AWS Lamdba的延迟因素
+ 函数运行的并发限制： 1000
+ 冷启动时间
  预配置并发，预热Lambda执行环境
  预配置并发，使用环境来立即执行代码
+ 监控
  X-Ray APM

### 4.2 混合部署
更小的资源占用率， 更短的运行时间更易于混合部署。[3][5]


## 五. 产品
1. Serverless , Function as a Service(Faas)
AWS Lambda
Google Cloud Functions
阿里 Function Compute 2.0[10]
Azure Funcions

2. Serverless Container[6] , Container as a Service(Caas)
AWS Fargate
Azure ACI
华为CCI 
阿里 Serverless Kubernetes、本身是Kubernetes集群
容器服务 ACS[13]


3. 面向应用的 Serverless 服务, Paas
[Serverless 应用服务(蚂蚁金服)](https://tech.antfin.com/products/SAS)[7] ，SAS , 兼容标准Knative， toB不toC
Serverless 应用引擎（阿里云）
EDAS Serverless[12] Rpc产品

4. 开源产品
kubeless
Fission
OpenFaaS
Apache OpenWhisk(IBM)
**Knative** = Faas + Caas

<div style="text-align: center; width: 80%; height: 80%">

![caas-faas](https://user-images.githubusercontent.com/5608425/66989009-1d8e5900-f0f6-11e9-9902-2efb75d27da7.png)
</div>

## 六. Concern

<div style="text-align: center; width: 70%; height: 70%">
  
![concerns-serverless3](https://user-images.githubusercontent.com/5608425/66986650-de5e0900-f0f1-11e9-819a-911d21d9d0ba.jpg)
</div>

+ Best Practice[14][1]
+ Tool 开放工具[10] 监控[14] 
+ StartUp Latency[3][9][11]
+ knowledge[4][5][6][15]
+ vender lock-in [12][13][17]
  采用Serverless架构之后，代码都是各个平台的Lambda代码片段，没法迁移。从客户的角度来看，是不希望自己被某家云厂商所绑架的。所以云计算需要有一个标准，产品需要标准化，方便用户无缝在各种云之间迁移。
  knative试图解决这个问题。


## 参考:

1. [让业务感知不到服务器的存在——基于弹性计算的无服务器化实践](https://cloud.tencent.com/developer/article/1158774)  腾讯 未
2. [对Serverless架构的一点体验和思考](https://yq.aliyun.com/articles/160370?spm=5176.8067842.tagmain.56.9Vk1fX) 阿里 未
3. [研发运维效率提升100%，机器成本下降50%，阿里巴巴在 Serverless 计算领域的探索](https://mp.weixin.qq.com/s/Gj_qPPTn6KN065qUu6e-mw)  阿里 
   I. 提高启动时间 II. 混合部署  优化
   [CSE：阿里在线应用如何演进成Serverless架构](https://yq.aliyun.com/articles/702070)
4. [云计算中的Xaas](../../../../2019/02/07/xaas/) self
5. [无服务计算的未来和挑战: A Berkeley View on Serverless Computing](https://mp.weixin.qq.com/s/7qJUzf8xrGihPPLsvwPEig) good
6. [当我们在聊Serverless时你应该知道这些](https://yq.aliyun.com/articles/574222)  阿里 竹涧， 场景 产品 架构
7. [Serverless 落地挑战与蚂蚁金服实践](https://yq.aliyun.com/articles/713292) 产品
8. [Serverless 与容器决战在即？有了弹性伸缩就不一样了](https://yq.aliyun.com/articles/717318)  阿里 莫源 未
9. [分享 KubeCon 2019 （上海）关于 Serverless 及 Knative 相关演讲会议](https://yq.aliyun.com/articles/706537)
   加速：无服务器平台中的冷启动优化; Knative Serving 内部介绍
10. [函数计算 2.0 重磅发布，Serverless Computing 开启新篇章](https://yq.aliyun.com/articles/719694)
    开发工具 fun，vscode插件
11. [预留实例简介](https://help.aliyun.com/document_detail/138103.html)  优化
12. [0基础快速入门运维-EDAS Serverless(FAAS) 产品评测](https://yq.aliyun.com/articles/683675)
13. [大道至简 - 基于Docker的Serverless探索之旅](https://yq.aliyun.com/articles/59483) 产品
14. [Serverless下日志采集、存储、分析实践](https://yq.aliyun.com/articles/656329)   最佳实践
15. [阿里云函数计算 - 事件驱动的serverless计算平台](https://yq.aliyun.com/articles/60966) 
16. [15+文章详细讲述Serverless：开启函数计算时代！（含PDF下载）](https://yq.aliyun.com/articles/78172)
17. [对Serverless架构的一点体验和思考](https://yq.aliyun.com/articles/160370) aws的lambda; serverless的缺点和挑战
