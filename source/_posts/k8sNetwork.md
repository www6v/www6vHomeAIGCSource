---
title: Kubernetes网络
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

### 2.1 同节点pod通信  
通过**网桥**通信

### 2.2 不同节点中的Pod通信
CNI规范 
Flannel
Calico

## 三. Pod与Service之间的网络
参考[self 1]


## 四. Internet与Service之间的网络
### 4.1 Service到Internet 
    iptables执行源NAT( SNAT )

### 4.2 Internet到Service
    I. NodePort  四层
    II. Service LoadBalancer  四层
    III. Ingress Controller  七层


## 参考:
1. [第13 章 ： Kubernetes网络概念及策略控制](https://edu.aliyun.com/lesson_1651_13087#_13087) CNCF × Alibaba 云原生技术公开课

### self
1. [Kubernetes服务](../../../../2019/11/04/k8sService/)


