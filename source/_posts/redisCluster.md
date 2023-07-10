---
title: Redis Cluster
date: 2022-07-11 06:45:41
tags:
  - KV
categories:
  - 数据库
  - KV
  - Redis
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# Cluster 功能 [1]
+ Redis Cluster支持多个master，每个master又可以挂载多个slave
  - 读写分离
  - 支持数据的高可用
  
+ 故障转移， 高可用
  由于Cluster自带Sentinel的故障转移机制，内置了高可用的支持， **无需再去使用哨兵功能**  
+ 由对应的集群来负责维护节点、插槽和数据之间的关系

# slot
Redis集群有16384个哈希槽每个key通过CRC16校验后对16384取模来决定放置哪个槽，集群的每个节点负责一部分hash槽.

###   分片方式
- crc（key）% 16384

###  映射关系
   key （→ CRC） 分片
   分片 (→ 映射关系)  实例 

###   slot分配
- 自动分配slot
  create() 
- 手动分配slot
  meet()
  addSlot()

###  指令
-  MOVED指令， ASK 指令


# 参考
1. [10.Redis集群(cluster)](https://github.com/www6v/Learning-in-practice/tree/master/Redis/10.Redis%E9%9B%86%E7%BE%A4(cluster))
[Redis Cluster](https://www.bilibili.com/video/BV13R4y1v7sP/?p=76)
