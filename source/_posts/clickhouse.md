---
title: Clickhouse
date: 2022-09-07 13:57:02
tags:
  - Clickhouse
categories: 
  - 大数据 
  - 存储
  - Clickhouse
---

<p></p>
<!-- more -->


# 数据库引擎
默认情况下，ClickHouse使用**Atomic**数据库引擎

- [MySQL](https://clickhouse.com/docs/zh/engines/database-engines/mysql)
- [MaterializeMySQL](https://clickhouse.com/docs/zh/engines/database-engines/materialized-mysql)
- [Lazy](https://clickhouse.com/docs/zh/engines/database-engines/lazy)
- [Atomic](https://clickhouse.com/docs/zh/engines/database-engines/atomic)
- [PostgreSQL](https://clickhouse.com/docs/zh/engines/database-engines/postgresql)
- [MaterializedPostgreSQL](https://clickhouse.com/docs/zh/engines/database-engines/materialized-postgresql)
- [Replicated](https://clickhouse.com/docs/zh/engines/database-engines/replicated)
- [SQLite](https://clickhouse.com/docs/zh/engines/database-engines/sqlite)



# 表引擎

## MergeTree

- [MergeTree](https://clickhouse.com/docs/zh/engines/table-engines/mergetree-family/mergetree#mergetree)
- [ReplacingMergeTree](https://clickhouse.com/docs/zh/engines/table-engines/mergetree-family/replacingmergetree#replacingmergetree)
- [SummingMergeTree](https://clickhouse.com/docs/zh/engines/table-engines/mergetree-family/summingmergetree#summingmergetree)
- [AggregatingMergeTree](https://clickhouse.com/docs/zh/engines/table-engines/mergetree-family/aggregatingmergetree#aggregatingmergetree)
- [CollapsingMergeTree](https://clickhouse.com/docs/zh/engines/table-engines/mergetree-family/collapsingmergetree#table_engine-collapsingmergetree)
- [VersionedCollapsingMergeTree](https://clickhouse.com/docs/zh/engines/table-engines/mergetree-family/versionedcollapsingmergetree#versionedcollapsingmergetree)
- [GraphiteMergeTree](https://clickhouse.com/docs/zh/engines/table-engines/mergetree-family/graphitemergetree#graphitemergetree)





## 日志

- [TinyLog](https://clickhouse.com/docs/zh/engines/table-engines/log-family/tinylog#tinylog)
- [StripeLog](https://clickhouse.com/docs/zh/engines/table-engines/log-family/stripelog#stripelog)
- [Log](https://clickhouse.com/docs/zh/engines/table-engines/log-family/log#log)



## 集成引擎

- [Kafka](https://clickhouse.com/docs/zh/engines/table-engines/integrations/kafka#kafka)
- [MySQL](https://clickhouse.com/docs/zh/engines/table-engines/integrations/mysql#mysql)
- [ODBC](https://clickhouse.com/docs/zh/engines/table-engines/integrations/odbc#table-engine-odbc)
- [JDBC](https://clickhouse.com/docs/zh/engines/table-engines/integrations/jdbc#table-engine-jdbc)
- [HDFS](https://clickhouse.com/docs/zh/engines/table-engines/integrations/hdfs#hdfs)



## 用于其他特定功能的引擎

- [Distributed](https://clickhouse.com/docs/zh/engines/table-engines/special/distributed#distributed)

- [MaterializedView](https://clickhouse.com/docs/zh/engines/table-engines/special/materializedview#materializedview)

  
# 主键索引 [3]

# 稀疏索引 [4]


# 参考

1. [数据库引擎](https://clickhouse.com/docs/zh/engines/database-engines)
2. [表引擎](https://clickhouse.com/docs/zh/engines/table-engines)
3. [ClickHouse主键索引最佳实践](https://clickhouse.com/docs/zh/guides/best-practices)
4. [深入理解ClickHouse跳数索引](https://clickhouse.com/docs/zh/guides/improving-query-performance/skipping-indexes)

100. [ClickHouse 深度解析第二篇](https://blog.csdn.net/wmq880204/article/details/124224992)
101. [ClickHouse深度揭秘](https://zhuanlan.zhihu.com/p/98135840)