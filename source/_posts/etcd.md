---
title: etcd
date: 2022-04-06 21:19:30
tags:
  - Kubenetes
categories: 
  - 云原生
  - Kubernetes
---


<p></p>
<!-- more -->

## 读流程
etcd 提供的两种读机制 (串行读和线性读) 
{% asset_img   read1.png   读流程 %}

## 写流程
{% asset_img   write.png   写流程 %}

## 客户端Lease
{% asset_img   lease.png   客户端Lease %}


## MVCC 和 revision




