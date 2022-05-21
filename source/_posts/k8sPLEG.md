---
title: kubelet和PLEG
date: 2022-04-03 21:40:02
tags:
  - Kubenetes
categories: 
  - 云原生
  - Kubernetes
---


<p></p>
<!-- more -->


## kubelet管理Pod的核心流程
{% asset_img  startPodInKubelet.png    kubelet管理Pod的核心流程  %}


## Pod启动流程
{% asset_img  podStart.png   Pod启动流程  %}


## PLEG 
   relist操作

参考：
[kubelet 原理解析二：pleg](http://www.xuyasong.com/?p=1819)
模块七：Kubernetes控制平面组件