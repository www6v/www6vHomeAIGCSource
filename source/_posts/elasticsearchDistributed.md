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
##### 分片 shard [1]
+ 分片 shard
  最小的工作单元 
  是一个lucene的index。 
  在lucene中，单个倒排索引文件称为segment，多个segments汇总在一起称为lucence的index
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
   
##  写流程 [4][5]
<div style="text-align: center; width: 70%; height: 70%">

![Elasticsearch 数据写入](https://user-images.githubusercontent.com/5608425/65385405-d7491280-dd60-11e9-9a73-895afca03bb8.png)
Elasticsearch 数据写入
</div>

+ write：文档数据到内存缓存，并存到 translog
  - translog
    高版本， tanslog默认落盘.
    每个shard有一个translog
+ refresh
  内存缓存中的文档数据，到文件缓存中的segment
  **此时可以被搜到**
+ flush 
  - 缓存中的 segment 文档数据写入到磁盘
  - 触发条件  
    默认30min调用一次  
    或者  tanlogs写满(512MB)       
  - 过程
    1. 调用refresh
    2. 调用fsync， segments写入磁盘
    3. 清空translog
+ merge
  - segments 定期合并
    自动进行merge操作
  - 真正删除已经惰性删除的文档   

+ refresh过程	
  - index buffer 写入segment的过程
    index buffer会被清空, translog不会清空。
    断电后, 可以从tanslog中做索引的recover
  - 不会执行fsync操作
  - 一秒一次
  - **refresh之后， 数据就可以被搜索到**


##### 倒排索引的不可变性
+ 不可变性 
  - 不可变，一旦生产， 不可变更
  - 好处
    无需考虑并发写文件的问题
    一旦读入内核的文件系统缓存，便流在那里
    容易缓存、 数据可被压缩
  - 坏处   
    让一个新的文档可以被搜索，需要重建整个索引

## 读流程 [6]
##### 两个阶段
+ Query
+ Fetch

##### 问题
+ 性能问题 
  深度分页

+ 相关性算分
  - 问题
    数据量小，打分偏离
  - 解决方案
    - 数据量小时， 主分片设置为1[有例子]


## 排序 [7]
+ 默认采用**相关性算分**对结果进行**降序排序**
+ 自定义排序
  sorting参数
+ 排序过程
  - 针对字段原始内容进行的
    **倒排索引无法发挥作用**
  - 需要正排索引
    - DocValue
      列式存储，对Text类型无效
      默认开启，可以通过mapping设置关闭
      如果重新打开，要重建索引
      **明确不需要做排序及聚合分析**           
    - Fielddata


## 参考
1. 38丨分片与集群的故障转移
2. 37丨集群分布式模型及选主与脑裂问题
3. 39丨文档分布式存储
4. [Elasticsearch 数据写入原理](https://mp.weixin.qq.com/s/BSjA_TBuapPHrE4COCp9VA) 
5. 40丨分片及其生命周期
6. 41丨剖析分布式查询及相关性算分
7. 42丨排序及DocValues&Fielddata