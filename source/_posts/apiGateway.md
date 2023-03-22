---
title: API Gateway网关
date: 2022-01-21 10:31:46
tags:
  - API Gateway
categories: 
  - 服务治理
  - API网关    
---

<p></p>
<!-- more -->

## API网关特性
+ 路由
+ 灰度发布
+ 反向代理,负载均衡
+ 鉴权
+ 限流
+ 监控
+ 缓存

## 相关产品


| 产品    | 技术                 |
| ------- | -------------------- |
| apisix[4]  | lua + Nginx          |
| Kong    | lua + Nginx          |
| Zuul    | Spring Cloud Netflix |
| Gateway[5] | Spring Cloud         |
| Traefik | Golang               |


## 参考
+ 1.[使用 API 网关构建微服务](https://www.infoq.cn/article/construct-micro-service-using-api-gateway/)
+ 2.[百亿规模API网关服务Shepherd的设计与实现](https://tech.meituan.com/2021/05/20/shepherd-api-gateway.html) 点评 未
+ 3.{% post_link 'k8sIngressNginx' %} self
+ 4.{% post_link  'apiGatawayApisix' %} self
+ 5.{% post_link  'apiGatawaySpringGateway' %} self

