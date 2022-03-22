---
title: Kubernetes存储
date: 2019-09-01 17:39:12
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

{% asset_img   k8sStorage.jpg  Kubernetes存储  %}

## 一. Kubernetes 存储的绑定流程 
### 1.1
![Kubernetes存储的绑定流程](https://user-images.githubusercontent.com/5608425/68108028-9593b600-ff21-11e9-8623-5c719772317e.jpg)

**三个阶段：**
第一个**create**阶段，主要是创建存储；
第二个**attach**阶段，就是将那块存储挂载到 node 上面(通常为将存储load到node的/dev下面)；
第三个**mount**阶段，将对应的存储进一步挂载到 pod 可以使用的路径。


## 二. Static Provisioning && Dynamic Provisioning

### 2.1 Static Provisioning

{% asset_img  static-provision.PNG Static Provisioning %}

### 2.2 Dynamic Provisioning

{% asset_img  dynamic-provision.PNG  Dynamic Provisioning %}

<div style="text-align: center;">
	
![relationship](https://user-images.githubusercontent.com/5608425/64247540-aafc5c00-cf41-11e9-83af-64199e79ded7.JPG)
**Kubernetes pvc 动态绑定流程**
</div>

> 只有同属于一个 StorageClass 的PV 和 PVC，才可以绑定在一起

## 参考:

1. [《Kubenetes in Action》七牛容器云团队](http://product.dangdang.com/26439199.html?ref=book-65152-9168_1-529800-3)
2. <<深入剖析Kubernetes - 28  PV、PVC、StorageClass，这些到底在说啥？>> 张磊
3. <<深入剖析Kubernetes - 29  PV、PVC体系是不是多此一举？从本地持久化卷谈起>> 张磊
4. [第9 章 ： 应用存储和持久化数据卷：核心知识](https://edu.aliyun.com/lesson_1651_13085#_13085) 