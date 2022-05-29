---
title: iptables总结
date: 2019-08-19 14:31:40
tags:
  - 网络
categories:
  - linux 
  - 网络
  - iptables    
---

<p></p>
<!-- more -->

## 一. Overview
<div style="width: 70%; height: 70%">
![iptables](https://user-images.githubusercontent.com/5608425/63585097-ebb6b580-c5d0-11e9-8d8e-dcb116d4ca65.jpg)
</div>

![iptables-overview2](https://user-images.githubusercontent.com/5608425/63585098-ebb6b580-c5d0-11e9-88a3-dbb557f0d838.jpg)

![iptables-overview3](https://user-images.githubusercontent.com/5608425/63585099-ec4f4c00-c5d0-11e9-936d-9057cfe4f75e.jpg)

## 二. 规则
![iptables-rule](https://user-images.githubusercontent.com/5608425/63585100-ec4f4c00-c5d0-11e9-8518-64669984ff82.png)

```
iptables -t 表名 <-A/I/D/R> 规则链名 [规则号] <-i/o 网卡名> -p 协议名 <-s 源IP/源子网> --sport 源端口 <-d 目标IP/目标子网> --dport 目标端口 -j 动作
```

## 参考:

1. [理解 Istio Service Mesh 中 Envoy 代理 Sidecar 注入及流量劫持](https://jimmysong.io/posts/envoy-sidecar-injection-in-istio-service-mesh-deep-dive/)
2. [iptables](https://wangchujiang.com/linux-command/c/iptables.html)
3. [iptables概念](http://www.zsythink.net/archives/1199/)
4. [iptables 从入门到应用](https://www.cnblogs.com/frankb/p/7427944.html)
5. [趣谈Linux操作系统 - 46-发送网络包（下）：如何表达我们想让合作伙伴做什么]()  刘超








