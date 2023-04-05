---
title: RocksDB- LSM-Tree
date: 2022-04-05 17:11:06
tags:
  - RocksDB
categories: 
  - 数据库
  - 非关系型  
  - RocksDB
---

<p></p>
<!-- more -->



# 2.2 RocksDB Architecture and Its Use of LSM-trees

---

 **the write process in RocksDB** 

Data is written to an in-memory write buffer called MemTable and a non-disk Write Ahead Log (WAL). Once the MemTable reaches a configured size, its contents are flushed to a Sorted String Table (SSTable) data file on disk. Each SSTable is immutable and stores data in sorted order, with an index block for binary search.

 RocksDB 中的写入过程

数据被写入到一个内存写缓冲区 MemTable 和一个非磁盘写前日志 (WAL) 中。一旦 MemTable 达到配置的大小，它的内容就会被刷新到磁盘上的一个排序字符串表 (SSTable) 数据文件中。每个 SSTable 都是不可变的，并且按排序方式存储数据，具有用于二进制搜索的索引块。

---



This document describes the compaction process in Rocksdb, which involves merging SSTables from different levels to optimize for read performance and space efficiency. The process gradually migrates written data from Level-0 to the last level, and is efficient due to parallelization and bulk reads and writes of entire files.

本文介绍了Rocksdb中的压缩流程，该流程涉及将来自不同级别的SSTables合并以优化读取性能和空间效率。该流程逐渐将写入的数据从Level-0迁移到最后一级，并且由于整个文件的并行化读写和批量读写而变得高效。



---

MemTables 和 level-0 SSTables 具有重叠的键范围，因为它们包含键空间中的任何键。每个较旧的级别，即 level-1 或更旧的级别，由覆盖键空间的非重叠分区的 SSTables 组成。为了节省磁盘空间，较旧级别中的 SSTables 块可以选择进行压缩。



---

**the read path in Rocksdb**

The read path involves searching MemTables and SSTables in successively older levels until the key is found or determined to be absent. Binary search is used in each case, and Bloom filters are used to reduce unnecessary searches. Hot SSTable blocks are cached in a memory-based block cache to reduce I/O and decompression overheads.

Rocksdb 中的读取路径

读取路径涉及到在不断递减的级别中搜索 MemTables 和 SSTables，直到找到键或确定其不存在为止。每次都使用二进制搜索，并使用 Bloom 过滤器来减少不必要的搜索。热门 SSTable 块被缓存在基于内存的块缓存中，以减少 I/O 和解压缩开销。



---

This document describes the different types of compaction supported by RocksDB, including Leveled Compaction, Tiered Compaction, and FIFO Compaction. 

Leveled Compaction assigns exponentially increasing size targets to levels, while Tiered Compaction lazily compacts multiple SSTables together. FIFO Compaction discards old SSTables and is designed for in-memory caching applications.

本文介绍了RocksDB支持的不同类型的压缩，包括**分层压缩、分层压缩和FIFO压缩**。

分层压缩将指数增长的大小目标分配给层级，而分层压缩则将多个SSTable懒惰地压缩在一起。FIFO压缩会丢弃旧的SSTable，适用于内存缓存应用程序。

## RocksDB的多种压缩类型

- Leveled Compaction
  - LevelDB的改进版
  - 指数增加大小目标
  - 预防性压缩
- Tiered Compaction (RocksDB中称为Universal Compaction)
  - 与Apache Cassandra或HBase相似
  - 延迟压缩
  - 在非零级别的SSTables数量和级别0文件的总和超过可配置的阈值时，或者总DB大小与最大级别大小的比率超过阈值时进行压缩
- FIFO Compaction
  - 只执行轻量级压缩
  - 在达到大小限制时丢弃旧的SSTables
  - 适用于内存缓存应用



---

This document discusses the benefits of configuring the type of compaction in RocksDB, which can be adjusted to be **read-friendly, write-friendly, or very write-friendly** depending on the use case. 

However, there are tradeoffs to consider, such as write amplification and read performance. Different services require different setups, with logging or stream processing benefiting from a write-heavy approach and database services requiring a balanced approach.

本文讨论了在RocksDB中配置紧缩类型的好处，这可以根据用例调整为读取友好、写入友好或非常写入友好。

然而，需要考虑权衡，例如写入放大和读取性能。不同的服务需要不同的设置，日志记录或流处理受益于写入重型方法，而数据库服务需要平衡方法。

| Compaction | Write Amplification | Space Overhead |
| ---------- | ------------------- | -------------- |
| Leveled    | 大                  | 小             |
| Tiered     | 小                  | 大             |
| FIFO       | 小                  | N/A            |



---

 the benefits of using **column families** in Rocksdb 

Column families allow different independent key spaces to co-exist in one DB, and each column family can be configured independently with different compaction, compression, and merge operators. The shared write-ahead log enables atomic writes to different column families, and existing column families can be removed and new ones created dynamically and efficiently. Column families are widely used to allow different compaction strategies for different classes of data in the same database and to remove obsolete data efficiently.

在Rocksdb中使用**列族**的好处

