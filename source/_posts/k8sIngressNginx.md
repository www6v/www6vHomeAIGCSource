---
title:  Kubernetes Nginx Ingress
date: 2022-02-10 22:41:32
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

## Kubernetes Nginx Ingress
##### K8s官方维护
+ There are three ways to customize NGINX:
   - **ConfigMap**: using a Configmap to set global configurations in NGINX.
   - **Annotations**: use this if you want a specific configuration for a particular Ingress rule.
   - **Custom template**: when more specific settings are required, like open_file_cache, adjust listen options as rcvbuf or when is not possible to change the configuration through the ConfigMap.

[Ingress-Nginx Doc](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/)
[Ingress-Nginx Github](https://github.com/kubernetes/ingress-nginx)

##### Nginx官方维护
[Nginx-ingress Doc](https://docs.nginx.com/nginx-ingress-controller/configuration/ingress-resources/advanced-configuration-with-annotations/)
[Nginx-ingress GitHub](https://github.com/nginxinc/kubernetes-ingress)

##### 比较
[nginx-ingress-controllers.md](https://github.com/nginxinc/kubernetes-ingress/blob/main/docs/content/intro/nginx-ingress-controllers.md)    表格      



## 参考
[kubernetes架构师课程](https://www.bilibili.com/video/BV16t4y1w7r6?p=162)

