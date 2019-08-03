 ---
title: istio/k8s/springcloud中服务的比对
date: 2019-07-20 07:46:52
tags:
  - k8s
  - istio
categories: 
  - 分布式
  - 云原生
  - serviceMesh  
---


特性 | k8s-服务编排,资源调度 | istio-流量管理
:-: | :-: | :-: 
定义 |  Service<br> Deployment<br> Endpoint | Service<br> 服务版本 <br> 服务实例
入口 |  NodePort<br> LoadBalance<br> Ingress | Gateway（LoadBalance Service）
出口 |  Egress | ServiceEntry
服务发现 |  DNS（CoreDNS）<br> apiserver + kube-proxy |  <br>Pilot + Envoy
服务路由|   | VirtualService
熔断&监控检查 | 容器：存活探针<br>服务：就绪探针 |  DestinationRule
负载均衡 | | DestinationRule
生命周期管理<br>故障迁移，自愈<br>伸缩 | 原生| 基于k8s 
有状态调度| StatefulSet  | Operator（CRD+Controller）
灰度| Deployment:滚动升级<br>最佳实践：两个Deployment | VirtualService
多集群 | Federation  | 1. 多控制面<br> 2.集群感知单控制面(Split Horizon EDS) 





特性 | spring Cloud-服务治理<br>（Chassis模式） | spring Cloud alibaba-Paas全栈| istio组件-流量管理<br>（SideCar模式）
:-: | :-: | :-: 
治理-Resilience & Fault Tolerance | Hystrix <br> 白盒,代码有侵入<br>熔断（有半开状态） <br>隔离仓 | sentinel  | Envoy<br>黑盒，代码无侵入<br> 异常点检查（逐出，重试）（无半开状态）<br>连接池 

监控-Distributed Tracing          | Sleuth | zipkin | Mixer 
监控-Centralized Metrics          | Servo/Hystrix Metrics | | Mixer
监控-Centralized Logging          | Blitz4j | | Mixer
流量管理-API Gateway              | Gateway/Zuul | gateway | Gateway
流量管理-Load Balancing           | OpenFeign/Ribbon  | dubbo | Pilot + Envoy
治理-Service Discovery           | Eureka  |dubbo| Pilot + Envoy xDS
治理-Routing                     | Zuul | dubbo| Pilot + Envoy xDS
治理-Service-to-service calls    |   |dubbo|Pilot
治理-Configuration Management    | Config/Consul/Zk/Eureka |Nacos| Calley
流量管理-故障注入                 | 无 |  | iptables
流量管理-灰度发布                 | Nepxion Discovery等 非原生|| 原生支持
流量管理-异地容灾                 | | |  集群感知

<!-- more -->

{% asset_img   k8s&springCloud.png  Kubenetes&SpringCloud  %}


## 参考:
1. 分布式系统的技术栈 左耳听风
2. [厉害了，Spring Cloud Alibaba 发布 GA 版本！](https://blog.csdn.net/zl1zl2zl3/article/details/89790643)


