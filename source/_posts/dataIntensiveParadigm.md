---
title: 范式Paradigm-数据密集 
date: 2022-02-02 23:10:42
tags:
  - 范式
categories: 
  - 数据库
  - 范式  
---

<p></p>
<!-- more -->

## 流范式 Stream
##### 大数据流
Lamda架构

##### HTTP2 流， TCP-Stream

##### Pipeline 
CPU流水线


## 复制范式 Replication
##### 主从
MySQL
##### 多主
Git
##### 无主
Cassandra

##### Kafka ISR
原理上是主从，但是从延迟太大会被踢出ISR



| 弱一致性                       | 协议                                        | 特性                                | 工程                                    |
| ------------------------------ | ------------------------------------------- | ----------------------------------- | --------------------------------------- |
| Master-Slave<br/>(最终一致性)  |                                             | 延迟低，吞吐高<br>主动推送/被动拉取 | {% post_link 'mysqlReliability' %} self |
| Master-Master<br/>(最终一致性) | {% post_link 'multiMasterCRDT' CRDT %} self | 延迟低，吞吐高                      | {% post_link 'mysqlReliability' %} self |
| 弱一致性                       | Backups（备份）                             |                                     |                                         |




## 数据存储和处理
##### OLTP
MYSQL

##### OLAP
HADOOP

##### HATP（A，T）
TiDB， TiKV(行存)， Tiflash（列存）

