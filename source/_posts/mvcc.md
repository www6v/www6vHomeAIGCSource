---
title: MVCC
date: 2022-05-12 16:07:01
tags:
  - db
categories:
  - 数据库  
  - MVCC
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# MVCC

+ 四个关键模块设计
  - 并发控制协议 ***
    + Two-phase Locking (MV2PL)
    + MVOCC
    + Timestamp Ordering (MVTO)
  - 版本数据存储  ***
    + Append-only
    + Time-Travel
    + Delta
  - 垃圾清理机制
  - 索引管理

### 并发控制协议 [4]
{% asset_img  'mvccProtocol.jpg' %}

### 数据库中的MVCC

| DB           | Protocol  | Version Storage   | Garbage Collection |      | Index Management           |
| ------------ | --------- | ----------------- | ------------------ | ---- | -------------------------- |
| Oracle       | MV2PL     | Delta             | Tuple-level (VAC)  |      | Logical Pointers (TupleId) |
| Postgres     | MV2PL/SSI | Append-only (O2N) | Tuple-level (VAC)  |      | Physical Pointers          |
| MySQL-InnoDB | MV2PL     | Delta             | Tuple-level (VAC)  |      | Logical Pointers (PKey)    |


### MySQL中的MVCC [3]


# 参考
1. [Paper Reading：聊一聊MVCC](https://jiekun.dev/posts/mvcc/) ***

2. [1] Y. Wu, An Empirical Evaluation of In-Memory Multi-Version Concurrency Control. In VLDB 2017.

3. {% post_link 'mysqlTransactionAndLock' %} self 

   MySQL MVCC 快照都 vs 当前读 
4. [乐观锁和 MVCC 的区别？](https://www.zhihu.com/question/27876575) 

 
