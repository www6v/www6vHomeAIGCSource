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

# Redis 大Key
### 问题 

问题1 [1] 
+ 大key在数据迁移[遇到过]、扩容、删除[遇到过]时会有卡顿。 

问题2 [3]
+ 执行大key命令的客户端本身，耗时明显增加，甚至超时
+ 执行大key相关读取或者删除操作时，会严重占用带宽和CPU，影响其他客户端
+ 大key本身的存储带来分布式系统中分片数据不平衡，CPU使用率也不平衡
+ 大key有时候也是热key，读取操作频繁，影响面会很大
+ 执行大key删除时，在低版本redis中可能阻塞线程   [遇到过]

###  查找 大Key
+ 用scan扫描大key  [1]

+ --bigkeys参数  [1][2]
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
    
+ 离线分析RDB [3]
  使用redis-rdb-tools离线分析工具来扫描RDB持久化文件

### 解决方案


# 参考
1. 《Redis 深度历险：核心原理与应用实践》 钱文品
    7. 大海捞针 ——— scan  

2. [Redis中查找大key](https://segmentfault.com/a/1190000018193214?utm_source=tag-newest)
3. [解决了Redis大key问题](https://zhuanlan.zhihu.com/p/473930220)  *** 
   [解决了Redis大key问题](https://mp.weixin.qq.com/s/0WS7_9EIQqpYlUNWgZZJog)