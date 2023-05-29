---
title: kubelet和PLEG
date: 2022-04-03 21:40:02
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes
---


<p></p>
<!-- more -->


## kubelet管理Pod的核心流程
{% asset_img  startPodInKubelet.png    kubelet管理Pod的核心流程  %}


## Pod启动流程 [2][3]
{% asset_img  podStart.png   Pod启动流程  819  439  %}

{% asset_img  schedule.jpg  720 426    %}

## PLEG 
   relist操作

参考：
1. [kubelet 原理解析二：pleg](http://www.xuyasong.com/?p=1819)
2. 《模块七：Kubernetes控制平面组件》
3. [从架构层面了解Kubernetes](https://zhuanlan.zhihu.com/p/562805848)

