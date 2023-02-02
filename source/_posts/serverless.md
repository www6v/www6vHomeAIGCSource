---
title: Serverless
date: 2019-10-10 10:50:53
tags:
  - serverless
categories: 
  - 云原生
  - serverless
---

<p></p>
<!-- more -->

##  Serverless定义

Serverless = Faas + Baas[5]

> Faas: 相对通用的形式表示无服务计算
Faas例子: Cloud Functions

> Baas:特定领域的、高度优化的无服务计算实现
Baas例子: S3(Object Storage), DynamoDB（Key-Value Database），Cloud Pub/Sub (Messaging) 

<div style="text-align: center; width: 70%; height: 70%"> 

![serverless](https://user-images.githubusercontent.com/5608425/66545940-5fefed00-eb6e-11e9-85d8-3279f6db2d61.jpg)
Serverless
</div>



##  Serverless和Serverful的对比
<div style="text-align: center;">

![serverless-serverful](https://user-images.githubusercontent.com/5608425/66544428-af341e80-eb6a-11e9-9a82-527cb0268300.jpg)
serverless和serverful的对比
</div>

##### Serverless
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

##  使用的场景

[Serverless应用场景](https://help.aliyun.com/document_detail/65565.html) 阿里云文档 未

##### 事件驱动以及响应式架构
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


##### 流量突发场景
+ 短周期内的**流量峰值**
  外卖企业的用餐时期负载高峰，
  安防行业的负载高峰是夜间

##### 大数据处理   

##  产品- Hosted Platform [0]
| Serverless , Function as a Service(Faas) | 描述                                                         |
| ---------------------------------------- | ------------------------------------------------------------ |
| AWS Lambda                               |                                                              |
| Google Cloud Functions                   |                                                              |
| 阿里 Function Compute 2.0                | [函数计算 2.0 重磅发布，Serverless Computing 开启新篇章](https://yq.aliyun.com/articles/719694)<br/>  开发工具 fun，vscode插件 |
| Azure Funcions                           |                                                              |



| Serverless Container[6] , Container as a Service(Caas) | 描述                                                         |
| ------------------------------------------------------ | ------------------------------------------------------------ |
| AWS Fargate                                            |                                                              |
| Azure ACI                                              |                                                              |
| 华为CCI                                                |                                                              |
| 阿里 Serverless Kubernetes、本身是Kubernetes集群       |                                                              |
| 容器服务 ACS                                           | [大道至简 - 基于Docker的Serverless探索之旅](https://yq.aliyun.com/articles/59483) 产品 |



| 面向应用的 Serverless 服务, Paas                             | 描述                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Serverless 应用服务(蚂蚁金服)](https://tech.antfin.com/products/SAS) | [Serverless 落地挑战与蚂蚁金服实践](https://yq.aliyun.com/articles/713292) 产品 <br>SAS , 兼容标准Knative， toB不toC |
| Serverless 应用引擎（阿里云） <br> SAE是DevOps最佳实践       | [Serverless 时代 DevOps 的最佳打开方式](https://developer.aliyun.com/article/782846?utm_content=g_1000253942)  未<br/>   Serverless 应用引擎（SAE）是阿里云 Serverless 产品矩阵中提供的 DevOps 最佳实践。<br/>   SAE 是一款面向应用 Serverless PaaS 平台，支持 Spring Cloud、Dubbo、HSF 等主流的应用开发框架。 |
| EDAS Serverless , Rpc产品                                    | [0基础快速入门运维-EDAS Serverless(FAAS) 产品评测](https://yq.aliyun.com/articles/683675) |


##  产品- 开源产品 [0]
+ Installable Platform
  - Apache OpenWhisk [IBM]
  - Knative[Faas + Caas] ***   
  - kubeless
  - Fission
  - OpenFaaS
  - OpenFunction[Kubesphere]
+ Framework
  - dapr ***
  - EventMesh
  - serverless
  - AWS SAM
  - Spring Cloud Function
+ Tool
  - Serverless Devs [Ali][99]


<div style="text-align: center; width: 80%; height: 80%">

![caas-faas](https://user-images.githubusercontent.com/5608425/66989009-1d8e5900-f0f6-11e9-9902-2efb75d27da7.png)
</div>

## 参考
+ 0.[CNCF Cloud Native Interactive Landscape](https://landscape.cncf.io/serverless)
+ 99.[Serverless Devs-让你像使用手机一样玩转 Serverless](https://developer.aliyun.com/live/245624)   v 
+ 5.[无服务计算的未来和挑战: A Berkeley View on Serverless Computing](https://mp.weixin.qq.com/s/7qJUzf8xrGihPPLsvwPEig)  ***
+ 6.[当我们在聊Serverless时你应该知道这些](https://yq.aliyun.com/articles/574222)  阿里 竹涧， 场景 产品 架构
+ 8.[Serverless 与容器决战在即？有了弹性伸缩就不一样了](https://yq.aliyun.com/articles/717318)  阿里 莫源 未   
+ 16.[15+文章详细讲述Serverless：开启函数计算时代！（含PDF下载）](https://yq.aliyun.com/articles/78172)

