---
title: Kubernetes Runtime
date: 2019-11-19 15:21:19
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

{% asset_img   k8sRuntime.jpg  Kubernetes Runtime  %}


## 一. 虚拟化技术

<div style="text-align: center;">
![virtual-container](https://user-images.githubusercontent.com/5608425/69125404-b858c980-0ae0-11ea-9bd1-8e2f45cc1184.jpg)
容器虚拟化
</div>

runc： OSContainerRuntime（基于进程隔离技术）
kvm:   HyperRuntime（基于Hypervisor技术）
runv： UnikernelRuntime（基于unikernel）

## 二. CRI架构
<div style="text-align: center;">
![cni-arc-1](https://user-images.githubusercontent.com/5608425/69023129-a7cd2400-09f8-11ea-9c90-762d04360012.jpg)
CRI架构

![cni-arch](https://user-images.githubusercontent.com/5608425/69022893-c67eeb00-09f7-11ea-9203-fd96b90dfbef.jpg)
CRI架构
</div>


docker调用的链路：dockershim => dockerd => Containerd => runc
Containerd调用的链路：Containerd --> shim v2 --> runtimes

runc：运行可信容器（弱隔离但性能好）;  
runv: 运行不可信容器（强隔离安全性好）; 


## 参考:
1. [CRI - Container Runtime Interface（容器运行时接口）](https://jimmysong.io/kubernetes-handbook/concepts/cri.html)
2. [为Kubernetes选择合适的容器运行时](https://mp.weixin.qq.com/s/sshrTSsUfqjja6g4-Lb42g)