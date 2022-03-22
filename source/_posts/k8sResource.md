---
title: Kubernetes Workload
date: 2019-06-09 17:13:52
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

{% asset_img   k8sResource.jpg  Kubenetes Workload  %} 

{% asset_img   k8sDeployment.jpg  Kubenetes服务部署  %} 



|用途| 类型 | 安全
:-:|:-:|:-:
ConfigMap |普通配置 |  环境变量 <br> 文件挂载（卷 Volume） | 纯文本
Secret| 敏感数据|  环境变量 <br>文件挂载 | Base64

 

**健康检查**
**liveness**:  确定何时重启容器. 例如，当应用程序处于运行状态但无法做进一步操作，liveness探针将捕获到deadlock，重启处于该状态下的容器，使应用程序在存在bug的情况下依然能够继续运行下去。
liveness的初始值为成功。
**readiness**:  确定容器是否已经就绪可以接受流量. 该信号的作用是控制哪些Pod应该作为service的后端。如果Pod处于非就绪状态，那么它们将会被从service的load balancer中移除。
readiness的初始值为失败。



**监控方案**
cadvisor/exporter+prometheus+grafana

## 参考:

1. [《Kubenetes in Action》](http://product.dangdang.com/26439199.html?ref=book-65152-9168_1-529800-3)  七牛容器云团队
2. [资源对象](https://feisky.xyz/kubernetes-handbook/concepts/)    feisky
3. [面向 Kubernetes 编程： Kubernetes 是下一代操作系统](https://mp.weixin.qq.com/s/E5-agHtMvW_X7znVJDkTKA)
4. [第4 章 ： 理解 Pod 和容器设计模式](https://edu.aliyun.com/lesson_1651_13079?spm=5176.254948.1334973.10.2c12cad2AHzzTw#_13079) 阿里
5. [第3 章 ： Kubernetes 核心概念](https://edu.aliyun.com/lesson_1651_13078?spm=5176.254948.1334973.8.2c12cad2AHzzTw#_13078) 阿里 
6. [第5 章 ： 应用编排与管理：核心原理](https://edu.aliyun.com/lesson_1651_13080?spm=5176.254948.1334973.12.2c12cad2AHzzTw#_13080) 阿里


---
Deployment D


1. [如何在 Kubernetes 中对无状态应用进行分批发布](https://www.infoq.cn/article/oyjoCIZBpxw*dI21AXPI)  阿里 孙齐（代序）
2. [第6 章 ： 应用编排与管理： Deployment](https://edu.aliyun.com/lesson_1651_13081?spm=5176.10731542.0.0.e7a120beywNIVX#_13081)  阿里
3. [kubernetes 最佳实践：优雅热更新](https://tencentcloudcontainerteam.github.io/2019/05/08/kubernetes-best-practice-grace-update/)  陈鹏

---
健康检查
1. [Liveness和Readiness两种Health Check手段在Kubernetes中的使用](https://blog.51cto.com/3842834/2317986)  耕耘实录
2. [配置Pod的liveness和readiness探针](https://github.com/rootsongjc/kubernetes-handbook/blob/master/guide/configure-liveness-readiness-probes.md)  宋净超
3. [liveness与readiness的探针工作方式源码解析](https://www.cnblogs.com/xuxinkun/p/11785521.html)  xinkun的博客


---
监控方案
1. [Prometheus监控k8s](https://www.jianshu.com/p/e76053b6f3f5)  baiyongjie
