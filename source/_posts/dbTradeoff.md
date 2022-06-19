---
title: 分布式数据库中一致性和可用性的权衡
date: 2019-10-27 22:09:36
tags:
  - 数据库
categories:
  - 数据库  
  - 总结
---

<p></p>
<!-- more -->

<div style="text-align: center;">
  
![trade-off](https://user-images.githubusercontent.com/5608425/67635359-14c13280-f901-11e9-93f2-50720186ad33.jpg)
基于一致性、可用性的系统分类
</div>

> I. nosql: BigTable，Hbase (CP + 无事务一致性)
  提供强一致性, 但不支持事务.
  BigTable能够做到服务级高可用性, 这主要得益于Chubby和GFS提供的高可用性保障.

> II. nosql: Dynamo, Cassandra （AP）
  较弱的操作一致性, 并且也不提供事务一致性保证. 以提升系统的可用性为第一要务

> III. newsql: Spanner, Tidb  （CP + 高事务一致性）
  既提供最强的操作一致性, 也提供最强的事务一致性, 与此同时, 还提供服务级高可用性.以事务一致性作为设计的首要目标.
  难以提供最高级别的可用性(即节点级高可用), 但可以利用共识机制达到较高级别的可用性——服务级高可用.

> Ⅳ. 基于主从复制技术的RMDB; NewSQL: VoltDB; (C + 事务)
  较强的操作一致性和事务一致性, 但在可用性上作了一定妥协, 只提供人工介入下的可用性.

> V.  Balis HAT


> 观点: 数据不可靠，但服务可以可靠。


## 参考：
1. [NoSQL总结](../../../../2018/07/19/NoSQL/) self
2. [结构化数据库分类](../../../..//2019/10/27/dbClassify/) self

### Paper
朱涛, 郭进伟, 周欢, 周烜, 周傲英. 分布式数据库中一致性与可用性的关系[J]. 软件学报, 2018, 29(1): 131-149.http://www.jos.org.cn/1000-9825/5433.htm
