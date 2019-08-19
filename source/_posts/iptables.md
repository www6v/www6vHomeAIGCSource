---
title: iptables
date: 2019-08-19 14:31:40
tags:
  - 网络
  - iptables
categories:
  - 分布式 
  - 网络
  - iptables    
---

<p></p>
<!-- more -->

## 一. Overview
<div style="width: 70%; height: 70%">
{% asset_img  iptables.jpg  iptables %}
</div>

{% asset_img  iptables-overview2.jpg  iptables %}

## 二. 规则
{% asset_img  iptables-rule.png  iptables规则 %}
```
iptables -t 表名 <-A/I/D/R> 规则链名 [规则号] <-i/o 网卡名> -p 协议名 <-s 源IP/源子网> --sport 源端口 <-d 目标IP/目标子网> --dport 目标端口 -j 动作
```

## 参考:

1. [理解 Istio Service Mesh 中 Envoy 代理 Sidecar 注入及流量劫持](https://jimmysong.io/posts/envoy-sidecar-injection-in-istio-service-mesh-deep-dive/)
2. [iptables](https://wangchujiang.com/linux-command/c/iptables.html)
3. [iptables概念](http://www.zsythink.net/archives/1199/)
4. [iptables 从入门到应用](https://www.cnblogs.com/frankb/p/7427944.html)



