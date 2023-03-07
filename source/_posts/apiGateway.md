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
+ 灰度发布
+ 反向代理,负载均衡
+ 鉴权
+ 监控
+ 缓存

## 相关产品
+ apisix - lua + nginx
+ Kong - lua + nginx
+ zuul - springcloud

## apisix特性
+ api聚合
+ 灰度发布
+ 服务熔断
+ 多云，混合云
+ 容器友好
+ 随意扩缩容
+ 流量复制
+ 故障注入

## apisix功能
+ 动态配置，不用reload
  路由, ssl证书，上游，插件...
+ 插件化(40个)
  身份验证, 安全, 日志, 可观察性...  
+ 对接Prom，zipkin， skywalking
+ grpc代理和协议转换(rest <-> gprc)
+ apisix只用了nginx的网络层

## apisix使用场景
+ 处理L4, L7层流量
+ 代替nginx处理南北流量
+ 代替envoy处理东西流量
+ k8s ingress controller

## 参考
+ [【云原生学院 #3】基于 Apache APISIX 的全流量 API 网关](https://www.bilibili.com/video/BV1Gt4y1q7qC?vd_source=f6e8c1128f9f264c5ab8d9411a644036) ***
+ [使用 API 网关构建微服务](https://www.infoq.cn/article/construct-micro-service-using-api-gateway/)
+ [百亿规模API网关服务Shepherd的设计与实现](https://tech.meituan.com/2021/05/20/shepherd-api-gateway.html) 点评 未
+ {% post_link 'k8sIngressNginx' %} self
