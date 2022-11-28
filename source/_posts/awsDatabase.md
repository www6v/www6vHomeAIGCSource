---
title: AWS Database
date: 2022-10-01 06:23:05
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->

## RDS

## Aurora [2]
+ Replicas  
  + Aurora Replicas are within a region
  + Replicas scale-out read requests
  + Can promote Aurora Replica to be a new primary or create new primary
  + Can use Auto Scaling to add replicas

+ Cross-Region Replica with Aurora MySQL
  + Asynchronous replication
    **Replication uses the MySQL database engine**

+ Global Database
  + **Replication uses the Aurora storage layer**
  + Applications can connect to the cluster Reader Endpoint [3]

+ Fault Tolerance
  + Fault tolerance across 3 AZs  

参考:
[在 Amazon Aurora Global Database 中使用全球分布式 MySQL 程序](https://zhuanlan.zhihu.com/p/159304158)
[使用 Amazon Aurora Global Database 进行快速的跨区域灾难恢复和低延迟全球读取](https://aws.amazon.com/cn/getting-started/hands-on/aurora-global-database/)

## 参考
1. [Amazon RDS Multi-AZ](https://aws.amazon.com/rds/features/multi-az/)
2. SAP-1  Database
3. [New Reader Endpoint for Amazon Aurora – Load Balancing & Higher Availability](https://aws.amazon.com/cn/blogs/aws/new-reader-endpoint-for-amazon-aurora-load-balancing-higher-availability/)