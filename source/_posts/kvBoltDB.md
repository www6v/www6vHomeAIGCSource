---
title: BoltDB
date: 2022-04-12 10:12:59
tags:
  - KV
categories: 
  - 数据库
  - KV
  - BoltDB
---


<p></p>
<!-- more -->


## Boltdb 磁盘布局和索引结构[2]
{% asset_img   boltdb-index.JPG   %}

+ BoltDB 的磁盘布局
   - 元数据页
   - B+树索引节点页
   - B+树叶子节点页
   - 空闲页管理页和空闲页
   

BoltDB 通过 B+树来管理分支/叶子页，实现快速查找和写入 key-value 数据。



## 参考

2. 《10 | boltdb：如何持久化存储你的key-value数据？》  etcd实战课  唐聪

