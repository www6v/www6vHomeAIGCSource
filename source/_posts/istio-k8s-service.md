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
