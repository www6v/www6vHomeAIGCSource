---
title: K8s 集成Springcloud
date: 2023-04-15 10:42:05
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->

#  Case1[2]
+ nginx + springcloud gateway  
+ erueka + 本地配置

{% asset_img  'arch1.png' %}

# Case2[1]
+ k8s ingress 结合spring gateway
+ spring-admin做服务注册, ConfigMap做服务配置

# 参考
1. [云原生Java架构师的第一课K8s+Docker+KubeSphere+DevOps](https://www.bilibili.com/video/BV13Q4y1C7hS/?p=166)  166  V 
   [项目Repo](https://github.com/www6v/spring-cloud-bookinfo/) git
   
2. [SpringCloud微服务电商系统在Kubernetes集群中上线详细教程](https://blog.csdn.net/web18484626332/article/details/126516371)
   用的都是Deployment ，需要部署成StatefulSet