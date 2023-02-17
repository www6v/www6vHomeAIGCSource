---
title: Kubernetes CoreDNS
date: 2022-01-12 15:26:32
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

## CoreDNS插件架构
github中

## Kubernetes DNS
+ Kubernetes服务发现 
{% asset_img k8sDNS.png  k8s DNS %}

## 自定义域名解析
+ hosts: 存量代码域名调用
+ rewrite: 集群外服务调用
+ forward： 配置存根域

{% asset_img customizeDNS.png  自定义域名解析 %}

## CoreDNS 部署架构
+ kubesphere.local
+ prod.kubesphere.local
+ dev.kubesphere.local
+ qa.kubesphere.local
+ test.kubesphere.local

{% asset_img coreDNS-arch.png  CoreDNS部署架构 %}


## reference:
1. [【Meetup 分享】使用 KubeSphere & CoreDNS 搭建云原生 DNS](https://www.bilibili.com/video/BV1HY4y1n7PV)
2. [详解 DNS 与 CoreDNS 的实现原理](https://draveness.me/dns-coredns/) 未