列族允许不同的独立键空间在一个DB中共存，每个列族都可以配置不同的压缩、合并和压实操作。共享的预写日志使得可以对不同的列族进行原子写操作，并且可以动态高效地删除现有的列族并创建新的列族。列族广泛用于允许在同一数据库中为不同类型的数据使用不同的压实策略，并高效地删除过时的数据。





{% details 点击  原文  %}

Writes. Whenever data is written to RocksDB, the written data is added to an in-memory write buffer called MemTable,aswellasanon-diskWrite Ahead Log (WA L ). MemTable is implemented as a skiplist to keep the data ordered with O (log n) insert and search overheads. The WAL is used for recovery after a failure, but is not mandatory. Once the size of the MemTable reaches a configured size, then (i) the MemTable and WAL become immutable, (ii) a new MemTable and WAL are allocated for subsequent writes, (iii) the contents of the MemTable are flushed to a Sorted String Table (SSTable) data file on disk, and (iv) the flushed MemTable and associated WAL are discarded. Each SSTable stores data in sorted order, divided into uniformly sized blocks. Once written, each SSTable is immutable. Every SSTable also has an index block with one index entry per SSTable block for binary search.



Compaction. The LSM-tree has multiple levels, as shown in Figure 1. The newest SSTables are created by MemTable flushes, as described above, and are placed in Level-0. The other levels are created by a process called compaction. The maximum size of each level is limited by configuration parameters. When level-L’s size target is exceeded, some SSTables in level-L are selected and merged with the overlapping SSTables in level-(L+1) to create a new SSTable in level-(L+1). In doing so, deleted and overwritten data is removed, and the new SSTable is optimized for read performance and space efficiency. This process gradually migrates written data from Level-0 to the last level. Compaction I/O is efficient, as it can be parallelized and only involves bulk reads and writes of entire files. (To avoid confusion with the terms “higher” and “lower,” given that levels with a higher number are generally located lower in images depicting multiple levels, we will refer to levels with a higher number as older levels.)



MemTables and level-0 SSTables have overlapping key ranges, since they contain keys anywhere in the keyspace. Each older level, i.e., a level-1 or older level, consists of SSTables covering nonoverlapping partitions of the keyspace. To save disk space, the blocks of SSTables in older levels may optionally be compressed.



Reads. In the read path, a key lookup occurs by first searching all MemTables, followed by searching all Level-0 SSTables, followed by the SSTables in successively older levels whose partition covers the lookup key. Binary search is used in each case. The search continues until the key is found, or it is determined that the key is not present in the oldest level.1 Hot SSTable blocks are cached in a memory-based block cache to reduce I/O as well as decompression overheads. Bloom filters are used to eliminate most unnecessary searches within SSTables.



RocksDB supports multiple different types of compaction [23]. Leveled Compaction was adapted from LevelDB and then improved [19]. In this compaction style, levels are assigned exponentially increasing size targets as exemplified by the dashed boxes in Figure 1. Compactions are initiated proactively to ensure the target sizes are not exceeded. Tiered Compaction (called Universal Compaction in RocksDB [26]) is similar to what is used by Apache Cassandra or HBase [36, 37, 58]. Multiple SSTables are lazily compacted together, either when the sum of the number of level-0 files and the number of non-zero levels exceeds a configurable threshold or when the ratio between total DB size over the size of the largest level exceeds a threshold. In effect, compactions are delayed until either read performance or space efficiency degenerates, so more data can be compacted altogether. Finally, FIFO Compaction simply discards old SSTables once the DB hits a size limit and only performs lightweight compactions. It targets in-memory caching applications.



Being able to configure the type of compaction allows RocksDB to serve a wide range of use cases. By using different compaction styles, RocksDB can be configured as read-friendly, write-friendly, or very write-friendly (for special cache workloads). However, application owners will need to consider tradeoffs among the different metrics for their specific use case[4]. A lazier compaction algorithm improves write amplification and write throughput, but read performance suffers. In contrast, a more aggressive compaction sacrifices write amplification but allows for faster reads. Services such as logging or stream processing can use a write-heavy setup, while database services need a balanced approach. Table 3 depicts this flexibility by way of micro-benchmark results.





In 2014, we added a feature called column family2 [22], which allows different independent key spaces to co-exist in one DB. Each KV pair is associated with exactly one column family (by default the default column family), while different column families can contain KV pairs with the same key. Each column family has its own set of MemTables and SSTables, but they share the WAL. Benefits of column families include the following:

(1) each column family can be configured independently; that is, they each can have different compaction, compression, merge operators (Section 6.2), and compaction filters (Section 6.2);

(2) the shared WAL enables atomic writes to different column families3;and

(3) existing column families can be removed, and new column families can be created, dynamically and efficiently.

Column families are widely used. One way they are used is to allow different compaction strategies for different classes of data in the same database; e.g., in a database, some data ranges might be write-heavy and other ranges might be read-heavy, in which case compaction can be made more effective overall by placing the two different classes of data into two different column families configured to use different compaction strategies. Another way column families are used is to exploit the fact that a column family can be removed efficiently: If the data known to become obsolete4 within a time period is placed in the same column family, then a column family can be removed at the appropriate time without having to explicitly delete the KV pairs contained therein.

{% enddetails   %}



# 参考
RocksDB: Evolution of Development Priorities in a Key-value Store Serving Large-scale Applications   2.2











