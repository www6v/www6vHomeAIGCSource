---
title: istio 控制面ControlPanel
date: 2022-01-14 16:15:13
tags:
  - istio
categories: 
  - 云原生
  - serviceMesh  
---

<p></p>
<!-- more -->

##  istio控制面(1.1-1.4)

{% asset_img  istio-control.jpg  istio控制面(1.1-1.4)  %}

+ mixer的三大功能：
  + 前置条件检查 
  + 配额管理
  + 遥测报告 

+ 优化 
  - 默认关闭mixer
  - 1.5之后mixer被移除

## 参考:
[Istio 庖丁解牛三：galley](https://mp.weixin.qq.com/s/BMVCeiA2aqASbLqyhPomWA)  腾讯云 钟华
[Istio1.1新特性之限制服务可见性](http://www.servicemesher.com/blog/istio-service-visibility/)  敖小剑 引
[官方内置adapters](https://istio.io/docs/reference/config/policy-and-telemetry/adapters/)  大多数是metrics and logs系统 