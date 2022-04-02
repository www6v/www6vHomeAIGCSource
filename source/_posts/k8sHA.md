---
title: K8S 控制面高可用
date: 2022-01-02 22:09:31
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->


##  控制面 高可用

1. 控制平面组件划分单独节点；
2. 控制平面所在节点，应该确保在不同机架上；
3. 保证控制平面的每个组件有足够的CPU、内存和磁盘资源；
4. 减少或消除外部依赖； Cloud Provider API
5. 核心组件以普通Pod形式加载运行时， 可能会调度到任意工作节点。


### 架构图
load balancer： 虚ip
controller-manager： leader election
{% asset_img  k8sHa.png  控制面高可用  %}



