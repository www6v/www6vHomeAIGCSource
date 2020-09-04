---
title: HBase总结
date: 2020-09-04 10:53:01
tags:
  - hbase
categories: 
  - 分布式
  - 存储
  - HBase   
---

<p></p>
<!-- more -->

## 一. 数据模型
### 1. 逻辑视图 
{% asset_img  model-logic.jpg  hbase逻辑视图 %}
**row**: <code>rowkey + (column + columnValue)*n</code> 
**column**: <code>column family:qualifier</code>   column family固定, qualifier可增加 
**cell**： (row, column, timestamp, type, value) 

### 2. 物理视图
HBase中的数据是按照列簇存储的。
KV存储结构 K( (row, column, timestamp, type) ) -> V( value )  
<code>
{"com.cnn.www","anchor","cnnsi.com","put","t9"} -> "CNN"
{"com.cnn.www","anchor","my.look.ca","put","t8"} -> "CNN.com"
{"com.cnn.www","contents","html","put","t7"} -> "..."
{"com.cnn.www","contents","html","put","t6"} -> "..."
{"com.cnn.www","contents","html","put","t5"} -> "..."
{"com.example.www","people","author","put","t5"} -> "John Doe"
</code>

## 二. 架构
{% asset_img  arch.JPG  hbase体系结构 %}

### RegionServer
+ WAL（HLog）
+ BlockCache  
  LRUBlockCache(时间局部性), BucketCache(空间局部性)
+ Region
  分片， 水平切分（split）， 负载均衡的基本单位
  Region包含<code>n个Store</code>   Store==column family
  Store包含<code>1个MemStore</code>和<code>n个HFile</code>
  MemStore： 写缓存 
  HFile的Compact操作， 小文件合并成大文件

## 三. 版本

**v0.98**    目前生产线上使用最广泛的版本之一
**v1.4.10**   HBase社区推荐使用的稳定版本
**v2.x**    最受期待的一个版本



