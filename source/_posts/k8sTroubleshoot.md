---
title: kubernetes 问题Troubleshoot
date: 2022-06-08 17:39:12
tags:
  - Kubenetes
categories: 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

{% asset_img   podStatus.png  Kubernetes  %}


## 运营过程中出现的陷阱[1]
案例1:
• 研发人员为提高系统效率，将update方法修改为patch
• 研发人员本地非安全测试环境测试通过
• 上生产，发现不work
• 原因:忘记更新rolebinding，对应的serviceaccount没有patch权限
案例2:
• 研发人员创建CRD，并针对该CRD编程
• 上生产后不工作
• 原因，该CRD未授权，对应的组件get不到对应的CRD资源



## taint 和 tolerance [4]
+ 用户会忘记打tolerance， 导致pod无法调度， pending
+ 其他用户会get node detail， 查到taints， 偷用资源
+ 通过dashboard，能看到哪些用户的什么应用跑在哪些节点上
+ 对于违规用户，批评教育为主

## 其他
[4] P26


## Reference
1. 模块六
2. 模块八-Kubernetes 控制平面组件：生命周期管理和服务发现
3. 模块九：生产化集群的管理   chapter5 
4. 模块七