---
title: TiDB  故障排查
date: 2021-06-05 09:20:17
tags:
  - 故障排查  
categories:
  - 稳定性
  - 故障排查 
  - TiDB  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 读热点导致 SQL 延迟增加 [1-案例4]

### 看监控
某个数据量 600G 左右、读多写少的 TiDB 集群，某段时间发现 TiDB 监控的** Query Summary - Duration 指标显著增加**，p99 如下图。 [延迟增加]

**发现 Coprocessor CPU 线程池几乎打满。**

### 慢查询日志分析
  分析慢日志解析出来的 TopSQL 发现 Process keys 和 Process time 并**不是线性相关**.
  下面 SQL 的 Process keys 为** 12.68M**，但是 Process time 高达 **142353s**。
  过滤 Process time 较多的 SQL，发现 3 个典型的** slow query**，分析具体的执行计划。
  **分析执行计划未发现异常**，查看相关表的统计信息也都没有过期，继续分析 TiDB 和 TiKV 日志。

### 常规日志分析
  这些 region 的访问次数远远高于其它 region，之后定位这些 region 所属的表名。首先查看 [slow-query] 所在行记录的 table_id 和 start_ts，然后查询 TiDB 日志获取表名，比如 table_id 为 1318，start_ts 为 411837294180565013，使用如下命令过滤，**发现是上述慢查询 SQL 涉及的表。**

### 解决
**对这些 region 做 split 操作**，以 region 66625 为例，命令如下（需要将 x.x.x.x 替换为实际的 pd 地址）。
```
pd-ctl –u http://x.x.x.x:2379 operator add split-region 66625
```

# 参考
1. [TiDB 查询优化及调优系列（五）调优案例实践](https://cn.pingcap.com/blog/tidb-query-optimization-and-tuning-5)
+ **案例1: Delete 涉及数据量过大导致 OOM**
+ 案例2 执行计划不稳定导致查询延迟增加
+ 案例3 查询字段与值的数据类型不匹配
+ **案例4 读热点导致 SQL 延迟增加**
+ 案例5 SQL 执行计划不准

