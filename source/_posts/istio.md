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

<p></p>
<!-- more -->

##  istio特性
{% asset_img  istio.jpg  istio %}

20. [Istio 安装](https://jimmysong.io/istio-handbook/setup/istio-installation.html)  引
23. [Istio 庖丁解牛五：多集群网格实现分析](https://mp.weixin.qq.com/s/fSklull_8OfpdCtdwbXx9A)  腾讯云 钟华 引

##  istio控制面
{% asset_img  istio-control.jpg  istio控制面 %}

[Istio 庖丁解牛三：galley](https://mp.weixin.qq.com/s/BMVCeiA2aqASbLqyhPomWA)  腾讯云 钟华
[Istio1.1新特性之限制服务可见性](http://www.servicemesher.com/blog/istio-service-visibility/)  敖小剑 引

+ mixer的三大功能：
前置条件检查。 
配额管理。 
遥测报告。 


##  istio组件
<div style="text-align: center;">

![istio组件](https://user-images.githubusercontent.com/5608425/64623495-a3debd80-d41b-11e9-9599-c8c25a7153b9.jpg)  
istio组件[2]
</div>

[Istio 庖丁解牛1：组件概览](https://mp.weixin.qq.com/s/VwqxrZsVmn4a5PcVckaLxA)  腾讯云 钟华


## 参考:
1. [腾讯云容器团队内部Istio专题分享](https://mp.weixin.qq.com/s/NjMncH84uEl_PywOFFMlFA) 腾讯云 钟华
2. [一个商用级Service Mesh服务的设计之道](http://www.servicemesher.com/blog/the-desigin-patterns-for-a-commercial-service-mesh/) 华为 田晓亮
3. [Service Mesh——后 Kubernetes 时代的微服务](http://www.servicemesher.com/blog/service-mesh-the-microservices-in-post-kubernetes-era/) 宋净超 
4. [《云原生服务网格Istio：原理、实践、架构与源码解析》](https://item.jd.com/12538407.html) 3.1.2节

self
1. [istio流量管理](../../../../2019/11/21/istioTrafficManagement/)