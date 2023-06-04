---
title: LSM-Tree  KV分离
date: 2022-06-05 15:39:47
tags:
  - LSM-Tree
categories: 
  - 数据库
  - 存储引擎 
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 前提
常见的 LSM 存储引擎，如 LevelDB 和 RocksDB，将用户写入的一组的 key 和 value 存放在一起，按顺序写入 SST。在 compaction 过程中，引擎将上层的 SST 与下层 SST 合并，产生新的 SST 文件。这一过程中，SST 里面的 key 和 value 都会被重写一遍，带来较大的写放大。**如果 value 的大小远大于 key，compaction 过程带来的写放大会引入巨大的开销。**


# KV分离[3]
+ Wisckey 


# 业界实现-Titan[2]
### 写流程
{% asset_img  'write-titan.png' %}

### 读流程
{% asset_img  'get-titan.png'   %}


# 参考
1. bili 
2. [LSM 存储引擎中 KV 分离的实现](https://www.skyzh.dev/posts/articles/2021-08-07-lsm-kv-separation-overview/)  *** 
3. [LSM-Tree:从入门到放弃——放弃：LSM Tree的Compaction机制探讨和分析](https://zhuanlan.zhihu.com/p/428270334)   Overview
4. [论文翻译 WiscKey: Separating Keys from Values in SSD-Conscious Storage](https://zhuanlan.zhihu.com/p/423565251)  中文翻译

