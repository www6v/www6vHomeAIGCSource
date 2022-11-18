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


## 物理架构 [1]
+ broker <-> bundle负载均衡 <-> topic
  - bundle负载均衡
  	一致性hash映射
  	以Bundle为单位进行Topic迁移
  - brocker leader
    负责为其他几个Broker分配Bundle

{% asset_img bundle.png bundle %}      

## 逻辑架构 [1]
+ tenant  
   + namespace
     + topic

## 架构
{% asset_img concept.png 概念 %} 


## 跨地域复制[2]
+ Full-mesh(全连通)
  + Replicator
+ 单向复制
+ Failover 模式
  单向复制的特例





## 参考
1. [【9张图】带你认识pulsar负载均衡利器Bundle ](https://mp.weixin.qq.com/s/MHrrqldqtT_XOiwIPINRGQ) jinjunzhu
2. [博文推荐 | Apache Pulsar 三大跨地域复制解决方案](https://mp.weixin.qq.com/s?__biz=MzUyMjkzMjA1Ng==&mid=2247487443&idx=2&sn=b9dcb5013a17c8afeb7edaf628bd162b)
3. [博文推荐｜Apache Pulsar 跨地域复制方案选型实践](https://mp.weixin.qq.com/s?__biz=MzUyMjkzMjA1Ng==&mid=2247491540&idx=1&sn=cf6292ac7b29d8c3b8bbd95a0f6c71c2) *** 
4. [Geo Replication](https://pulsar.apache.org/docs/next/concepts-replication/) 未








