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

### 3. column family和LSM-tree
**column family本质上是一颗LSM-tree**。

{% asset_img  LSM-tree.JPG  hbase中的LSM-tree实现 %}

+ LSM-Tree的核心思想就是将写入推迟(Defer)并转换为批量(Batch)写，首先将大量写入缓存在内存，当积攒到一定程度后，将他们批量写入文件中，这要一次I/O可以进行多条数据的写入，充分利用每一次I/O。
+ **LSM-Tree是对写操作友好的索引结构； 将写入操作全部转化为磁盘的顺序写入。一次随机IO写入转换成一次顺序IO写入（HLog顺序写）和一次内存写入（MemStore写入）。**
+ **为了提高读取效率， LSM-tree设计了异步的Compaction**， 小文件合并成大文件（**归并排序**）。

## 二. 架构
{% asset_img  arch.JPG  hbase体系结构 %}

### RegionServer
+ HLog （WAL）
  一个RegionServer有一个或者多个HLog；
  **每个HLog是多个Region共享的**；
  生命周期： 构建，滚动， 失效（MemStore落盘后）， 删除；
+ BlockCache  
  LRUBlockCache(时间局部性)；
  BucketCache(空间局部性)；
+ Region
  分片， 水平切分（split）， 负载均衡的基本单位
  Region包含<code>n个Store</code>   **Store==column family**
  Store包含<code>1个MemStore</code>和<code>n个HFile</code>
  MemStore： 写缓存 
  HFile的Compact操作， 小文件合并成大文件
+ MemStore
  由两个ConcurrentSkipListMap实现（双缓冲）;
  ConcurrentSkipListMap A异步flush罗盘成HFile;
  **HDFS只允许顺序读写，MemStore在落盘生成HFile之前完成kv的排序；  **
+ HFile
  **HFile内的kv是按key排序的索引树，对读友好**；
  HDFS的Block默认是64M，128M；HBase的Block默认是64K； 

## 三. 性能和优化
### 1. 性能  
单表 千亿行， 百万列  容量TB甚至PB级别


### 2. Compaction  读优化
2.1 类型
 Minor Compaction: 小的相邻HFile合并成更大的HFiile。
 Major Compaction: 一个store中所有的HFile合并成一个HFile。**线上建议关闭自动触发，改为在低峰期手动或者自动触发**。

2.2 Compaction作用
 减少文件数， **稳定随机读延迟**; 用短时间的IO消耗以及带宽消耗换取后序读操作的低延迟。（空间换时间）.
 清除无效数据，较少数据存储量

## 四. 版本

**v0.98**    目前生产线上使用最广泛的版本之一
**v1.4.10**   HBase社区推荐使用的稳定版本
**v2.x**    最受期待的一个版本


参考：
1. [【Paper笔记】The Log structured Merge-Tree（LSM-Tree）](https://kernelmaker.github.io/lsm-tree)
2. 《Hbase原理和实践》 胡争  范欣欣   第1,2,7章



