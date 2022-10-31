---
title: Pulsar
date: 2022-05-31 13:31:21
tags:
  - 消息系统
  - RocketMQ
categories:
  - 分布式 
  - 中间件
  - 消息系统
  - Pulsar   
---

<p></p>
<!-- more -->


## 物理架构
+ broker <-> bundle负载均衡 <-> topic
  	+ bundle负载均衡
  	  一致性hash映射
  	  以Bundle为单位进行Topic迁移
    + brocker leader
      负责为其他几个Broker分配Bundle

## 逻辑架构
+ tenant  
   + namespace
     + topic

## 参考
[【9张图】带你认识pulsar负载均衡利器Bundle ](https://mp.weixin.qq.com/s/MHrrqldqtT_XOiwIPINRGQ) jinjunzhu








