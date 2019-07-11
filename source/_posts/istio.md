---
title: istio
date: 2019-07-02 10:44:03
tags:
  - 分布式
  - istio
categories: 
  - serviceMesh  

---

{% asset_img  istio.jpg  istio %}

<!-- more -->

{% asset_img  istio-component.jpg  istio组件  %}
{% asset_img  traffic-managment-components.png  Pilot流量管理  %}

{% asset_img  istio-knowledge-map.png   Istio知识图谱 %}
{% asset_img  istio-route.jpg  Envoy Sidecar 代理的路由转发  %}

{% asset_img  envoy-proxy-arch.jpg  Envoy代理的架构  %}


特性 | spring Cloud组件（Chassis模式） | istio 组件（SideCar模式）
:-: | :-: | :-: 
Resilience & Fault Tolerance | Hystrix |   Envoy  超时、重试和熔断器 
Distributed Tracing |  Sleuth | Mixer 
Centralized Metrics | Servo/Hystrix Metrics | Mixer
Centralized Logging | Blitz4j | Mixer
API Gateway | Gateway/Zuul | Ingress/Egress
Load Balancing | OpenFeign/Ribbon  | Pilot + Envoy
Service Discovery | Eureka  | Pilot
Routing | Zuul | Pilot
Service-to-service calls |  | Pilot
Configuration Management | Config/Consul/Zk/Eureka | Calley
故障注入| 无 | iptables



## 参考:
1. [Istio流量管理实现机制深度解析](https://zhaohuabing.com/post/2018-09-25-istio-traffic-management-impl-intro/)
2. [Istio 庖丁解牛1：组件概览](https://mp.weixin.qq.com/s/VwqxrZsVmn4a5PcVckaLxA)
3. [腾讯云容器团队内部Istio专题分享](https://mp.weixin.qq.com/s/NjMncH84uEl_PywOFFMlFA)
4. [Istio 庖丁解牛三：galley](https://mp.weixin.qq.com/s/BMVCeiA2aqASbLqyhPomWA)
5. [Istio 知识图谱](https://github.com/servicemesher/istio-knowledge-map)
6. [Istio1.1新特性之限制服务可见性](http://www.servicemesher.com/blog/istio-service-visibility/)
7. [理解 Istio Service Mesh 中 Envoy 代理 Sidecar 注入及流量劫持](https://jimmysong.io/posts/envoy-sidecar-injection-in-istio-service-mesh-deep-dive/)
8. [理解 Istio Service Mesh 中 Envoy Sidecar 代理的路由转发](http://www.servicemesher.com/blog/envoy-sidecar-routing-of-istio-service-mesh-deep-dive/)


9. [流量管理](https://preliminary.istio.io/zh/docs/concepts/traffic-management)
10. [Spring Cloud](https://spring.io/projects/spring-cloud)

Examples
11. [配置请求路由](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-routing/) done
12. [流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/traffic-shifting/) done
13. [TCP 流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/tcp-traffic-shifting/) done ,验证有点问题
14. [设置请求超时](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-timeouts/) done
15. [熔断](https://preliminary.istio.io/zh/docs/tasks/traffic-management/circuit-breaking/) done

16. [一个商用级Service Mesh服务的设计之道](http://www.servicemesher.com/blog/the-desigin-patterns-for-a-commercial-service-mesh/)
17. [xDS 协议解析](https://jimmysong.io/istio-handbook/concepts/envoy-xds-protocol.html)
18. [Istio 的数据平面 Envoy Proxy 配置详解](https://www.servicemesher.com/blog/envoy-proxy-config-deep-dive/)
19. [Service Mesh——后 Kubernetes 时代的微服务](http://www.servicemesher.com/blog/service-mesh-the-microservices-in-post-kubernetes-era/)