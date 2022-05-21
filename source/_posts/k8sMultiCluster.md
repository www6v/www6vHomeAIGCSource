---
title: Kubernetes 多集群管理
date: 2022-05-08 22:14:17
tags:
  - Kubenetes
categories: 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->

## 目标：
让用户像使用单集群一样来使用多集群。

## 多集群部署需要解决哪些问题

+ 而多集群管理需要解决以下问题：
多集群服务的分发部署（deployment、daemonset等）
跨集群自动迁移与调度（当某个集群异常，服务可以在其他集群自动部署）
多集群服务发现，网络通信及负载均衡（service，ingress等）


## 开源和解决方案
+ KubeFed 或 Federation v2
https://github.com/kubernetes-sigs/kubefed
[集群联邦（Cluster Federation）](https://jimmysong.io/kubernetes-handbook/practice/federation.html)   jimmysong

+ virtual-kubelet
[阿里云virtual-kubelet-autoscaler实现ECI作为弹性补充](https://www.modb.pro/db/166209)
[通过 virtual-kubelet-autoscaler 将Pod自动调度到虚拟节点](https://www.alibabacloud.com/help/zh/elastic-container-instance/latest/schedule-pods-to-a-virtual-node-through-the-virtual-kubelet-autoscaler-add-on)

+ Karmada（Kubernetes Armada）
[Karmada: 开源的云原生多云容器编排引擎](https://www.bilibili.com/video/BV1rX4y1c72s?spm_id_from=333.999.0.0) 华为

+ clusternet - 腾讯云

## 参考：
[k8s多集群的思考](https://www.huweihuang.com/kubernetes-notes/multi-cluster/k8s-multi-cluster-thinking.html)






