---
title: istio
date: 2019-07-02 10:44:03
tags:
  - istio
categories: 
  - 分布式
  - 云原生
  - serviceMesh  

---

{% asset_img  istio.jpg  istio %}

<!-- more -->

{% asset_img  istio-control.jpg  istio控制面 %}
{% asset_img  istio-data.jpg  istio数据面 %}


<div style="text-align: center;">

<img width="1722" alt="istio-knowledge-map" src="https://user-images.githubusercontent.com/5608425/64623497-a4775400-d41b-11e9-84a5-6e75d708ad0d.png">  Istio知识图谱

![istio组件](https://user-images.githubusercontent.com/5608425/64623495-a3debd80-d41b-11e9-9599-c8c25a7153b9.jpg)   istio组件

![Pilot流量管理](https://user-images.githubusercontent.com/5608425/64623501-a5a88100-d41b-11e9-9262-8414adb5831a.png)  Pilot流量管理

![Envoy Sidecar 代理的路由转发](https://user-images.githubusercontent.com/5608425/64623499-a50fea80-d41b-11e9-9524-6d834fd45d88.jpg)  Envoy Sidecar 代理的路由转发

![Envoy代理的架构](https://user-images.githubusercontent.com/5608425/64623492-a3462700-d41b-11e9-8e2b-6fc0b05d8c5d.jpg)  Envoy代理的架构

</div>

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

Examples 11-15
11. [配置请求路由](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-routing/) done
12. [流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/traffic-shifting/) done
13. [TCP 流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/tcp-traffic-shifting/) done ,验证有点问题
14. [设置请求超时](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-timeouts/) done
15. [熔断](https://preliminary.istio.io/zh/docs/tasks/traffic-management/circuit-breaking/) done

16. [一个商用级Service Mesh服务的设计之道](http://www.servicemesher.com/blog/the-desigin-patterns-for-a-commercial-service-mesh/)
17. [xDS 协议解析](https://jimmysong.io/istio-handbook/concepts/envoy-xds-protocol.html)
18. [Istio 的数据平面 Envoy Proxy 配置详解](https://www.servicemesher.com/blog/envoy-proxy-config-deep-dive/)
19. [Service Mesh——后 Kubernetes 时代的微服务](http://www.servicemesher.com/blog/service-mesh-the-microservices-in-post-kubernetes-era/)
20. [Istio 安装](https://jimmysong.io/istio-handbook/setup/istio-installation.html)

21. [《云原生服务网格Istio：原理、实践、架构与源码解析》](https://item.jd.com/12538407.html) 3.1.2节
22. [Istio Sidecar 注入过程解密](https://preliminary.istio.io/zh/blog/2019/data-plane-setup/)
23. [Istio 庖丁解牛五：多集群网格实现分析](https://mp.weixin.qq.com/s/fSklull_8OfpdCtdwbXx9A)