---
title: 网络、内存、存储总结
date: 2019-08-31 12:37:46
tags:
  - 总结
categories:
  - 总结  
top: true
---

<p></p>
<!-- more -->

## 一. 网络总结
###  Linux网络
+ iptables总结
+ TCP流控和拥塞控制
+ TCP总结
+ Socket总结


### 跨网段，vpc
+ Docker网络
+ Kubernetes开放接口   
+ IDC网络互通

### 应用层
+ Netty总结
+ Netty EpollEventLoop
+ Netty中NioEventLoop的accept过程
+ HTTPS总结


## 二. 网络总结
### Linux 
+ Linux内存管理    

### 应用层
+ Java内存模型
+ golang内存分配
[图解Go语言内存分配](https://mp.weixin.qq.com/s/7bTGxhl7RXBmw5bxaR7Cnw)
[图解 Go 内存分配器](https://www.infoq.cn/article/IEhRLwmmIM7-11RYaLHR)


## 三. 文件和存储
### Linux文件系统   

系统 | 组件 | 缓存
-|-|-
虚拟文件系统 |  dentry， inode(索引文件) | page cache
块设备 | dev | buffer

### 应用层

 总结 | 知识点   
 -|-
 NoSQL知识点     |  1. Key-Value 键值对 <br>2. “列族”（column families）数据库<br>3. 文档数据库<br> 4.图式数据库 
 文件IO总结      |  mmap，NIO(FileChannel)
 Redis总结       | AOF，RDB 
 Kafka总结       | Partition的Segment中的index文件，data文件 
 RocketMQ总结    | CommitLog， ComsumeQueue， 索引文件 