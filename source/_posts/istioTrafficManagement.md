---
title: istio流量管理
date: 2019-11-21 15:59:53
tags:
  - istio
categories: 
  - 分布式
  - 云原生
  - serviceMesh
---

<p></p>
<!-- more -->

## 一. 流量管理
{% asset_img  istio-traffic-manage.jpg  istio流量管理  %}

### 1.1 组件
<div style="text-align: center;">
![Pilot流量管理](https://user-images.githubusercontent.com/5608425/64623501-a5a88100-d41b-11e9-9262-8414adb5831a.png)  
Pilot Design Overview (来自 [Istio old_pilot_repo](https://github.com/istio/old_pilot_repo/blob/master/doc/design.md))
图例说明：图中红色的线表示控制流，黑色的线表示数据流。蓝色部分为和Pilot相关的组件。
</div>

### 控制面组件
Discovery Services
istio crd

### 数据面组件
Pilot-agent
Envoy

[Istio 庖丁解牛1：组件概览](https://mp.weixin.qq.com/s/VwqxrZsVmn4a5PcVckaLxA)  腾讯云 钟华

### 1.2 流量管理模型
VirtualService： 定义了一系列针对指定服务的流量路由规则
DestinationRule
ServiceEntry： 外部服务定义
Gateway：  描述了一个负载均衡器，用于承载网格边缘的进入和发出连接。
EnvoyFilter： 描述了针对代理服务的过滤器，用来定制由 Istio Pilot 生成的代理配置.

## 二. 灰度发布
{% asset_img  istio-gray.jpg  istio灰度发布  %}

## 参考:
1. [Istio流量管理实现机制深度解析](https://zhaohuabing.com/post/2018-09-25-istio-traffic-management-impl-intro/)  赵化冰
2. [腾讯云容器团队内部Istio专题分享](https://mp.weixin.qq.com/s/NjMncH84uEl_PywOFFMlFA) 腾讯云 钟华

---
官方Examples 0-5  G

0. [流量管理](https://preliminary.istio.io/zh/docs/concepts/traffic-management)  istio官网 引
1. [配置请求路由](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-routing/) done
2. [流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/traffic-shifting/) done
3. [TCP 流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/tcp-traffic-shifting/) done ,验证有点问题
4. [设置请求超时](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-timeouts/) done
5. [熔断](https://preliminary.istio.io/zh/docs/tasks/traffic-management/circuit-breaking/) done