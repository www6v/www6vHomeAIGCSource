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

## 流量互通方案[1]
**当目标服务不在 mesh 内**，Discovery 服务返回的地址是服务的 HAProxy 的地址（也就是将流量代理到 consul）。
**当目标服务再 mesh 内**，Discovery 服务将返回服务的 ServiceIP，此时应用将通过 Sidecar 触发 ServiceMesh 的路由能力,将请求直接传递到对端 Sidecar。


## 参考
1. [istio 在知乎大规模集群的落地实践](https://zhuanlan.zhihu.com/p/436796453)  *** 
   迁移-回滚 限流 平台化，优化-性能，坑
2. [SpringCloud微服务Istio迁移指导](https://support.huaweicloud.com/bestpractice-cce/istio_bestpractice_3012.html)
3. [基于OpenShift Service Mesh 实现微服务网格化 林斯锐 中国DevOps社区](https://www.bilibili.com/video/BV1V64y1r7oU?spm_id_from=333.880.my_history.page.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036)
4. [51 | Spring Cloud、K8s和Istio该如何集成？](https://time.geekbang.org/course/detail/100053601-274751)  有个图