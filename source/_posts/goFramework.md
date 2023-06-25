---
title: Go Framework
date: 2022-06-21 11:30:17
tags:
  - Golang
categories:
  - Golang 
  - Framework
---

<p></p>
<!-- more -->

# Web [1]
+ Httprouter
  radix tree 
  
+ chi
  + 最简单的框架
    适合作为web框架入门项目
    核心代码1200行+ 

+ Gin
  - 主要组件
    router 支持分组
    middleware  
    binding-decoder和validator 
    logger 
    context
  - 老牌框架
    核心代码3000行 
  
+ echo
  
+ Fiber
  - 基于fasthttp

+ beego

# 微服务[1]
### 组件
+ config
+ logger
+ metrics
  Prometheus
+ tracing
  OpenTelemetry
+ registry
+ MQ
+ 依赖注入
  wire，dig


### 框架
+ GoMicro [2] + 
+ Go-Zero
+ YOYOGO
+ Dubbo GO
+ Kratos[bili开源]
+ goframe

# 本地缓存[3]
+ freecache
+ bigcache
+ fastcache

{% asset_img  'cache.jpg' %}

# 参考
1. 《17 直播：社区优秀开源框架对比》
2. [go-micro 源码解析 - server & client](https://magodo.github.io/micro-go-src-server-client/)
3. [Golang 本地缓存选型对比及原理总结](https://blog.csdn.net/weixin_52183917/article/details/127704265)
4. [Go 开源本地缓存组件选型对比（freecache、bigcache、fastcache 等）](https://talkgo.org/t/topic/3519)  未
