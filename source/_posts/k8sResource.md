---
title: Kubernetes Workload
date: 2019-06-09 22:13:52
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

## Workload
{% asset_img   k8sResource.jpg  Kubenetes Workload  %} 

##### Config
类型   | 用途  |  使用方式 | 安全
:-:      |  :-:     |  :-:             |   :-:  
ConfigMap |普通配置 |  环境变量 <br> 文件挂载（卷 Volume） | 纯文本
Secret| 敏感数据|  环境变量 <br>文件挂载 | Base64




## 参考:

1. [《Kubenetes in Action》](http://product.dangdang.com/26439199.html?ref=book-65152-9168_1-529800-3)  七牛容器云团队
2. [资源对象](https://feisky.xyz/kubernetes-handbook/concepts/objects.html)    feisky ***
3. [面向 Kubernetes 编程： Kubernetes 是下一代操作系统](https://mp.weixin.qq.com/s/E5-agHtMvW_X7znVJDkTKA) ***
4. [第4 章 ： 理解 Pod 和容器设计模式](https://edu.aliyun.com/lesson_1651_13079?spm=5176.254948.1334973.10.2c12cad2AHzzTw#_13079) 阿里
5. [第3 章 ： Kubernetes 核心概念](https://edu.aliyun.com/lesson_1651_13078?spm=5176.254948.1334973.8.2c12cad2AHzzTw#_13078) 阿里 
6. [第5 章 ： 应用编排与管理：核心原理](https://edu.aliyun.com/lesson_1651_13080?spm=5176.254948.1334973.12.2c12cad2AHzzTw#_13080) 阿里



