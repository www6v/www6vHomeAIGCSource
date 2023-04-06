---
title: Rocksdb-SST
date: 2023-04-06 15:17:57
tags:
  - RocksDB
categories: 
  - 数据库
  - 非关系型  
  - RocksDB
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

## Rocksdb SST 类型[1][2]

+ BlockBasedTable [本文重点讨论]    
**an overview of the block-based table type in Rocksdb, which is inherited from LevelDB. **
Data is stored in fixed-sized blocks, which can be compressed and encoded for efficient storage. To retrieve data, the block where the record may reside is located and read into memory, and a search is performed within the block. The block cache is used to avoid frequent reads of the same block.
**Rocksdb 中基于块的表类型的概述，该类型继承自 LevelDB。**
数据存储在固定大小的块中，可以压缩和编码以实现高效存储。为了检索数据，需要定位并读入可能包含记录的块，并在块内执行搜索。块缓存用于避免频繁读取相同的块。

+ Plain table


## Rocksdb SST- BlockBasedTable [5]
{% asset_img  rocksdbSST.jpg  %}


| 名称           | 说明                                                         |
| -------------- | ------------------------------------------------------------ |
| Footer         | 指出 IndexBlock 和 MetaIndexBlock 在文件中的偏移量信息，它是元信息的元信息，它位于 sstable 文件的尾部 |
| IndexBlock     | 记录了 DataBlock 相关的元信息                                |
| MetaIndexBlock | 各个元信息的Block，包括Filter、Properties(整个table的属性信息)、Compression dictionary、Range deletion tombstone |
| MetaBlock      | 存储布隆过滤器的二进制数据 及其他元信息数据                  |
| DataBlock      | 存储实际的数据即键值对内容                                   |


### 索引块 Index Block [3]
索引块用于查找包含指定key的数据块。是一种基于**二分搜索**的数据结构。一个文件可能包含一个索引块，也可能包含一组分区索引块，这取决于使用配置。即存在全局索引与分区索引两种索引方式。



### SSTable的数据检索过程 [6]

{% asset_img querySST.jpg %}

# 参考

1. [A Tutorial of RocksDB SST formats](https://github.com/facebook/rocksdb/wiki/A-Tutorial-of-RocksDB-SST-formats)
2. [Rocksdb BlockBasedTable Format](https://github.com/facebook/rocksdb/wiki/Rocksdb-BlockBasedTable-Format)
3. [RocksDB基本架构与原理介绍](https://www.yii666.com/blog/334918.html)
4. [leveldb  sstable](https://leveldb-handbook.readthedocs.io/zh/latest/sstable.html) ***  未
5. [RocksDB block-based SST 文件详解](https://www.jianshu.com/p/d6ce3593a69e) *** 
6. [浅析RocksDB的SSTable格式](https://zhuanlan.zhihu.com/p/37633790)
