---
title: Pulsar
date: 2022-05-31 13:31:21
tags:
  - 消息系统
categories:
  - 消息系统
  - Pulsar   
---

<p></p>
<!-- more -->


## 物理架构 [1]
+ broker <-> bundle负载均衡 <-> topic
  - bundle负载均衡
  
  	一致性hash映射
  	以Bundle为单位进行Topic迁移
  - brocker leader
    负责为其他几个Broker分配Bundle
  
+ bundle负载均衡
  + bundle的分割
  + offload unload 卸载

{% asset_img bundle.png bundle %}      

## 逻辑架构 [1]
+ tenant  
   + namespace
     + topic

## 架构
{% asset_img concept.png 概念 %} 


## 参考
1. [【9张图】带你认识pulsar负载均衡利器Bundle ](https://mp.weixin.qq.com/s/MHrrqldqtT_XOiwIPINRGQ) jinjunzhu
2. 《Pulsar In Action中文版》 第二章







