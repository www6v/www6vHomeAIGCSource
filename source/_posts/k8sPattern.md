---
title: kubernetes模式
date: 2019-11-13 15:18:24
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

## 一. 基础模式

### 1. 声明式的Deployment
   Rolling deployment， 滚动发布
   Fixed deployment
   Blue-green release， 蓝绿部署
   Canary release, 灰度发布

### 2. 受管理的声明周期
   SIGTERM Signal：  SIGTERM 是通知进程优雅退出的信号
   SIGKILL Signal： SIGKILL 是硬终止的信号
   Poststart Hook
   Prestop Hook

   [Kubernetes 中如何保证优雅地停止 Pod](https://aleiwu.com/post/tidb-opeartor-webhook) 
   [Kubernetes 中如何保证优雅地停止 Pod](https://mp.weixin.qq.com/s/wvg2AqOZd-WtjehGWNWFXg)
   PingCAP 吴叶磊

## 二. 行为模式

### 1. Batch Job

参考:
[kube-batch](https://github.com/kubernetes-sigs/kube-batch)   git
A batch scheduler of kubernetes for high performance workload, e.g. AI/ML, BigData, HPC  

### 2. Singleton Service
 
 + Out-of-application locking mechanism
   replicas =1

 + In-application locking mechanism: 
   replicas>1  + 分布式锁

### 3.Stateful Service

参考:
[Kubernetes资源对象 - StatefulSet](../../../../2019/11/11/k8sStatefulSet/) self

### 4.Service Discovery


Name | Configuration | Client type | Summary
:-:  | :-:  |  :-:  | :-:
ClusterIP| type: ClusterIP <br> .spec.selector | Internal | The most common internal discovery mechanism
Manual IP | type: ClusterIP <br> kind: Endpoints |Internal | External IP discovery
Manual FQDN | type: ExternalName <br> .spec.externalName |Internal | External FQDN discovery
Headless Service | type: ClusterIP <br> .spec.clusterIP: None | Internal | DNS-based discovery without a virtual IP
NodePort | type: NodePort | External | Preferred for non-HTTP traffic
LoadBalancer | type: LoadBalancer | External | Requires supporting cloud infrastructure
Ingress | kind: Ingress | External | L7/HTTP-based smart routing mechanism

参考:
[Kubernetes服务](../../../../2019/11/04/k8sService/) self

## 三. 结构模式

### 1. Init Container

### 2. Sidecar

场景:
+ 跨多语言; istio 
+ [容器日志采集利器Log-Pilot](https://yq.aliyun.com/articles/674327)

## 四. 高级模式

### 1. 控制器模式

参考:
[sample-controller 官方控制器的例子](https://github.com/kubernetes/sample-controller) git
[kubebuilder](https://github.com/kubernetes-sigs/kubebuilder) git

### 2. Operator

{% asset_img   operator.jpg  Operator  %} 

参考:
[深入剖析Kubernetes - 27  聪明的微创新：Operator工作原理解读]() 张磊
[面向 Kubernetes 编程： Kubernetes 是下一代操作系统](https://mp.weixin.qq.com/s/E5-agHtMvW_X7znVJDkTKA)
[awesome-operators](https://github.com/www6v/awesome-operators)   github 
[operator-sdk](https://github.com/operator-framework/operator-sdk)  github


### 3. Elastic Scale

##### 类型
+ VPA
+ HPA
+ CA

##### 资源模型概念
+ QoS
+ requests, limits

参考:
[Kubenetes资源模型](../../../../2019/11/14/k8sResouceModel/) self
[Kubernetes自动伸缩和HPA](../../../../2019/11/16/k8sAutoScale/)  self

## 参考
1. [《Kubernetes Patterns - Reusable Elements for Designing Cloud-Native Applications》]()  Bilgin Ibryam@RedHat, Roland Huß@RedHat