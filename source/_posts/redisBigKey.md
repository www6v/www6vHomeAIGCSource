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

## Redis 大Key
### 问题 [1]
大key在数据迁移、扩容、删除时会有卡顿。   

### 解决方案 [1]
+ 用scan扫描大key
+ --bigkeys参数

[故障模型 - 热点 Key 问题的发现与解决](../../../../2018/10/27/fault/)  self

## 参考
1. 《Redis 深度历险：核心原理与应用实践》 7. 大海捞针 ——— scan  钱文品
    