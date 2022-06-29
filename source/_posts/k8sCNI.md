---
title: Kubernetes CNI插件
date: 2022-04-03 23:59:15
tags:
  - Kubenetes
categories: 
  - 云原生
  - Kubernetes
---


<p></p>
<!-- more -->


## 如何使用CNI插件
1. 配置CNI配置文件
   /etc/cni/net.d/xxnet.conf
2. 安装CNI二进制插件
   /opt/cni/bin/xxnet
3. 在这个节点上创建Pod
4. kubelet 根据CNI配置文件执行CNI插件
5. Pod的网络配置完成

## CNI插件 三种实现模式
{%asset_img types.png %}

+ Overlay
  容器有自己的ip段
  通过隧道的方式，容器网段的包封装成物理主机之间的包
  不依赖底层网络
+ 路由
底层网络需要二层可达的能力
+ Underlay
强依赖底层网络

## CNI插件的选择
{%asset_img chooseCNI.png %}

+ 环境限制
  - 虚拟化 
     网络限制多：限制二层访问，只能三层ip转发（overlay）
  - 物理机
     网络限制少： underlay或者路由

+ 功能需求
  - 安全
     NetworkPolicy
  - 集群外资源互联互通
     underlay ， calico-bgp
  - 服务发现与负载均衡       

+ 性能需求  
  - Pod创建速度
  - Pod网络性能
    Overlay性能相对较差
    Underlay和路由模式网络插件性能好

## 参考
[如何实现一个 Kubernetes 网络插件](https://mp.weixin.qq.com/s/oC4PemXm6aupFNKKCkqOJQ)
[阿里技术大牛 30 分钟讲透 Kubernetes ： 理解 CNI 和 CNI 插件](https://www.bilibili.com/video/BV1XJ411W7zZ?vd_source=f6e8c1128f9f264c5ab8d9411a644036)
​
