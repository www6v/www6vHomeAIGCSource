---
title: Rocksdb
date: 2022-01-29 22:48:17
tags:
  - Rocksdb
categories: 
  - 数据库
  - 非关系型  
  - Rocksdb
---


<p></p>
<!-- more -->


## B+树 vs LSM-tree
+ B+树
  - 读多写少的场景
+ LSM-tree
  - 写多读少的场景
  - 不是一种数据结构，是一种数据的组织方式
     - 内存中"就地写"
       到达阈值进行flush, 生成新的数据块, 不阻塞磁盘压缩合并
     - 磁盘中"追加写"
       内存顺序io >> 内存随机io == 磁盘顺序io >> 磁盘随机io
     - 数据块的存储方式
        - 拆分, 有序的快存储
        - 磁盘压缩合并    

## rocksdb[2][3]
+ 分治
  - 按冷热数据分层
  - 多路归并
+ level
  - 重复
    level0 单个sstable有序不重复
    level1-leveln 每一层中没有数据重复，层与层之间有冗余数据
    在所有层中，单个sstable有序不重复
  - 有序
    level1-leveln   sstable之间有序(range)
  - 90% 的数据存储在最后一层, 空间放大不超过 1.11（L0 层的数据较少，可以忽略不计）
+ 内存数据结构
   - O
     - 红黑树， 跳表 O(logn)
     - b+/b O(m * logn) 
   - 并发读写 互斥性[to do]
     - 红黑树(不推荐)
       重新着色，旋转的方式
     - 跳表 多层级有序链表(推荐) 
       插入: 先随机层数 在建立节点间关系
       加锁： 高度 + 节点

## rocksdb 写/读流程 
+ 写流程
+ 读流程

## rocksdb可改进点 
+ 写放大 
+ 读放大


## 参考
1. [看图了解RocksDB](https://developer.aliyun.com/article/669316) 未
2. [RocksDB 是什么？解决了什么问题？是怎么解决的？解决了哪些具体问题？](https://www.bilibili.com/video/BV1Jr4y1W7Wn?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036)
3. [RocksDB 简介](https://docs.pingcap.com/zh/tidb/dev/rocksdb-overview)