---
title: Istio、Kubernetes和Spring Cloud中服务的比对     
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
定义          |  Service<br> Deployment<br> Endpoint | Service<br> 服务版本 <br> 服务实例
入口          |  NodePort<br> LoadBalance<br> Ingress | Gateway（LoadBalance Service）
出口          |  Egress | ServiceEntry
服务发现      |  DNS（CoreDNS）<br> apiserver + kube-proxy |  <br>Pilot + Envoy
服务路由      |   | VirtualService
熔断&监控检查 | 容器：存活探针<br>服务：就绪探针 |  DestinationRule
负载均衡      | | DestinationRule
生命周期管理<br>故障迁移，自愈<br>伸缩 | 原生| 基于k8s 
有状态调度    | StatefulSet  | Operator（CRD+Controller）
配置管理      | ConfigMap & Secrets| 
**灰度**         | Deployment:滚动升级<br>最佳实践：两个Deployment | VirtualService
**多集群**        | Federation  | 1. 多控制面<br> 2.集群感知单控制面(Split Horizon EDS) 



-----

特性 | spring Cloud-服务治理<br>（Chassis模式） | spring Cloud alibaba-Paas全栈| istio组件-流量管理<br>（SideCar模式）
:-: | :-: | :-: | :-:
治理-Resilience & Fault Tolerance | Hystrix <br> 白盒,代码有侵入<br>熔断（有半开状态） <br>隔离仓 | sentinel  | Envoy<br>黑盒，代码无侵入<br> 异常点检查（逐出，重试）（无半开状态）<br>连接池 
监控-Distributed Tracing          | Sleuth/zipkin | zipkin | Mixer 
监控-Centralized Metrics          | Spectator/Atlas | | Mixer
监控-Centralized Logging          | ELK |  | Mixer
流量管理-API Gateway              | Gateway/Zuul | gateway | Gateway
流量管理-Load Balancing           | OpenFeign/Ribbon  | dubbo | Pilot + Envoy
治理-Service Discovery           | Eureka，Consul  |dubbo| Pilot + Envoy xDS
治理-Routing                     | Zuul | dubbo| Pilot + Envoy xDS
治理-Service-to-service calls    |   |dubbo|Pilot
治理-Configuration Management    | Config/Consul |Nacos| Calley
**流量管理-故障注入**                 | x |  | iptables
**流量管理-灰度发布**                 | Nepxion Discovery等 非原生| | 原生支持
**流量管理-异地容灾**                 | x | x |  集群感知

-----

   |Istio Gateway	|阿里云Ingress Controller	|NGINX Ingress Controller
:-: | :-: | :-: | :-:	
根据HTTP Header选择路由规则	|支持	|仅支持单个Header，不支持多个Header组合	|不支持
Header规则支持正则表达式	|支持	|支持	|不支持
服务之间设置权重拆分流量	|支持	|支持	|不支持
Header和权重规则组合使用	|支持	|支持	|不支持
路由规则检查	|支持	|不支持	|不支持
路由规则粒度	|service下的不同pod	|service	|service
支持的协议	|HTTP1.1/HTTP2/gRPC/TCP<br>/Websockets/MongoDB	|HTTP1.1/HTTP2/gRPC<br>/TCP/Websockets	|HTTP1.1/HTTP2/gRPC<br>/TCP/Websockets


<!-- more -->

-----

<div style="text-align: center;">
![SpringCloud With Kubernetes](https://user-images.githubusercontent.com/5608425/64624730-aa6e3480-d41d-11e9-84eb-2278bdb952e1.jpg)  SpringCloud With Kubernetes

![SpringCloud .vs Kubernetes](https://user-images.githubusercontent.com/5608425/64624734-ab06cb00-d41d-11e9-8ceb-ed1b5436eec7.jpg)
SpringCloud .vs Kubernetes
</div>
 
## 参考:
1. 《分布式系统的技术栈》 左耳听风
2. [厉害了，Spring Cloud Alibaba 发布 GA 版本！](https://blog.csdn.net/zl1zl2zl3/article/details/89790643)
3. [一篇囊括微服务服务拆分的一切：前提，时机，方法，规范，选型](https://www.cnblogs.com/popsuper1982/p/9634578.html)
4. [Istio Gateway与Kubernetes Ingress Controller对比](https://yq.aliyun.com/articles/636511)  灰度例子
