---
title: 阿里云 数据库
date: 2022-07-13 13:51:05
tags:
  - 阿里云
categories:
  - 云计算 
  - 阿里云
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# Overview [1]
### 数据库 使用场景
{% asset_img  'changjing.JPG' %}

### 数据库之间的同步
{% asset_img  'db-sync.JPG' %}

# 阿里云 数据库 [1]
### MySQL
+ 类型
  + 单机版
  + 高可用版
  + 金融版

### PolarDB
+ 场景
  + 使用mysql的所有业务场景
  + 容量大
  + 业务弹性灵活

### Redis
{% asset_img  'redis.JPG' %}

### Hbase
{% asset_img  'hbase.JPG' %}

### HybridDB

### MongoDB

# MySQL容灾 [1]
### 场景: 复制
+ 异步复制
+ 半同步复制

###  场景: 两地N中心
DTS同步数据

###  场景: 双节点服务可用性(机房级)

###  场景: 双节点服务可用性(地域级)

# MySQL扩展[1]
### (添加)只读实例

### 读写分离
Proxy 层

### MySQL横向扩展
MySQL 用DTS迁移到  HybridDB


# 参考
1. [课时3: 云上数据库架构设计及解决方案](https://www.bilibili.com/video/BV1ky4y1a7Sk?p=3)

