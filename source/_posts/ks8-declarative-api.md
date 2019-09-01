---
title: Kubernetes声明式API
date: 2019-08-29 18:15:25
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes
---

<p hidden></p>
<!-- more -->

{% asset_img  ks8-declarative-api.jpg  声明式API %}


```
# CRD的定义和使用
$ tree
.
├── controller.go
├── crd
│ └── network.yaml               + resource的定义【像类定义】
├── example
│ └── example-network.yaml       + resource的使用【像类实例】
├── main.go
└── pkg
	├── apis
	│ 	└── samplecrd              + group 
	│ 		├── constants.go
	│ 		└── v1                 + version
	│ 			├── doc.go         + 代码生成，Global Tag 
	│ 			├── register.go    + 注册类型（Type）到APIServer中，全局变量
	│ 			├── types.go       + 类型有哪些字段
	│ 			└── zz_generated.deepcopy.go    【codegenerated】
	└── client       +for自定义控制器【codegenerated】 
		├── clientset
		├── informers
		└── listers
```
## 参考:
1. 《深入剖析Kubernetes  - 23  声明式API与Kubernetes编程范式》  张磊 
2. 《深入剖析Kubernetes  - 24  深入解析声明式API（一）：API对象的奥秘》  张磊
3. [Kubernetes 准入控制 Admission Controller 介绍](https://juejin.im/post/5ba3547ae51d450e425ec6a5)