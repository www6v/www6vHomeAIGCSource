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

## 一. istio特性
{% asset_img  istio.jpg  istio %}

20. [Istio 安装](https://jimmysong.io/istio-handbook/setup/istio-installation.html)  引
23. [Istio 庖丁解牛五：多集群网格实现分析](https://mp.weixin.qq.com/s/fSklull_8OfpdCtdwbXx9A)  腾讯云 钟华 引

## 二. istio控制面
{% asset_img  istio-control.jpg  istio控制面 %}

[Istio 庖丁解牛三：galley](https://mp.weixin.qq.com/s/BMVCeiA2aqASbLqyhPomWA)  腾讯云 钟华
[Istio1.1新特性之限制服务可见性](http://www.servicemesher.com/blog/istio-service-visibility/)  敖小剑 引

+ mixer的三大功能：
前置条件检查。 
配额管理。 
遥测报告。 


## 三. istio组件
<div style="text-align: center;">

![istio组件](https://user-images.githubusercontent.com/5608425/64623495-a3debd80-d41b-11e9-9599-c8c25a7153b9.jpg)  
istio组件[2]
</div>

##### 3.1 数据面
##### Istio 注入sidecar实现:
自动注入: 利用 Kubernetes Dynamic Admission Webhooks 对 新建的pod 进行注入: init container + sidecar
手动注入: 使用 istioctl kube-inject

##### 注入Pod内容:
##### istio-init: 
   通过配置iptables来劫持Pod中的流量。
   Init 容器初始化完毕后就会自动终止，但是 Init 容器初始化结果(iptables)会保留到应用容器和 Sidecar 容器中.
##### istio-proxy: 
   两个进程pilot-agent和envoy, pilot-agent 进行初始化并启动envoy. 【3.2节】

##### 3.2 Envoy启动过程和配置
<div style="text-align: center;">
![envoy-config-init](https://user-images.githubusercontent.com/5608425/69950671-b81feb80-152e-11ea-96ba-6261b7f4c09f.png)
Envoy启动过程和配置
</div>

> Envoy 配置热更新: 配置的动态变更，而不需要重启 Envoy.

[Istio 庖丁解牛1：组件概览](https://mp.weixin.qq.com/s/VwqxrZsVmn4a5PcVckaLxA)  腾讯云 钟华
[istio数据面](../../../../2019/11/21/istioDataplane/) self

## 参考:
1. [腾讯云容器团队内部Istio专题分享](https://mp.weixin.qq.com/s/NjMncH84uEl_PywOFFMlFA) 腾讯云 钟华
2. [一个商用级Service Mesh服务的设计之道](http://www.servicemesher.com/blog/the-desigin-patterns-for-a-commercial-service-mesh/) 华为 田晓亮
3. [Service Mesh——后 Kubernetes 时代的微服务](http://www.servicemesher.com/blog/service-mesh-the-microservices-in-post-kubernetes-era/) 宋净超 
4. [《云原生服务网格Istio：原理、实践、架构与源码解析》](https://item.jd.com/12538407.html) 3.1.2节

self
1. [istio流量管理](../../../../2019/11/21/istioTrafficManagement/)