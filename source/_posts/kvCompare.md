---
title: KV  存储引擎比较[Boltdb Rocksdb]
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
| 内存管理 | MMap | MMap+预读取 |
| 索引结构 | **B+树**[2] | **LSM树**[3] |
| 读写性能<br>读写场景[1] | 读性能好，写性能差<br/>**适合‘读多写少’** | 读写性能均衡<br/>**适合‘写多读少’** |
| 数据安全<br>事务 | 具有ACID特性<br>支持事务[1] | 具有ACID特性<br>支持事务 |
| 备份和恢复 | 支持快照备份和恢复 | 支持增量备份和恢复 |
| 扩展性 | 不支持集群扩展 | 支持集群扩展 |




## 参考
1.《云原生分布式存储基石-etcd深入理解》 
2. {%  post_link 'kvBoltDB' %}  self
2. {%  post_link 'rocksdbLsm' %}  self 
