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

{% asset_img   k8sNetwork.jpg  图1.Kubenetes网络  %}

## 一. 容器和容器之间的网络
   + 使用Docker的一种网络模型：–net=container
   + 每个Pod容器有有一个pause容器

## 二. Pod与Pod之间的网络

基础: 网桥

### 2.1 同节点pod通信  
通过**网桥**通信

<div style="height: 80%; width: 80%; text-align: center;">
![pod-to-pod-in-node](https://user-images.githubusercontent.com/5608425/68114098-31c4b980-ff30-11e9-9dbd-163452ec51bc.jpg)
图2. 同节点pod通信
</div>

### 2.2 不同节点中的Pod通信（跨主机网络通讯）
参考 图1

**CNI规范** 
1. Flannel

<div style="text-align: center;">
![flannel-udp](https://user-images.githubusercontent.com/5608425/65022322-50acc380-d963-11e9-8476-5e5ab22c8b4c.JPG)  
图3. flannel-udp模式

![flannel-vxlan](https://user-images.githubusercontent.com/5608425/65022323-51455a00-d963-11e9-9442-d4f1b84ecce5.JPG)  
图4. flannel-vxlan模式
</div>

2. Calico

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
2. [calico网络原理及与flannel对比](https://blog.csdn.net/hxpjava1/article/details/79566192)
3. [Kubernetes CNI网络最强对比：Flannel、Calico、Canal和Weave](https://mp.weixin.qq.com/s/GQc8XPV4MaCWiTcN2wVzbw)
4. <<趣谈网络协议 - 30容器网络之Flannel：每人一亩三分地>> 刘超
5. <<趣谈网络协议 - 31容器网络之Calico：为高效说出善意的谎言>> 刘超
6. <<深入剖析Kubernetes - 33  深入解析容器跨主机网络>> 张磊
7. <<深入剖析Kubernetes -34  Kubernetes网络模型与CNI网络插件>>  张磊
8. [K8s网络模型](https://mp.weixin.qq.com/s/spw8fHkIjiyf4kg5RQIL_w)  阿里 加多


### self
1. [Kubernetes服务](../../../../2019/11/04/k8sService/)


