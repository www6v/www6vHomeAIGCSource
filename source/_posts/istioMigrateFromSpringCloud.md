---
title: SpringCloud迁移到istio
date: 2022-01-06 21:50:32
tags:
  - istio
categories: 
  - 云原生
  - serviceMesh   
---

<p></p>
<!-- more -->

##  Java方案-mesh开关[3]
##### Java Agent + mesh开关 
{%    asset_img   mesh-switcher.JPG   mesh-switcher  %}

+ pod不需要重新注入sidecar,   通过 mesh-switcher开关来修改iptables，达到服务直连或者mesh的效果。


## 非Java方案-基于Proxy[1]
#####  流量互通方案 
**当目标服务不在 mesh 内**，Discovery 服务返回的地址是服务的 HAProxy 的地址（也就是将流量代理到 consul）。
**当目标服务再 mesh 内**，Discovery 服务将返回服务的 ServiceIP，此时应用将通过 Sidecar 触发 ServiceMesh 的路由能力,将请求直接传递到对端 Sidecar。


## 参考
1. [istio 在知乎大规模集群的落地实践](https://zhuanlan.zhihu.com/p/436796453)  *** 
   迁移-回滚 限流 平台化，优化-性能，坑
2. [SpringCloud微服务Istio迁移指导](https://support.huaweicloud.com/bestpractice-cce/istio_bestpractice_3012.html) *
3. [百度服务网格在金融行业的大规模落地实践（孙召昌，百度）](https://www.bilibili.com/video/BV17y4y1e7Pt) ***
  [相关ppt](https://www.aliyundrive.com/s/dXxngxjTkZE)
4. [基于OpenShift Service Mesh 实现微服务网格化 林斯锐 中国DevOps社区](https://www.bilibili.com/video/BV1V64y1r7oU?spm_id_from=333.880.my_history.page.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036)
5. [51 | Spring Cloud、K8s和Istio该如何集成？](https://time.geekbang.org/course/detail/100053601-274751)  有个图
