---
title: istio数据面
date: 2019-11-21 17:05:08
tags:
  - istio
categories: 
  - 分布式
  - 云原生
  - serviceMesh  
---

<p></p>
<!-- more -->

{% asset_img  istio-data.jpg  istio数据面-sidecar注入 %}

<div style="text-align: center;">
![Envoy Sidecar 代理的路由转发](https://user-images.githubusercontent.com/5608425/64623499-a50fea80-d41b-11e9-9524-6d834fd45d88.jpg)  Envoy Sidecar 代理的路由转发 [7][8]
</div>

{% asset_img  istioXDS.jpg  istio-xDS %}



## 参考：
7. [理解 Istio Service Mesh 中 Envoy 代理 Sidecar 注入及流量劫持](https://jimmysong.io/posts/envoy-sidecar-injection-in-istio-service-mesh-deep-dive/)  宋净超
8. [理解 Istio Service Mesh 中 Envoy Sidecar 代理的路由转发](http://www.servicemesher.com/blog/envoy-sidecar-routing-of-istio-service-mesh-deep-dive/)  宋净超  引

17. [xDS 协议解析](https://jimmysong.io/istio-handbook/concepts/envoy-xds-protocol.html)  宋净超  引

21. [《云原生服务网格Istio：原理、实践、架构与源码解析》](https://item.jd.com/12538407.html) 第6章
22. [Istio Sidecar 注入过程解密](https://preliminary.istio.io/zh/blog/2019/data-plane-setup/) istio官方