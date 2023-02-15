---
title: Kubernetes Rook
date: 2022-01-12 22:43:17
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

## Rook for ceph
+ Rook建立Ceph集群流程[1]
> rook的crd建立好之后，
> Rook的operator会把rook的控制面建立出来
> 然后把storageclass和csi driver都注册好。
> 用户只要建立pvc，pvc里指定用哪个storageclass，然后csi driver会去工作。



+ installation [3][4]

  

## 参考

1. 云原生训练营 第0期-模块七
2. [kubernetes架构师课程](https://www.bilibili.com/video/BV16t4y1w7r6?p=111) 杜宽 ***
3. [Ceph Cluster CRD](https://rook.io/docs/rook/v1.2/ceph-cluster-crd.html) ***
4. [Ceph Storage Quickstart](https://rook.io/docs/rook/v1.2/ceph-quickstart.html)