---
title: OpenAPI 设计  
date: 2019-11-01 03:48:07
tags:
  - API
categories:  
  - 架构  
  - API
---

<p></p>
<!-- more-->


## 一. REST API 设计 规范
OpenAPI Specification 业界标准
1. [A Visual Guide to What's New in Swagger 3.0](https://blog.readme.io/an-example-filled-guide-to-swagger-3-2/)
2. [OpenAPI Specification - Version 3.0.2](https://swagger.io/specification/)

Google API Design Guide
1. [谷歌API设计指南](https://www.bookstack.cn/read/API-design-guide/API-design-guide-README.md)

## 二. API 设计模式
1. RPC
2. ROA(Rest-Oriented Architecture)

通常RESTful风格对API设计者的要求是比较高的，主要的难点在于面向资源设计要求开发者事先做好规划，将后端数据模型与API服务模型相匹配。

## 三. 面向资源设计API
+ 资源模型
资源分类管理
+ 资源关系

[ECS TAG功能详解](https://yq.aliyun.com/articles/497936)
[资源组](https://www.alibabacloud.com/help/zh/doc-detail/54182.htm)

## 四. 服务容错处理
1. 同步请求的Timeout[2]
2. 异步请求方式
3. 错误码
[TagResources](https://help.aliyun.com/document_detail/110424.html) 错误码

## 参考:
1. [云服务OpenAPI的7大挑战，架构师如何应对？](http://mp.weixin.qq.com/s?__biz=MzIzOTU0NTQ0MA==&mid=2247491596&idx=1&sn=9df1fac5f35771dc6aa065d8fac67f2e&chksm=e92add03de5d541504f6087a5f571ca838bc8ff23a045e7b4d4513454be8c34ba9d56a20215a&scene=0&xtrack=1#rd)  阿里技术 虚明  
2. [超时和重试总结](../../../../2016/01/17/timeout/)  self