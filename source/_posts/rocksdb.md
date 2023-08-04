---
title: RocksDB 总结
date: 2022-01-29 22:48:17
tags:
  - RocksDB
categories: 
  - 数据库
  - KV  
  - RocksDB
---

<p></p>
<!-- more -->


## B+树 vs LSM-tree[2]
+ B+树
  - 读多写少的场景
  - 牺牲写, 提高读    
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

## RocksDB组件和架构[2][3]
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
+ 内存数据结构[2]
   - 时间复杂度
     - 红黑树， 跳表 O(logn)
     - b+/b O(m * logn) 
   - 并发读写 互斥性
     - 红黑树(不推荐)
       重新着色，旋转的方式
     - 跳表 多层级有序链表(推荐) 
       插入的流程: 先随机层数, 再建立节点间关系
       加锁的数据结构: 
       高度(atomic<int> max_heigh_) + 节点(atomic<Node> next_)      
       {% asset_img skip-list.png %}       
       {% asset_img mtable-optimized.png 写操作, 能指令重排 %}
       {% asset_img mtable-optimized1.png 写操作 %}
       原子操作
       max_heigh_.store(height, ... relax) 性能优化点: 能指令重排,不影响正确性.  增加了并发性能 
       max_heigh_.store(height, ... release)  不能指令重排
       max_heigh_.load()

## RocksDB 写/读流程 [5]
+ 写流程 
+ 读流程

## RocksDB可改进点[4] 
+ 写放大
  - 说明：RocksDB 支持多种 Compaction。下面分析的是 Level Style Compaction。
  - RocksDB 的写放大分析：
    +1 - redo log 的写入
    +1 - Immutable Memtable 写入到 L0 文件
    +2 - L0 和 L1 compaction（L0 SST 文件的 key 范围是重叠的，出于性能考虑，一般尽量保持 L0 和 L1 的数据大小是一样的，每次拿全量 L0 的数据和全量 L1 的数据进行 compaction）
    +11 - Ln-1 和 Ln 合并的写入（n >= 2，默认情况下，Ln 的数据大小是 Ln-1 的 10 倍，见 max_bytes_for_level_multiplier ）。
  - 所以，总的写放大是 4 + 11 * (n-1)  = 11 * n - 7 倍。关键是 n 的取值。

+ 读放大
LSM-Tree 的读操作需要从新到旧（从上到下）一层一层查找，直到找到想要的数据。这个过程可能需要不止一次 I/O。特别是 range query 的情况，影响很明显。

+ 空间放大（Space Amplification）
因为所有的写入都是顺序写（append-only）的，不是 in-place update ，所以过期数据不会马上被清理掉。

## RocksDB的应用
+ pika
  redis协议的rocksdb引擎
+ myrocks
  mysql innodb换成rocksdb
  - 磁盘利用率 
    eg. innodb 150G(空间放大严重: 叶子节点的分裂, 磁盘利用率低(50%左右)), rocksdb只需要50G，          
+ Tidb
  

## 参考
1. [看图了解RocksDB](https://developer.aliyun.com/article/669316) 未
2. [RocksDB 是什么？解决了什么问题？是怎么解决的？解决了哪些具体问题？](https://www.bilibili.com/video/BV1Jr4y1W7Wn?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036) bili  ***
3. [RocksDB 简介](https://docs.pingcap.com/zh/tidb/dev/rocksdb-overview)
4. [LSM-Tree 的写放大写放大、读放大、空间放大RockDB 写放大简单分析参考文档](https://cloud.tencent.com/developer/article/1352666?ivk_sa=1024320u)
5. {% post_link 'rocksdbLsm'  %} self
100. [字节跳动在 RocksDB 存储引擎上的改进实践](https://www.infoq.cn/article/u3leu3EmGJjWflQLtJHs) *** 未
101. [Rocksdb 调优指南](https://www.cnblogs.com/lygin/p/17158774.html) 像是翻译 未
102. [深入RocksDB原理](https://zhuanlan.zhihu.com/p/616209332) *** 未
103. [【读读论文】RocksDB 发展回顾及展望 ](https://gaomf.cn/2021/11/28/Paper_RocksDB_Developemnt/)  论文 未