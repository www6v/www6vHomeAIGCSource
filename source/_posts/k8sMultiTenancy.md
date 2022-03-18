---
title: Kubernetes 多租户 
date: 2021-10-18 21:51:13
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->


## 一. 概念和原则
1. 租户是指一组拥有访问特定软件资源权限的用户集合，在多租户环境中，它还包括共享的应用、服务、数据和各项配置等。
2. 多租户集群必须将租户彼此隔离
3. 集群须在租户之间公平的分配集群资源。

   
## 二. 解决方案

##### 1. 认证
   + 识别访问的用户是谁
   + K8s可管理2类用户   
     - ServiceAccount
        是存在于K8s中的虚拟账户; 
        原生支持的动态认证;
     - 用户认证
        webhook是和企业认证平台集成的重要手段


##### 2. 授权

{% asset_img  k8sMultiTenancy.png  授权 %}


##### 3. 隔离

   + 节点隔离 
     Taints和Toleration机制

   + 网路隔离
     NetworkPolicy 网路策略 - 实质上也是iptables规则

   + 容器隔离
       5种隔离机制
       - Mount Namespace 隔离
       - PID Namespace 隔离
       - Network Namespace 隔离
       - IPC Namespace 隔离
       - UTS Namespace 隔离
```
      4个打破隔离的机制 
         - spec.hostNetwork
         - spec.volumes
         - spec.shareProcessNamespace
         - spec.containers[].securityContext.privileged
```
     
##### 4. 配额

   ResourceQuota  




