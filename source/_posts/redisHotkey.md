---
title: Redis Hotkey
date: 2022-06-03 21:48:24
tags:
  - Redis
categories:
  - 数据库
  - KV
  - Redis
---

<p></p>
<!-- more -->

## HotKey


[热点 Key 问题的发现与解决](https://help.aliyun.com/document_detail/67252.html) 阿里 文档

> 通常的解决方案主要集中在对**客户端**和**Server端**进行相应的改造。 
> I. 服务端本地缓存.
> II. 服务端分布式缓存。

> 阿里云方案 (整体看是用中间件 负载均衡 水平扩展)   
> I. 读写分离方案解决热读
> 写 热备; 读 存储水平扩展
> II. 热点数据解决方案
> 该方案通过主动**发现热点**并对其进行**存储**来解决热点Key的问题。

