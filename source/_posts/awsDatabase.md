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

+ Fault Tolerance
  + Fault tolerance across 3 AZs  

## 参考
1. [Amazon RDS Multi-AZ](https://aws.amazon.com/rds/features/multi-az/)
2. SAP-1  Database