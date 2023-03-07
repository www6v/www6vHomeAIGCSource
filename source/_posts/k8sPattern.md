---
title: Kubernetes模式
date: 2019-11-13 15:18:24
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

##  基础模式

#####  声明式的Deployment
   Rolling deployment， 滚动发布
   Fixed deployment
   Blue-green release， 蓝绿部署
   Canary release, 灰度发布

#####   受管理的声明周期
   SIGTERM Signal：  SIGTERM 是通知进程优雅退出的信号
   SIGKILL Signal： SIGKILL 是硬终止的信号
   Poststart Hook
   Prestop Hook

   [Kubernetes 中如何保证优雅地停止 Pod](https://aleiwu.com/post/tidb-opeartor-webhook) 
   [Kubernetes 中如何保证优雅地停止 Pod](https://mp.weixin.qq.com/s/wvg2AqOZd-WtjehGWNWFXg)
   PingCAP 吴叶磊

##  行为模式

#####  Batch Job

参考:
[kube-batch](https://github.com/kubernetes-sigs/kube-batch)     

#####  Singleton Service

 + Out-of-application locking mechanism
   replicas =1

 + In-application locking mechanism: 
   replicas>1  + 分布式锁

#####  Stateful Service

参考:
+ {% post_link 'k8sStatefulSet' %}  self

#####  Service Discovery


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
+ {% post_link 'k8sService' %} self

##  结构模式

#####  Init Container

#####  Sidecar

场景:
+ 跨多语言; istio 
+ [容器日志采集利器Log-Pilot](https://yq.aliyun.com/articles/674327)

##  高级模式

#####  控制器模式

参考:
[sample-controller 官方控制器的例子](https://github.com/kubernetes/sample-controller) git
[kubebuilder](https://github.com/kubernetes-sigs/kubebuilder) git

#####  Operator

+ {% post_link 'k8sOperator' %} self

#####  Elastic Scale
+ 类型
  - VPA
  - HPA
  - CA

+ 资源模型概念
  - QoS
  - requests, limits

参考:
+ {% post_link 'k8sResouceModel' %} self
+ {% post_link 'k8sAutoScale' %}  self

## 参考
1. [《Kubernetes Patterns - Reusable Elements for Designing Cloud-Native Applications》]()  Bilgin Ibryam@RedHat, Roland Huß@RedHat

2. [K8S 中的设计模式- 读《Kubernetes Patterns》](http://www.xuyasong.com/?p=2056) 
3. [Kubernetes Patterns](https://github.com/k8spatterns)