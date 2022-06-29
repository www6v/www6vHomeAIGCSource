---
title: K8S CNI
date: 2022-04-03 23:59:15
tags:
  - Kubenetes
categories: 
  - 云原生
  - Kubernetes
---


<p></p>
<!-- more -->


## 如何使用CNI
1. 配置CNI配置文件
   /etc/cni/net.d/xxnet.conf
2. 安装CNI二进制插件
   /opt/cni/bin/xxnet
3. 在这个节点上创建Pod
4. kubelet 根据CNI配置文件执行CNI插件
5. Pod的网络配置完成

## CNI 类型
{%asset_img types.png %}

## CNI 选择
{%asset_img chooseCNI.png %}

## 参考
[如何实现一个 Kubernetes 网络插件](https://mp.weixin.qq.com/s/oC4PemXm6aupFNKKCkqOJQ)
[阿里技术大牛 30 分钟讲透 Kubernetes ： 理解 CNI 和 CNI 插件](https://www.bilibili.com/video/BV1XJ411W7zZ?vd_source=f6e8c1128f9f264c5ab8d9411a644036)
​
