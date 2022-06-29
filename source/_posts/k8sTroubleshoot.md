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

## Reference
1. 模块六
2. 模块八-Kubernetes 控制平面组件：生命周期管理和服务发现
3. 模块九：生产化集群的管理   chapter5 