---
title: Kubenetes资源模型和自动伸缩
date: 2019-11-14 10:23:19
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes 
---

<p></p>
<!-- more -->

关键词: 自动伸缩, 资源模型, 资源管理

{% asset_img   k8sResouceModel.jpg   Kubenetes资源模型和自动伸缩  %}

## 一. 资源模型
### 1.1 
**CPU资源**被称作 “可压缩资源”: Pod 只会“饥饿”，但不会退出.
**内存资源**被称作“不可压缩资源”: Pod 会因为 OOM（Out-Of-Memory）被内核杀掉。

Kubernetes 这种对 CPU 和内存资源限额的设计，实际上参考了 Borg 论文中对**“动态资源边
界”**的定义，既：容器化作业在提交时所设置的资源边界，并不一定是调度系统所必须严格遵守
的，这是因为在实际场景中，大多数作业使用到的资源其实远小于它所请求的资源限额。

而 Kubernetes 的 requests+limits 的做法，其实就是上述思路的一个简化版：用户在提交
Pod 时，可以声明一个相对**较小的 requests** 值供调度器使用，而 Kubernetes 真正设置给容器
Cgroups 的，则是相对**较大的 limits 值**。不难看到，这跟 Borg 的思路相通的。

**limits**: 而在真正设置 Cgroups 限制的时候，kubelet 则会按照 limits 的值来进行设置
**requests**: 在调度的时候，kube-scheduler 只会按照 requests 的值进行计算


### 1.2 QoS

**Guaranteed**:  requests == limits
**Burstable**:  至少有一个 Container 设置了 requests
**BestEffort**:  没有设置 requests，也没有设置 limits

**Eviction** 在 Kubernetes 里其实分为 Soft 和 Hard 两种模式。
**Soft Eviction模式**： 允许你为 Eviction 过程设置一段“优雅时间”；
**Hard Eviction模式**： Eviction 过程就会在阈值达到之后立刻开始；

**Eviction时机**：
BestEffort > Burstable > Guaranteed

**cpuset**: 把容器绑定到某个 CPU 的核上，而不是像 cpushare 那样共享 CPU 的计算能力.
+ **cpuset配置**: 
+ Guaranteed
+ CPU 资源的 requests == limits

## 参考:
1. [《Kubenetes in Action》](http://product.dangdang.com/26439199.html?ref=book-65152-9168_1-529800-3)  七牛容器云团队
2. [深入剖析Kubernetes - 40  Kubernetes的资源模型与资源管理]() 张磊






