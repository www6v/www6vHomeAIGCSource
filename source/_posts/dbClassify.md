---
title: 数据库-分类与选型
date: 2019-10-27 22:30:59
tags:
  - 数据库
categories:
  - 数据库  
  - 分类
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 数据库分类
### 全景图 [1]

{% asset_img  'overviw.jpg'    结构化数据库分类  %}


### 数据库分类
  - NoSQL
  	+ Key-Value 键值对
  		Redis
  	+ Ordered Key-Value 有序键值对
  		HBase
  	+ Document databases 文档模型
  		MongoDB
  	+ Graph data models 图式数据库
  		Neo4J
  - NewSQL 
    + Google Spanner
    + TiDB
    + OceanBase
    + CockroachDB
    + Vitess
  - RMDB
  	+ MySQL

{% asset_img  'classify.JPG' %}

# 选型 [3]
### 关注点
{% asset_img  'xuqiu.JPG' %}

### 关系型数据库选型
{% asset_img  'rmdb.JPG' %}

### NoSQL数据库选型
{% asset_img  'nosql.JPG' %}


# 参考
1. [5分钟理解数据库全景图(SQL,NoSQL,NewSQL,OLAP,OLTP)](https://blog.csdn.net/icycode/article/details/81008607) icycode
2. {% post_link  'NoSQL'  %}  self
3. 《爱奇艺实用数据库选型树：不同场景如何快速选择
数据库？》 数据库架构选型指南 pdf



