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
##### K8s官方维护 [1][2]
+ There are three ways to customize NGINX:
   - **ConfigMap**: using a Configmap to set global configurations in NGINX. 
     [滚动更新后生效， 针对全局的配置]
   - **Annotations**: use this if you want a specific configuration for a particular Ingress rule. [立即生效，针对某个域名location进行配置]
   - **Custom template**: when more specific settings are required, like open_file_cache, adjust listen options as rcvbuf or when is not possible to change the configuration through the ConfigMap.

##### Nginx官方维护 [3][4]

##### 比较 [5]

## 实践
+ 域名重定向 ***
  <code>redirect</code> ，  http 重定向到https， 新旧域名替换
  
+ 前后端分离 ***
<code>rewrite</code>
```
+ www.a.com /    --> 前端服务
+ www.a.com /api --> 后端服务 /api  
  www.a.com/api rewrite到  www.a.com 
```
+ SSL配置  [p]
  验证  自签名证书

+ 匹配请求头
  Mobile 和 PC 的请求头不同，路由到不同的后端服务
  
+ 实现灰度金丝雀发布

+ 速率限制

+ 黑白名单
  allow deny
  
+ 自定义错误页面

## 参考
1. [Ingress-Nginx Doc](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/)
2. [Ingress-Nginx Github](https://github.com/kubernetes/ingress-nginx)
3. [Nginx-ingress Doc](https://docs.nginx.com/nginx-ingress-controller/configuration/ingress-resources/advanced-configuration-with-annotations/)
4. [Nginx-ingress GitHub](https://github.com/nginxinc/kubernetes-ingress)
5. [nginx-ingress-controllers.md](https://github.com/nginxinc/kubernetes-ingress/blob/main/docs/content/intro/nginx-ingress-controllers.md)    表格 


99. [kubernetes架构师课程](https://www.bilibili.com/video/BV16t4y1w7r6?p=162)

