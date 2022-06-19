---
title: HBase总结
date: 2020-09-04 10:53:01
tags:
  - hbase
categories: 
  - 大数据
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
  **分片， 水平切分（split）， 负载均衡的基本单位**
  Region包含<code>n个Store</code>   **Store==column family**
  Store包含<code>1个MemStore</code>和<code>n个HFile</code>
  MemStore： 写缓存 
  HFile的Compact操作， 小文件合并成大文件
+ MemStore
  由两个ConcurrentSkipListMap实现（双缓冲）;
  ConcurrentSkipListMap A异步flush罗盘成HFile;
  **HDFS只允许顺序读写，MemStore在落盘生成HFile之前完成kv的排序；  **
+ HFile
  **HFile Data Block（文件读取的最小单元）内的kv是按key排序的索引树，对读友好**；
  HFile Index Block的索引结构分为两种: V1 单层索引， V2 多级索引（只加载部分索引，降低内存使用）
  HDFS的Block默认是64M，128M；HBase的Block默认是64K；
  {% asset_img  HFile.JPG  HFile物理结构 %}

 Block Type |    基本介绍
:-:|:-:
Data Block| 用户Key-Value 
Meta Block| Bloom过滤器相关元数据
Root Index| HFile索引树根索引
Intermediate Level Index| HFile索引树中间层级索引
Leaf Level Index| HFile索引树叶子索引 


## 四. 读写流程和读优化
### 1. 写流程
客户端写入MemStore和HFile就表示写入成功。
Flush的时机： 三个flush的参数

### 2. 读流程
**BlockCache没有数据的前提下， MemStore和StoreFile（HFile）都会读取数据。**

### 总结 
Master不参与读写流程，但是master宕机了，集群会处于不健康状态， Region分裂后改不了元数据。
客户端只要配置Zookeeper地址，Master的切换对客户端是透明的。
客户端缓存Meta数据， RegionServer的BlockCache缓存StoreFile（HFile）的数据。


### 3. HFile Compaction  读优化
3.1 类型
 Minor Compaction: 小的相邻HFile合并成更大的HFiile。
 Major Compaction: 一个store中所有的HFile合并成一个HFile。**线上建议关闭自动触发，改为在低峰期手动或者自动触发**。
 **Minor Compaction不会删除数据，Major Compaction会删除数据。** 
 **Minor Compaction 合并后，旧的数据不会马上删除， 会对客户端不可见。** 

3.2 Compaction作用
 减少文件数， **稳定随机读延迟**; 用短时间的IO消耗以及带宽消耗换取后序读操作的低延迟。（空间换时间）.
 清除无效数据，较少数据存储量。


### 4. 数据删除时机
flush和Major Compaction的时候会删除冗余的数据。
flush时只删除内存的冗余数据，不删除"Delete标记",因为在Major Compaction删冗余数据的时候会用到这个"Delete标记"。


## 五. Region分裂（split）
+ 寻找分裂点
+ Region迁移的状态存在meta表， Master内存， zookeeper的region-in-transition节点
  **RIT状态**： Region在三个地方不能保持一致
+ 整个分裂过程包装成了一个事务， 保证分裂事务的原子性。
  **迁移的中间状态都只存储在内存中， 一旦在分裂过程中出现RegionServer宕机，有可能出现RIT状态， 需要HBCK工具分析并解决。**
+ **Region分裂过程没有涉及数据的移动， 分裂后的子Region的文件没有任何用户数据。 [通过reference文件来查找数据，像游标offset]**  
  **真正数据迁移的迁移发生在子Region执行Major Compaction时。**

## 六. 优化和最佳实践
### **预分区**
自动split有数据倾斜问题，所以要预分区。
建议: 生产中列簇不要太多, 列簇数据要有同步增长的趋势（不要一个列簇有很多数据， 其他列簇数据很少），
      防止Region分裂时产生多个小文件。

### Row_key设计  防止热点的三种方法
1. Salt
2. Hash
3. Reversing

## 五. 性能和版本
###  性能  
单表 千亿行， 百万列  容量TB甚至PB级别

###  版本
**v0.98**    目前生产线上使用最广泛的版本之一
**v1.4.10**   HBase社区推荐使用的稳定版本
**v2.x**    最受期待的一个版本

### 工作中接触的
+ MVCC
+ 读写队列 - 4个核心参数
+ TTL - TTL失效问题
+ 多租户方案
  rsgroup
+ 二级索引  
+ 超时 Timeout
+ RIT
+ 高可用
  双向同步
+ 优化
+ bulkload
+ CAS
HBase提供基于单 行 数据操作的原子性保证
HBase基于行锁来保证单行操作的原子性
checkAndPut/checkAndDelete/increment/append  

## 参考：
1. [【Paper笔记】The Log structured Merge-Tree（LSM-Tree）](https://kernelmaker.github.io/lsm-tree)
2. 《Hbase原理和实践》 胡争  范欣欣   第1,2,5,7，8章



