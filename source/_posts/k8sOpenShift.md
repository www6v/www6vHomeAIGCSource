---
title: Kubernetes OpenShift
date: 2022-01-05 21:45:05
tags:
  - Kubenetes
categories: 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->


{% asset_img openshift.png %}

## Interface
+ CNI
  OpenFlow(OVS)(使用的， 更通用，场景适合的更多) 
  Calico
+ CRI
  - OpenShift3.0 用的
      Docker（有守护进程，守护进程宕掉后，运行时会有问题） 
      Red Hat Enterprise Linux - 4G大小
  - OpenShift4.0 用的
      CRI-O（没有守护进程）
      Ret Hat CoreOS - 不到800M大小
+ CSI
  CEPH(ROOK) 
  NFS

 ## PaaS
 角色 - RBAC
 配置管理 - LimitRanage， Quota
 联邦集群 - kubefed 

## 对K8S的增强

{% asset_img enhancement.png %}

+ Operator
+ Multus多个虚拟网卡（用的多）
  一个pod有多个虚拟网卡， ovs管理网络 + macvlan网络（性能比较好） 
+ kube-virt 虚拟机管理

## 应用迁移
{% asset_img appMigrate.png %}

+ 应用改造的难度比较大


## 参考 
[基于 Red Hat OpenShift 4 构建 Paas、DevOps 平台](https://www.bilibili.com/video/BV19p4y1k7yA?spm_id_from=333.880.my_history.page.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036) bilibili
