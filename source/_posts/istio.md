---
title: istio
date: 2019-07-02 10:44:03
tags:
  - istio
categories: 
  - 云原生
  - serviceMesh  
---

<p></p>
<!-- more -->

##  为什么用istio
+ SDK思维向平台思维转变
  SDK的功能下沉到平台中， SDK中保留必要的功能

参考：
+ 《阿里云云原生架构实践》
+ [基于OpenShift Service Mesh 实现微服务网格化 林斯锐 中国DevOps社区](https://www.bilibili.com/video/BV1V64y1r7oU?spm_id_from=333.880.my_history.page.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036)


##  istio Overview [1]
{% asset_img  istio-overview.jpg  istio overview %}


##  istio特性
{% asset_img  istio.jpg  istio %}

+ 性能优化:
  - 1.精简层：  sofa-mosn 在sidercar里做很多mixer的事情
  - 2.优化层：  Cilium： 优化sider的网络

参考:
20. [Istio 安装](https://jimmysong.io/istio-handbook/setup/istio-installation.html)  引
23. [Istio 庖丁解牛五：多集群网格实现分析](https://mp.weixin.qq.com/s/fSklull_8OfpdCtdwbXx9A)  腾讯云 钟华 引


##  istio组件 [5]
<div style="text-align: center;">

![istio组件](https://user-images.githubusercontent.com/5608425/64623495-a3debd80-d41b-11e9-9599-c8c25a7153b9.jpg)  
istio1.1组件
</div>


## istio架构演进

+ 1.5版本之后的简化 Simplify
  从 1.5 开始，把控制平面的所有组件组合并成一个单体结构叫 istiod。

##### istio架构（1.1-1.4） [5]
{% asset_img  istio-old-arch.png  istio架构（1.1-1.4） %}

##### istio架构（1.5） 
{% asset_img  istio1.5-arch.jpeg  istio架构（1.5） %}


## 参考:
1. [腾讯云容器团队内部Istio专题分享](https://mp.weixin.qq.com/s/NjMncH84uEl_PywOFFMlFA) 腾讯云 钟华
2. [一个商用级Service Mesh服务的设计之道](https://blog.csdn.net/karamos/article/details/80133231)  华为 田晓亮
3. [Service Mesh——后 Kubernetes 时代的微服务](http://www.servicemesher.com/blog/service-mesh-the-microservices-in-post-kubernetes-era/) 宋净超 
4. [《云原生服务网格Istio：原理、实践、架构与源码解析》](https://item.jd.com/12538407.html) 3.1.2节
5. [Istio 庖丁解牛1：组件概览](https://mp.weixin.qq.com/s/VwqxrZsVmn4a5PcVckaLxA)  腾讯云 钟华




  
