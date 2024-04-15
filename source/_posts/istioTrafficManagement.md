---
title: Istio流量管理
date: 2019-11-21 15:59:53
tags:
  - istio
categories: 
  - 云原生
  - serviceMesh
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

##  流量管理
{% asset_img  istio-traffic-manage.jpg  istio流量管理  %}

#####  组件
<div style="text-align: center;">

![Pilot流量管理](https://user-images.githubusercontent.com/5608425/64623501-a5a88100-d41b-11e9-9262-8414adb5831a.png)  
Pilot Design Overview (来自 [Istio old_pilot_repo](https://github.com/istio/old_pilot_repo/blob/master/doc/design.md))
图例说明：图中红色的线表示控制流，黑色的线表示数据流。蓝色部分为和Pilot相关的组件。
</div>

+ 控制面组件
  + Discovery Services
  + istio crd

+ 数据面组件
  + Pilot-agent
  + Envoy

[Istio 庖丁解牛1：组件概览](https://mp.weixin.qq.com/s/VwqxrZsVmn4a5PcVckaLxA)  腾讯云 钟华

#####  流量管理模型

+ **VirtualService** 
定义了一系列针对指定服务的流量**路由规则**; 
将流量路由到给定目标地址;
通常和目标规则（DestinationRule）成对出现;

+ **DestinationRule**
定义虚拟服务路由**目标地址**的**真实地址**，即**子集（subset）**；
设置**负载均衡方式**： round robin（默认），随机，权重，最少请求数；

+ ServiceEntry 
  - 外部服务定义: 把外部服务注册到网格中
  - 功能：
     - 为外部服务转发请求
     - 添加超时重试等策略
     - 扩展网格

+ **Gateway**  
描述了一个负载均衡器，用于承载网格边缘的进入和发出连接。

+ EnvoyFilter 
描述了针对代理服务的过滤器，用来定制由 Istio Pilot 生成的代理配置.

+ Sidecar
调整Envoy代理接管的端口和协议；
限制Envoy代理可访问的服务；

**总结**
管理内部流量：VirtualService + DestinationRule
管理外部流量：Gateway
管理服务：ServiceEntry

#####  灰度发布
{% asset_img  istio-gray.jpg  istio灰度发布  %}

## 参考
1. [Istio流量管理实现机制深度解析](https://zhaohuabing.com/post/2018-09-25-istio-traffic-management-impl-intro/)  赵化冰
2. [腾讯云容器团队内部Istio专题分享](https://mp.weixin.qq.com/s/NjMncH84uEl_PywOFFMlFA) 腾讯云 钟华
3. [极客时间 《Service Mesh实战 - 核心功能之流量控制：Istio是如何实现流量控制功能的？》](https://time.geekbang.org/course/intro/100049401) 马若飞


### 官方Examples 0-5  G

0. [流量管理](https://preliminary.istio.io/zh/docs/concepts/traffic-management)  istio官网 引
1. [配置请求路由](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-routing/) done
2. [流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/traffic-shifting/) done
3. [TCP 流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/tcp-traffic-shifting/) done ,验证有点问题
4. [设置请求超时](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-timeouts/) done
5. [熔断](https://preliminary.istio.io/zh/docs/tasks/traffic-management/circuit-breaking/) done


###  最佳实践
[流量管理最佳实践](https://istio.io/latest/zh/docs/ops/best-practices/traffic-management/)