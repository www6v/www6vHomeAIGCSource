---
title: Java和Go的并发
date: 2020-04-30 13:02:16
tags:
  - concurrent
  - 并发
categories: 
  - 语言
  - 并发  
---

<p></p>
<!-- more -->

## 一. Java和Go的并发
{% asset_img javaAndgo.JPG Java和Go的并发 %}

## 二. goroutine的调度

{% asset_img goroutine.JPG goroutine的调度 %}
System Thread = kernel entity
Processor = go实现的协程处理器
Goroutine = 协程

Processor挂载着一个协程队列


