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

## 目录
<!-- toc -->

#  核心概念 [1][2]
+ 路由（Route）
  - id：路由标识，要求唯一，名称任意（默认值 uuid，一般不用，需要自定义）
  - uri：请求最终被转发到的目标地址
  - order： 路由优先级，数字越小，优先级越高
  - predicates：断言数组，即判断条件，如果返回值是boolean，则转发请求到 uri 属性指定的服务中
  - filters：过滤器数组，在请求传递过程中，对请求做一些修改
+ 谓词、断言（Predicate）
  允许开发人员匹配 HTTP 请求中的内容，比如请求头或请求参数，最后根据匹配结果返回一个**布尔值**。参照 Java8 的新特性Predicate.
+ 过滤器（Filter）
  可以在返回请求之前或之后**修改请求和响应的内容**。
  
###  路由（Route）
##### Gateway 集成注册中心 [2]
+ 服务路由配置
``` yaml
spring:
  cloud:
    gateway:
      routes:
        - id: gateway-provider_1
          ## 使用了lb形式，从注册中心负载均衡的获取uri
          uri: lb://gateway-provider
          ## 配置断言
          predicates:
            - Path=/gateway/provider/**
          filters:
            - AddResponseHeader=X-Response-Foo, Bar
```


+ 自动路由配置
``` yaml
# enabled：默认为false，设置为true表明spring cloud gateway开启服务发现和路由的功能，网关自动根据注册中心的服务名为每个服务创建一个router，将以服务名开头的请求路径转发到对应的服务
spring.cloud.gateway.discovery.locator.enabled = true
# lowerCaseServiceId：启动 locator.enabled=true 自动路由时，路由的路径默认会使用大写ID，若想要使用小写ID，可将lowerCaseServiceId设置为true
spring.cloud.gateway.discovery.locator.lower-case-service-id = true
```

### 谓词、断言（Predicate）
{% asset_img  Predicate.png   Predicate %}

### 过滤器（Filter）
+ 生命周期
  + PRE
  + POST
  
+ 作用范围
  + GatewayFilter 局部过滤器 
    - 默认预定义
      - **限流**
  + GlobalFilter 全局过滤器 
    - 自定义全局过滤器
      - **统一鉴权过滤器**
      
      




# 高可用网关[1]

Nginx负载均衡到部署的多个Gateway



# 参考
1. [2021最新(完整版)Gateway教学-第二代微服务网关组件SpringCloud-Gateway](https://www.bilibili.com/video/BV11i4y1F7eu?p=8) ***
2. [Spring Cloud Gateway 服务网关的部署与使用详细介绍](https://blog.csdn.net/a745233700/article/details/122917167)
100. [3W字吃透：微服务网关SpringCloud gateway底层原理和实操](https://www.cnblogs.com/crazymakercircle/p/17436191.html)   尼恩 未 

