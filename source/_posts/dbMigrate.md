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

## 迁移方式
+ 全量迁移
+ 全量 + 增量迁移

## 关注点
##### 迁移工具
工具名称    | 结构 | 全量 | 增量 | 数据校验 | 在线迁移
:-:|:-:|:-:|:-:|:-:|:-:
DTS        |   P |  P   | P    | P      | P 
redis-shake|  无 |  P   | P    | O      | P
mongo-shake|  无 |  P   | P    | O      | P


#####  数据库对象映射
  + 数据库类型映射
  + 库表列映射 

#####  数据库迁移场景
+ 迁移拓扑
  1:1， 1:n， n:1, n:m
+ 同构迁移
  MySQL -> MySQL
+ 异构迁移
  Oracle -> MySQL


#####  迁移时间

#####  业务可以接受的停机时间
+ 理想停机时间是 0
+ 借助增量日志来实现


#####  迁移策略
+ 流量切换策略
  逐渐切流量
  一次性切流量
+ 先迁同构，再迁异构
+ 迁移顺序
  先迁移表对象结构
  再迁移全量数据
  再迁移增量数据
  最后迁移触发器等对象数据

##### 迁移场景
+ 无依赖关系
一对一迁移( 1:1)
一对多高耦合业务迁移( 1:n )
多对一异构迁移( n:1 )

+ 有依赖关系  
[多表存在因果联系更新下的数据库迁移](https://zhuanlan.zhihu.com/p/68377907) 


## SQLServer迁移MySQL

{% asset_img  dbMigrate.png  SQLServer迁移MySQL-双写方案 %}

## 参考
1. <<云数据库架构>> 第四章
2. SQL Server 迁移到 MySQL 
从 SQL Server 到 MySQL（一）：异构数据库迁移   停机迁移
从 SQL Server 到 MySQL（二）：在线迁移，空中换发动机
从 SQL Server 到 MySQL（三）：愚公移山 - 开源力量
https://github.com/alswl/yugong





  


