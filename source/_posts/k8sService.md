---
title:  Kubernetes服务
date: 2019-11-04 11:56:32
tags:
  - Kubernetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->

{% asset_img   k8sService.jpg  Kubernetes服务  %} 


## 一. Kubenetes服务
### 1.1 kube-proxy -> userspace 代理模式
<div style="text-align: center;">
<img width="450" alt="user-space-proxy" src="https://user-images.githubusercontent.com/5608425/68077955-2b3b2280-fe08-11e9-8672-3210219a7372.png">
userspace 代理模式
</div>

### 1.2 kube-proxy -> Iptables Proxy Mode
<div style="text-align: center;">
<img width="450" alt="iptables-proxy" src="https://user-images.githubusercontent.com/5608425/68077954-2b3b2280-fe08-11e9-8231-cb9bc177ba21.png">
 Iptables Proxy Mode
</div>

### 1.3 kube-proxy -> IPVS proxy mode
> IPVS是LVS一个组件，提供高性能、高可靠性的四层负载均衡器。IPVS 是IP Virtual Server的简写。IPVS构建在netfilter上，作为Linux 内核的一部分，从传输层实现了负载均衡。

## 参考:
1. [深入理解 Kubernetes之：Service](https://www.kubernetes.org.cn/5992.html) good