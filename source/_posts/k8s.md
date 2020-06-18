---
title: Kubernetes总结
date: 2019-04-25 10:29:34
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

## 一.  Kubernetes Overview
{% asset_img   kubenetes-arch.jpg  Kubenetes架构  %}

<div style="text-align: center;">
![kubernetes-high-level-component-archtecture](https://user-images.githubusercontent.com/5608425/63923811-c535c600-ca79-11e9-8057-2b6264b39d80.jpg) kubernetes-high-level-component-archtecture
</div>

## 二. Kubernetes控制器
|控制器|说明|类型|
|:---:|:---:|:---:|
|Replication Controller<br> ReplicaSet<br> Deployment|不建议使用<br> 建议使用<br> |无状态| 
|StatefulSet<br> PersistentVolumeController|<br>绑定PVC、PV|有状态| 
| Servcie【1】<br>Namespace | x | x |


<div style="text-align: center;">
![控制器模型](https://user-images.githubusercontent.com/5608425/63924251-85bba980-ca7a-11e9-8a3a-4cf852dfe86c.JPG)  控制器模型
</div>

## 三. Kubernetes产品形态
1. 托管集群（ 阿里 ACK ）
2. serverless Kubernetes （阿里 ASK， ECI）
3. service mesh（阿里 ASM）
4. 边缘托管（华为openedge）


{% asset_img   product.jpg  Kubernetes产品形态  %}


## 四.  Kubernetes高可用方案
[8][9]

## 参考:

1. [《Kubenetes in Action》](http://product.dangdang.com/26439199.html?ref=book-65152-9168_1-529800-3)  七牛容器云团队
2. [云原生](../../../../2019/05/02/cloudNative/) self  
3. [Kubernetes架构](https://jimmysong.io/kubernetes-handbook/concepts/)  jimmysong
4. [面向 Kubernetes 编程： Kubernetes 是下一代操作系统](https://mp.weixin.qq.com/s/E5-agHtMvW_X7znVJDkTKA)   
5. [K8S 从懵圈到熟练：读懂此文，集群节点不下线](https://mp.weixin.qq.com/s/xmVHqTZblQsAxdaSjWjn1Q) 阿里
6. <<深入剖析Kubernetes - 16  编排其实很简单：谈谈“控制器”模型>> 张磊  
7. [Serverless Kubernetes：理想，现实与未来](https://mp.weixin.qq.com/s/o_dPKP_6dL92Q4jiG4097A)  易立、张维
8. [Options for Highly Available topology](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/ha-topology/)
9. [Creating Highly Available clusters with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/)

---

CNCF × Alibaba 云原生技术公开课
1. [第4 章 ： 理解 Pod 和容器设计模式](https://edu.aliyun.com/lesson_1651_13079?spm=5176.254948.1334973.10.2c12cad2AHzzTw#_13079)
   Pod 进程组;  设计模式: initContainer模式 sidecar模式;
2. [第3 章 ： Kubernetes 核心概念](https://edu.aliyun.com/lesson_1651_13078?spm=5176.254948.1334973.8.2c12cad2AHzzTw#_13078)
3. [第5 章 ： 应用编排与管理：核心原理](https://edu.aliyun.com/lesson_1651_13080?spm=5176.254948.1334973.12.2c12cad2AHzzTw#_13080)  video
   [从零开始入门 K8s | K8s 的应用编排与管理](https://mp.weixin.qq.com/s/T1l5ebHqo0GUFfbfBnd-tQ) ppt+文字
   控制器模式: 1. 控制循环 2. Sensor;    
4. [第6 章 ： 应用编排与管理： Deployment](https://edu.aliyun.com/lesson_1651_13081?spm=5176.10731542.0.0.e7a120beywNIVX#_13081)
   Deployment控制器; ReplicaSet控制器
5. [第8 章 ： 应用配置管理](https://edu.aliyun.com/lesson_1651_17058#_17058)  ppt 未
    [从零开始入门 K8s | 如何实现应用配置管理？](https://mp.weixin.qq.com/s/8r-_Ekje__GVHsKLfJ-66A)  ppt+文字 未
    ConfigMap 可变配置; Secret 敏感信息; ServiceAccount 身份认证;  Resources; SecurityContext 安全管控;  InitContainers; 
---



    
