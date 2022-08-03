---
title: Elasticsearch 分布式集群  
date: 2019-08-03 22:38:59
tags: 
  - Elasticsearch
categories:  
  - 大数据
  - 存储
  - Elasticsearch
---

<p></p>
<!-- more -->

## ES的集群
##### 分片 [1]
+ 主分片（Primary Shard）
  主分片数设置好后不能变更，如要修改, 需要重建索引。
+ 副本分片（Replica Shard）
  数据可用性
  副本数可以动态调整， 提高读取的吞吐量

##### 节点类型[2]
节点类型| 配置参数 |  默认值
:-:|:-:| :-:
master <br> 要部署多个master节点 |   | 
master eligible <br> master的候选节点 | node.master | true
data <br> 保存分片数据 | node.data | true <br> 默认是数据节点，可以禁止掉
ingest | node.ingest| true
coordinating only | 无 | 每个节点默认都是coordinating节点。设置其他类型全部为false。
machine learning | node.ml | true（需enable x-pack）

+ 一个节点默认情况下是Master eligible, data, ingest的node

##### 集群健康状态 [1]
+ 三种颜色
  - 绿色： 主分片和副本分片都可用
  - 黄色： 主分片可用， 部分副本分片不可用 
  - 红色： 部分主分片不可用 

##### 脑裂问题 [2]
+ 7.0之前的版本
  - 只有在Master eligible节点数大于quorum时, 才能进行选举
  - quorum = master/2 + 1
  - 3个Master eligible时, 设置discovery.zen.minimum_master_nodes为2, 可以避免脑裂
+ 7.0开始
  - 无需配置minimum_master_nodes

##### doc到shard的路由算法 [3]
+ shard = hash(_ routing) + number_of_primary_shards
  primary数, 不能随意修改的根本原因
   
##  数据写入
<div style="text-align: center; width: 70%; height: 70%">

![Elasticsearch 数据写入](https://user-images.githubusercontent.com/5608425/65385405-d7491280-dd60-11e9-9a73-895afca03bb8.png)
Elasticsearch 数据写入
</div>

+ write：文档数据到内存缓存，并存到 translog
+ refresh：内存缓存中的文档数据，到文件缓存中的 segment 。此时可以被搜到
+ flush 是缓存中的 segment 文档数据写入到磁盘


## 参考
1. 38丨分片与集群的故障转移
2. 37丨集群分布式模型及选主与脑裂问题
3. 39丨文档分布式存储
4. [Elasticsearch 数据写入原理](https://mp.weixin.qq.com/s/BSjA_TBuapPHrE4COCp9VA)