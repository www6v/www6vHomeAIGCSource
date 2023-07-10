---
title: Redis 主从复制
date: 2022-07-10 19:04:46
tags:
  - KV
categories:
  - 数据库
  - KV
  - Redis
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 主从复制流程
###  主从库第一次同步的流程
 {% asset_img  'r1.jpg' %}   


### 主从库增量复制流程
{% asset_img  'r2.jpg' %}                          


repl_backlog_buffer 是一个环形缓冲区，**主库会记录自己写到的位置，从库则会记录自己 已经读到的位置**。

# 主从延迟
- 复制偏移量：master_repl_offset | slave_repl_offset

# 参考
1. 《06 | 数据同步：主从库如何实现数据一致？》
2. [**redis主从复制、主从延迟知几何**](https://www.cnblogs.com/niejunlei/p/12904984.html)
