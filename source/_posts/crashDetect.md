---
title: 宕机检测 - Lease、心跳
date: 2019-10-12 10:50:19
tags:
  - 宕机
categories:
  - 分布式 
  - 稳定性
  - 宕机
---

<p></p>
<!-- more -->


**Lease** 
<div style="text-align: center;">
![lease](https://user-images.githubusercontent.com/5608425/66694573-605fc380-ece7-11e9-8213-9fd6cfe8ae1c.jpg)
</div>

Kubernetes: 引入了一个新的 build-in Lease API[2]

**心跳**
 模式： ping-ping模式, ping-pong模式
 raft： 心跳选主


## 参考:

1. [【分布式系统工程实现】如何检测一台机器是否宕机？](https://www.cnblogs.com/gaowenbin/archive/2012/07/08/2581948.html)  阿里中间件  good
2. [当 K8s 集群达到万级规模，阿里巴巴如何解决系统各组件性能问题？](https://mp.weixin.qq.com/s/skjNwU6Rdsn2qWN2KHU9zg)  曾凡松（逐灵） good
3. [《面向模式的软件架构-卷4》]()   20.15节

