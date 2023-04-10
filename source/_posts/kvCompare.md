---
title: KV  存储比较
date: 2022-04-11 05:35:38
tags:
  - KV
categories: 
  - 数据库
  - KV
  - 总结
---


<p></p>
<!-- more -->

## Boltdb vs.  Rocksdb[N AI]


| 特征 | Boltdb | Rocksdb |
| --- | --- | --- |
| 内存管理 | Mmap | Mmap+预读取 |
| 索引结构 | B+树 | LSM树 |
| 读写性能 | 读性能好，写性能差 | 读写性能均衡 |
| 数据安全 | 具有ACID特性 | 具有ACID特性 |
| 备份和恢复 | 支持快照备份和恢复 | 支持增量备份和恢复 |
| 扩展性 | 不支持集群扩展 | 支持集群扩展 |



