---
title: k8s声明式应用管理
date: 2020-05-26 16:00:13
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes 
---

<p></p>
<!-- more -->


Kubernetes 声明式应用管理 =  声明式风格的 API （行为） + Infrastructure as Data（数据 ）
声明式风格的 API： 控制器（Controller）做reconcile状态协调 
Infrastructure as Data：   API 对象 ( 运行时 希望状态， 实际状态 )

声明式应用管理的本质：Infrastructure as Data

API对象的Schema： CRD 就是一个专门用来定义 Schema 的一个特殊的 API 对象(元数据)

## 参考:
1. [CNCF 官方大使张磊：Kubernetes 是一个“数据库”吗？](https://mp.weixin.qq.com/s/gcCmnB2mlqPeSOawgwV98A) 张磊
2. [Kubernetes声明式API](../../../../2019/08/29/k8sDeclarativeAPI/) self

