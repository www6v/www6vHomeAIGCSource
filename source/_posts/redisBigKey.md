---
title: Redis 大Key
date: 2021-05-21 07:33:33
tags:
  - Redis
categories:
  - 数据库  
  - KV
  - Redis 
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

## Redis 大Key
### 问题 [1]
大key在数据迁移、扩容、删除时会有卡顿。   

### 解决方案 [1]
+ 用scan扫描大key  [1]

+ --bigkeys参数  [1]
``` Shell
$ redis-cli --bigkeys
# Scanning the entire keyspace to find biggest keys as well as
# average sizes per key type.  You can use -i 0.1 to sleep 0.1 sec
# per 100 SCAN commands (not usually needed).
[00.00%] Biggest zset   found so far 'testzset' with 129 members
[00.00%] Biggest hash   found so far 'h2' with 513 fields
[00.00%] Biggest set    found so far 'si1' with 5 members
[00.00%] Biggest hash   found so far 'h4' with 514 fields
[00.00%] Biggest string found so far 'key' with 9 bytes
-------- summary -------
Sampled 9 keys in the keyspace!
Total key length in bytes is 27 (avg len 3.00)
Biggest string found 'key' has 9 bytes
Biggest    set found 'si1' has 5 members
Biggest   hash found 'h4' has 514 fields
Biggest   zset found 'testzset' has 129 members
1 strings with 9 bytes (11.11% of keys, avg size 9.00)
0 lists with 0 items (00.00% of keys, avg size 0.00)
2 sets with 8 members (22.22% of keys, avg size 4.00)
4 hashs with 1541 fields (44.44% of keys, avg size 385.25)
2 zsets with 132 members (22.22% of keys, avg size 66.00)
0 streams with 0 entries (00.00% of keys, avg size 0.00)
```

+ 离线分析RDB

## 参考
1. 《Redis 深度历险：核心原理与应用实践》 7. 大海捞针 ——— scan  钱文品
2. [Redis中查找大key](https://segmentfault.com/a/1190000018193214?utm_source=tag-newest)