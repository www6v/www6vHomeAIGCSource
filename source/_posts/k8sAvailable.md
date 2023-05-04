---
title: K8S高可用-零停机
date: 2022-04-05 15:09:31
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->

## 自主中断和非自主中断[4]
{% asset_img  interrupt.png  自主中断和非自主中断 %}

## PodDisruptionBudged
  1. 无状态应用： 
     maxUnavailable = 40%
  2. 单实例有状态应用: 
  3. 多实例有状态应用： 
     etcd N, maxUnavailable=1 或者 minAvailable=N


## 健康检查
**Liveness Probe**:  确定何时重启容器. 例如，当应用程序处于运行状态但无法做进一步操作，liveness探针将捕获到deadlock，重启处于该状态下的容器，使应用程序在存在bug的情况下依然能够继续运行下去。
liveness的初始值为成功。
**Readiness Probe**:  确定容器是否已经就绪可以接受流量. 该信号的作用是控制哪些Pod应该作为service的后端。如果Pod处于非就绪状态，那么它们将会被从service的load balancer中移除。
readiness的初始值为失败。
**startupProbe**: 启动检查, 使用启动探针检测容器应用程序是否已经启动


+ 探针类型
httpGet: 指定端口和路径执行 HTTP GET 请求
tcpSocket: 对容器的 IP 地址上的指定端口执行 TCP 检查
命令,exec: 在容器内执行指定命令

## 优雅终止 [3]

  系统底层默认会向主进程发送 SIGTERM 信号，而对剩余子进程发送 SIGKILL 信号。系统这样做的大概原因是因为大家在设计主进程脚本的时候都不会进行信号的捕获和传递，这会导致容器关闭时，多个子进程无法被正常终止，所以系统使用 SIGKILL 这个不可屏蔽信号，而是为了能够在没有任何前提条件的情况下，能够把容器中所有的进程关掉。

  也就是说如果主进程自身不是服务本身，可能会导致是被强制Kill的，解决的方法也很简单，也就是在主进程中对收到的信号做个转发，发送到容器中的其他子进程，这样容器中的所有进程在停止时，都会收到 SIGTERM，而不是 SIGKILL 信号了。




## 参考：
1. [更新应用时，如何实现 K8s 零中断滚动更新](https://blog.csdn.net/alisystemsoftware/article/details/106520606) 未
2. [使用 PDB 避免 Kubernetes 集群中断](https://zhuanlan.zhihu.com/p/360521649) 未
3. 04 | 理解进程(3):为什么我在容器中的进程被强制杀死了? -  李程远 
4. 模块十一： 将应用迁移至Kubernetes平台

---
健康检查
1. [Liveness和Readiness两种Health Check手段在Kubernetes中的使用](https://blog.51cto.com/3842834/2317986)  耕耘实录
2. [配置Pod的liveness和readiness探针](https://github.com/rootsongjc/kubernetes-handbook/blob/master/guide/configure-liveness-readiness-probes.md)  宋净超
3. [liveness与readiness的探针工作方式源码解析](https://www.cnblogs.com/xuxinkun/p/11785521.html)  xinkun的博客
4. [Kubernetes 探针详解！](https://mp.weixin.qq.com/s/wT_NQF9xYfKD3wVm6yUUMw) 未