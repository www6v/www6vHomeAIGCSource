---
title: 故障模型-2 Middleware 
date: 2018-05-03 21:59:42
tags:
  - 故障模型
categories:
  - 稳定性
  - 故障模型
---

<p></p>
<!-- more -->


{% asset_img fault2.jpg 故障模型2 %}


# 参考

### 大纲
1. [超全总结 | 阿里如何应对电商故障？神秘演练细节曝光](https://developer.aliyun.com/article/105551) 阿里巴巴  周洋

### Runtime & Middleware & OS
1. [热点 Key 问题的发现与解决](https://help.aliyun.com/document_detail/67252.html) 阿里 文档

> 通常的解决方案主要集中在对**客户端**和**Server端**进行相应的改造。 
  I. 服务端本地缓存.
  II. 服务端分布式缓存。

> 阿里云方案 (整体看是用中间件 负载均衡 水平扩展)   
  I. 读写分离方案解决热读
     写 热备; 读 存储水平扩展
  II. 热点数据解决方案
     该方案通过主动**发现热点**并对其进行**存储**来解决热点Key的问题。

2. [UCloud高可用数据库UDB主从复制延时的解决](https://www.admin5.com/article/20190404/902952.shtml)

