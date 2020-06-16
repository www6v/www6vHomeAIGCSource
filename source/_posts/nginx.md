---
title: Nginx和Tomcat总结
date: 2019-08-22 02:17:53
tags:
  - Nginx
categories:
  - 分布式
  - 中间件
  - nginx
---

<p hidden></p>
<!-- more -->

<div style="text-align: center;">
![Nginx总结](https://user-images.githubusercontent.com/5608425/64508349-cedbeb00-d30f-11e9-836c-2f920725e1bb.jpg) 
Nginx总结

![tomcat组件](https://user-images.githubusercontent.com/5608425/64508350-cedbeb00-d30f-11e9-8c01-9f7e5abffcba.png)
tomcat组件
</div>

一. Nginx架构
1. 共享内存 Slab
   分页 4K， 8K， 16K


二. Nginx反向代理
+ 类型
1. round-robin是基础 
2. ip-hash -> real-ip
3. hash -> 自定义可以hash的参数
3. least-connection


+ 可扩展立方体
1. X-axis 基于round-robin或者least-connected算法分发请求 -> 相对简单
2. Y-axis 基于URL对功能进行分发。 -> 相对复杂
3. Z-axis 将用户IP地址或者其他信息映射到某个特定的服务或者集群 -> 相对简单


+ 多种协议反向代理
1. tcp udp 透传
2. http -> memcached , scgi, fastcgi, uwsgi, grpc, http, websocket


## 参考:

1. [深入Nginx 思维导图](https://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=2651010416&idx=4&sn=dfa07f0e065d273b028e662e87e780ff&chksm=bdbecd238ac9443511c4e7eadf9e59cc9139fac25c52b44f7a93787b940826c5f61f06e10224&scene=27#wechat_redirect)
2. [tomcat 组件 Top level view](https://www.iteye.com/blog/onlyor-1689344)


