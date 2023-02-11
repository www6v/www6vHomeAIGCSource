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
rook的crd建立好之后，
Rook的operator会把rook的控制面建立出来
然后把storageclass和csi driver都注册好。
用户只要建立pvc，pvc里指定用哪个storageclass，然后csi driver会去工作。

## 参考
云原生训练营 第0期-模块七
