---
title: istio和k8s中服务的比对
date: 2019-07-20 07:46:52
tags:
  - k8s
  - istio
categories: 
  - 分布式
  - 云原生
  - serviceMesh  
---


特性 | k8s | istio
:-: | :-: | :-: 
服务发现 |  DNS（CoreDNS）<br> apiserver + kube-proxy |  <br>Pilot + Envoy
定义 |  Service<br> Deployment<br> Endpoint | Service<br> 服务版本 <br> 服务实例
入口 |  NodePort<br> LoadBalance<br> Ingress | Gateway（LoadBalance Service）
出口 |  Egress | ServiceEntry
路由|   | VirtualService
负载均衡 | | DestinationRule
熔断&监控检查 | 容器：存活探针<br>服务：就绪探针 |  DestinationRule
灰度| Deployment:滚动升级<br>最佳实践：两个Deployment | VirtualService
多集群 | Federation  | 1. 多控制面<br> 2.集群感知单控制面(Split Horizon EDS)    




特性 | spring Cloud组件（Chassis模式） | istio 组件（SideCar模式）
:-: | :-: | :-: 
Resilience & Fault Tolerance | Hystrix <br> 白盒,代码有侵入<br>熔断（有半开状态） <br>隔离仓 |   Envoy  <br>黑盒， 代码无侵入<br> 异常点检查（逐出，重试）（无半开状态）<br>连接池 
Distributed Tracing |  Sleuth | Mixer 
Centralized Metrics | Servo/Hystrix Metrics | Mixer
Centralized Logging | Blitz4j | Mixer
API Gateway | Gateway/Zuul | Gateway
Load Balancing | OpenFeign/Ribbon  | Pilot + Envoy
Service Discovery | Eureka  | Pilot + Envoy xDS
Routing | Zuul | Pilot + Envoy xDS
Service-to-service calls |  | Pilot
Configuration Management | Config/Consul/Zk/Eureka | Calley
故障注入| 无 | iptables
灰度发布| Nepxion Discovery等 非原生| 原生支持



{% asset_img   k8s&springCloud.png  Kubenetes&SpringCloud  %}


