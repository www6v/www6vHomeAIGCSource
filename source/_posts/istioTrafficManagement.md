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

<div style="text-align: center;">
![Pilot流量管理](https://user-images.githubusercontent.com/5608425/64623501-a5a88100-d41b-11e9-9262-8414adb5831a.png)  
Pilot流量管理[1]
</div>

## 二. 灰度发布
{% asset_img  istio-gray.jpg  istio灰度发布  %}

## 参考:
1. [Istio流量管理实现机制深度解析](https://zhaohuabing.com/post/2018-09-25-istio-traffic-management-impl-intro/)  赵化冰
2. [流量管理](https://preliminary.istio.io/zh/docs/concepts/traffic-management)  istio官网 引
---
官方Examples 11-15

11. [配置请求路由](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-routing/) done
12. [流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/traffic-shifting/) done
13. [TCP 流量转移](https://preliminary.istio.io/zh/docs/tasks/traffic-management/tcp-traffic-shifting/) done ,验证有点问题
14. [设置请求超时](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-timeouts/) done
15. [熔断](https://preliminary.istio.io/zh/docs/tasks/traffic-management/circuit-breaking/) done