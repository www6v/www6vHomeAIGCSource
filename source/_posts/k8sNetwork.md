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

2.1 同一个Node中的Pod之间的一次通信


2.2 不同Node中的Pod之间通信
CNI规范 
Flannel
Calico

## 三. Pod与Service之间的网络

## 四. Internet与Service之间的网络
4.2 Internet到k8s
    I. NodePort  四层
    II. Service LoadBalancer  四层
    III. Ingress Controller  七层

