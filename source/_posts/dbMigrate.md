---
title: 数据库迁移
date: 2022-04-11 21:10:21
tags:
  - 云计算
categories:
  - 云计算  
  - 迁移
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 迁移方式
+ 全量迁移
+ 全量 + 增量迁移

# 关注点
### 迁移工具 [1]
工具名称    | 结构 | 全量 | 增量 | 数据校验 | 在线迁移
:-:|:-:|:-:|:-:|:-:|:-:
DTS        |   P |  P   | P    | P      | P 
redis-shake|  无 |  P   | P    | O      | P
mongo-shake|  无 |  P   | P    | O      | P


###  数据库对象映射
  + 数据库类型映射
  + 库表列映射 

###  数据库迁移场景 [1]
+ 迁移拓扑
  1:1， 1:n， n:1, n:m
+ 同构迁移
  MySQL -> MySQL
+ 异构迁移
  Oracle -> MySQL


###  迁移时间

###  业务可以接受的停机时间 [1]
+ 理想停机时间是 0
+ 借助增量日志来实现


###  迁移策略 [1]
+ 流量切换策略
  逐渐切流量
  一次性切流量
+ 先迁同构，再迁异构
+ 迁移顺序
  先迁移表对象结构
  再迁移全量数据
  再迁移增量数据
  最后迁移触发器等对象数据

### 迁移场景
+ 无依赖关系 [1]
一对一迁移( 1:1)
一对多高耦合业务迁移( 1:n )
多对一异构迁移( n:1 )

+ 有依赖关系  
[多表存在因果联系更新下的数据库迁移](https://zhuanlan.zhihu.com/p/68377907) 


# SQLServer迁移MySQL(双写方案)  [2]

{% asset_img  dbMigrate.png  SQLServer迁移MySQL-双写方案 %}



# ShardingSphere 数据迁移 [3]
###  准备阶段
  - 检查源端数据库所需的用户权限和数据库配置项是否开启,  比如MySQL需要打开binlog,  PG的wal_level >= logical 
  - 目标端建表 { and schema} 
  - 检查目标端表是否为空
  - 初始化**增量迁移**的Task, 不同的数据库具有不同的实现, MySQL是伪装成Slave, 进行数据同步
  - 初始化**全量迁移**的Task, 计算 每个Task 负责迁移的数据范围
[ 注意: 先初始化 增量,  再初始化全量]  

### 重复数据处理
+ 问题:  
    - **情况1  先增量，再全量，可能会有一定的重复数据**
    - 情况2
+ 解决办法:  类似于**幂等**消费MQ重复消息， 使用数据库提供的**insert or update**进行幂等插入
  ``` SQL 
  MySQL: insert into ... on duplicate key update 
  PG: insert into ... on conflict do update 
  ```
  
### 一致性校验 
前提条件: 当增量数据同步持续一段时间没有同步新数据 
1. 数据一致性校验之前, 可以停写源端库, 或者不停写 
如果**停写**, 那所有校验算法都可以全面校验所有数据的一致性 
如果**不停写**, 需要允许部分增量数据不校验。 支持增量数据变更的一致性校验还在规划中 


# 参考
1. <<云数据库架构>> 第四章
2. SQL Server 迁移到 MySQL 
从 SQL Server 到 MySQL（一）：异构数据库迁移   停机迁移
从 SQL Server 到 MySQL（二）：在线迁移，空中换发动机
从 SQL Server 到 MySQL（三）：愚公移山 - 开源力量
https://github.com/alswl/yugong
3. [ShardingSphere 数据迁移功能 & 实战-郭信泽](https://www.bilibili.com/video/BV1FW4y1n7R8/) V
4. [基于Apache ShardingSphere 改造单机数据库为分布式数据库实战](https://www.bilibili.com/video/BV13s4y1t74t/) V 未

100. [数据迁移的一致性探讨](https://zhuanlan.zhihu.com/p/455976887)  腾讯  未





