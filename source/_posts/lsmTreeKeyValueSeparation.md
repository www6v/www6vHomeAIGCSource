---
title: LSM-Tree  KV分离
date: 2022-06-05 15:39:47
tags:
  - LSM-Tree
categories: 
  - 数据库
  - 基础  
---

<p></p>
<!-- more -->

## KV分离[3]
+ Wisckey 

## 工业界的实现[2]
| 存储引擎  | BadgerDB          | TerarkDB            | Titan              |
| --------- | ----------------- | ------------------- | ------------------ |
| Scan 性能 | 差，需要 prefetch | 好                  | 好                 |
| 点读 key  | 需要访问所有层    | 遇到第一个即可停止  | 遇到第一个即可停止 |
| 读 value  | offset 直接读取   | 需要访问 v-SST 索引 | offset 直接读取    |
| MVCC      | 支持              | 内部 Sequence No.   | 内部 Sequence No.  |



## 参考

1. bili 
2. [LSM 存储引擎中 KV 分离的实现](https://www.skyzh.dev/posts/articles/2021-08-07-lsm-kv-separation-overview/)  *** 
3. [LSM-Tree:从入门到放弃——放弃：LSM Tree的Compaction机制探讨和分析](https://zhuanlan.zhihu.com/p/428270334)   Overview
4. [论文翻译 WiscKey: Separating Keys from Values in SSD-Conscious Storage](https://zhuanlan.zhihu.com/p/423565251)  中文翻译

