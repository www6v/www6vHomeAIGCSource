---
title: API 网关-SpringCloud Gateway
date: 2022-03-22 13:58:48
tags:
  - API Gateway
categories: 
  - 服务治理
  - API网关    
---

<p></p>
<!-- more -->

##  核心概念
+ 路由（Route）
  - id：路由标识，要求唯一，名称任意（默认值 uuid，一般不用，需要自定义）
  - uri：请求最终被转发到的目标地址
  - order： 路由优先级，数字越小，优先级越高
  - predicates：断言数组，即判断条件，如果返回值是boolean，则转发请求到 uri 属性指定的服务中
  - filters：过滤器数组，在请求传递过程中，对请求做一些修改
+ 谓词、断言（Predicate）
+ 过滤器（Filter）

## 路由
+ 路由规则
+ 动态路由

## 过滤器
+ 全局过滤器

## 限流

## 高可用网关


## 参考
[2021最新(完整版)Gateway教学-第二代微服务网关组件SpringCloud-Gateway](https://www.bilibili.com/video/BV11i4y1F7eu?p=8)


