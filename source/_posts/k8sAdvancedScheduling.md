---
title: Kubernetes 高级调度
date: 2022-05-27 18:39:20
tags:
  - Kubenetes
categories: 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->


##  Kubernetes 高级调度
##### Overview
{% asset_img   k8sScheduler1.jpg   k8s高级调度  %} 

##### Affinity vs. Taint
亲和，反亲和 - 要改现有pod
taint - 不要改现有pod

###### NodeAffinity配置[1]
+ NodeAffinity配置分类:
  - requiredDuringSchedulingIgnoredDuringExecution (强亲和性)
  - preferredDuringSchedulingIgnoredDuringExecution (首选亲和性)

##### Topology [4]
topologyKey

## 参考:
1. [Kubernetes高级调度- Taint和Toleration、Node Affinity分析](https://mp.weixin.qq.com/s/oL7_a9a_V913IR78_dZfaA)
2. [详解 K8S Pod 高级调度](https://mp.weixin.qq.com/s/iv60pNiLsIoWdAVVAA4Dpg)
3. [Kubernetes之Pod调度 ](http://dockone.io/article/2635) 未
4. [kubernetes架构师课程](https://www.bilibili.com/video/BV16t4y1w7r6)   P97  P98 ***
   [【2023】云原生Kubernetes全栈架构师：基于世界500强的k8s实战课程](https://edu.51cto.com/course/23845.html)
