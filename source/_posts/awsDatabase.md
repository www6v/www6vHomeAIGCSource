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

## RDS[2]
+ database engines
  + Amazon Aurora
  + MySQL
  + MariaDB
  + Oracle
  + Microsoft SQL Server
  + PostgreSQ
+ Backup and Recovery
  + Automated Backups
  + Manual Backups (Snapshot)
+ RDS Replication
  + RPO = 10 minutes, RTO = 5 minutes
+ **Amazon RDS Multi-AZ and Read Replicas**

| **Multi-AZ Deployments**                                  | **Read Replicas**                                            |
| --------------------------------------------------------- | ------------------------------------------------------------ |
| Synchronous replication – highly durable                  | Asynchronous replication – highly scalable                   |
| Only database engine on primary instance is active        | All read replicas are accessible and can be used for read scaling |
| Automated backups are taken from standby                  | No backups configured by default                             |
| Always span two Availability Zones within a single Region | Can be within an Availability Zone, Cross-AZ, or Cross-Region |
| Database engine version upgrades happen on primary        | Database engine version upgrade is independent from source instance |
| Automatic failover to standby when a problem is detected  | Can be manually promoted to a standalone database instance   |

```
注：
RPO = Recovery Point Objective
RT0 - Recovery Time Objective
```



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

+ Multi-Master
  + All nodes allow reads/writes
  + Available for MySQL only
  + Up to four read/write nodes
  + Single Region only

参考:
[在 Amazon Aurora Global Database 中使用全球分布式 MySQL 程序](https://zhuanlan.zhihu.com/p/159304158)  未
[使用 Amazon Aurora Global Database 进行快速的跨区域灾难恢复和低延迟全球读取](https://aws.amazon.com/cn/getting-started/hands-on/aurora-global-database/) 未
[力从地起 - 揭秘 Aurora 底层存储 (Level 300)](https://www.bilibili.com/video/BV1P64y1M7fu/)  *** global database，snapshot



## 参考

1. [Amazon RDS Multi-AZ](https://aws.amazon.com/rds/features/multi-az/)
2. SAP-1  Database
3. [New Reader Endpoint for Amazon Aurora – Load Balancing & Higher Availability](https://aws.amazon.com/cn/blogs/aws/new-reader-endpoint-for-amazon-aurora-load-balancing-higher-availability/)