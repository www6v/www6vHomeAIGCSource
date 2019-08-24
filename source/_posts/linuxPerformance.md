---
title: Linux性能优化
date: 2019-08-08 19:43:38
tags:
  - linux
categories:
  - linux
  - 性能优化  
---

<p hidden>linux性能优化</p>

<!-- more -->

<div style="width:70%; height:70%;">
{% asset_img   cpu.jpg  cpu  %} 
</div>

{% asset_img   memory.jpg  memory  %} 
{% asset_img   io.JPG  io  %} 


> Buffer是对磁盘数据的缓存，而Cache是文件数据的缓存，它们既会用在读请求中，也会用在写请求中。

## 参考：

1. <<Linux性能优化实战  11 - 套路篇：如何迅速分析出系统CPU的瓶颈在哪里？>> 倪朋飞
2. <<Linux性能优化实战  21 - 套路篇：如何“快准狠”找到系统内存的问题？>> 倪朋飞
3. <<Linux性能优化实战  30 - 套路篇：如何迅速分析出系统IO的瓶颈在哪里？>> 倪朋飞
4. <<Linux性能优化实战  16 - 基础篇：怎么理解内存中的Buffer和Cache？>> 倪朋飞

