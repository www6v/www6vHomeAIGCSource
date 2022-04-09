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
+ [iptables总结](../../../../2019/08/19/iptables/)
+ [TCP流控和拥塞控制](../../../../2019/08/07/tcpUdpControlCongestion/)
+ [TCP总结](../../../../2015/04/25/tcp/)
+ [Socket总结](../../../../2019/08/25/linux-socket/)


### 容器网络、VPC
+ [Docker网络](../../../../2019/08/04/docker-network/)
+ [Kubernetes开放接口](../../../../2019/08/11/k8sInterface/)   
+ [IDC网络互通](../../../../2019/05/15/netConnection/)

### 应用层
+ [Netty总结](../../../../2015/08/23/nettySummary/)
+ [Netty EpollEventLoop](../../../../2015/10/03/nettyEpollEventLoop/)
+ [Netty中NioEventLoop的accept过程](../../../../2015/09/06/nettyEventLoop-Accept/)
+ [HTTPS总结](../../../../2019/08/14/https/)


## 二. 内存总结
### Linux 
+ [Linux内存管理](../../../../2019/08/23/linuxMemory/)  
+ [Linux zero copy](../../../../2019/09/14/zeroCopy/)   

### 应用层
+ [Java内存模型](../../../../2014/01/03/memoryModel/)
+ golang内存分配
[图解Go语言内存分配](https://mp.weixin.qq.com/s/7bTGxhl7RXBmw5bxaR7Cnw)
[图解 Go 内存分配器](https://www.infoq.cn/article/IEhRLwmmIM7-11RYaLHR)


## 三. 文件和存储
###  [Linux文件系统](../../../../2019/08/24/linuxFile/)   

系统 | 组件 | 缓存
-|-|-
虚拟文件系统 |  dentry， inode(索引文件) | page cache
块设备 | dev | buffer

### 应用层

 总结 | 知识点   
 -|-
 [NoSQL总结](../../../../2018/07/19/NoSQL/)   |  1. Key-Value 键值对 <br>2. “列族”（column families）数据库<br>3. 文档数据库<br> 4.图式数据库 
 [文件IO总结](../../../../2017/04/23/fileIO/)    |  mmap，NIO(FileChannel)
 [Redis总结](../../../../2016/11/12/redis/)     | AOF，RDB 
 [Kafka总结](../../../../2016/05/11/kafka/)     | Partition的Segment中的index文件，data文件 
 [RocketMQ总结](../../../../2019/06/18/rocketmq/)   | CommitLog， ComsumeQueue， 索引文件 