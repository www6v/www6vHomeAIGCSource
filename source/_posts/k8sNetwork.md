---
title: Kubernete网络
date: 2019-08-23 19:04:40
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

## 一. 容器和容器之间的网络
   + 使用Docker的一种网络模型：–net=container
   + 每个Pod容器有有一个pause容器

## 二. Pod与Pod之间的网络

基础: 网桥

### 2.1 同一个Node中的Pod之间的一次通信


### 2.2 不同Node中的Pod之间通信
CNI规范 
Flannel
Calico

## 三. Pod与Service之间的网络

### 3.1 kube-proxy -> userspace 代理模式
<div style="text-align: center;">
<img width="450" alt="user-space-proxy" src="https://user-images.githubusercontent.com/5608425/68077955-2b3b2280-fe08-11e9-8672-3210219a7372.png">
userspace 代理模式
</div>

### 3.2 kube-proxy -> Iptables Proxy Mode
<div style="text-align: center;">
<img width="450" alt="iptables-proxy" src="https://user-images.githubusercontent.com/5608425/68077954-2b3b2280-fe08-11e9-8231-cb9bc177ba21.png">
 Iptables Proxy Mode
</div>

### 3.3 kube-proxy -> IPVS proxy mode
> IPVS是LVS一个组件，提供高性能、高可靠性的四层负载均衡器。IPVS 是IP Virtual Server的简写。IPVS构建在netfilter上，作为Linux 内核的一部分，从传输层实现了负载均衡。

## 四. Internet与Service之间的网络
### 4.1 Node到Internet 
    iptables执行源NAT( SNAT )

### 4.2 Internet到k8s
    I. NodePort  四层
    II. Service LoadBalancer  四层
    III. Ingress Controller  七层


## 参考:

1. [深入理解 Kubernetes之：Service](https://www.kubernetes.org.cn/5992.html) good
