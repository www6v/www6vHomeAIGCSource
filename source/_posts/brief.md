---
title: 网络/内存/存储 汇总
date: 2019-08-31 12:37:46
tags:
  - 汇总
categories:
  - 汇总  
top: true
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

##  网络总结
#####  Linux网络
+ [iptables总结](../../../../2019/08/19/iptables/)
+ [TCP流控和拥塞控制](../../../../2019/08/07/tcpUdpControlCongestion/)
+ [TCP总结](../../../../2015/04/25/tcp/)
+ [Socket总结](../../../../2019/08/25/linux-socket/)


##### 容器网络、VPC
+ [Docker网络](../../../../2019/08/04/docker-network/)
+ [Kubernetes开放接口](../../../../2019/08/11/k8sInterface/)   
+ [IDC网络互通](../../../../2019/05/15/netConnection/)

##### 应用层
+ [Netty总结](../../../../2015/08/23/nettySummary/)
+ [Netty EpollEventLoop](../../../../2015/10/03/nettyEpollEventLoop/)
+ [Netty中NioEventLoop的accept过程](../../../../2015/09/06/nettyEventLoop-Accept/)
+ [HTTPS总结](../../../../2019/08/14/https/)


## 内存总结
##### Linux 
+ [Linux内存管理](../../../../2019/08/23/linuxMemory/)  
+ [Linux zero copy](../../../../2019/09/14/zeroCopy/)   （todo: kafka zero-copy）

##### 应用层
+ [Java内存模型](../../../../2014/01/03/memoryModel/)
+ golang内存分配
[图解Go语言内存分配](https://mp.weixin.qq.com/s/7bTGxhl7RXBmw5bxaR7Cnw)
[图解 Go 内存分配器](https://www.infoq.cn/article/IEhRLwmmIM7-11RYaLHR)
+ [[译] 编程语言中的 6 种内存模型（2016）](http://arthurchiao.art/blog/memory-models-underlie-programming-languages-zh/)
+ Redis[todo]

## 文件和存储
#####  [Linux文件系统](../../../../2019/08/24/linuxFile/)   

系统 | 组件 | 缓存
-|-|-
虚拟文件系统 |  dentry， inode(索引文件) | page cache
块设备 | dev | buffer

##### 应用层

 总结 | 知识点   
 -|-
 [Ceph](../../../../2022/01/08/ceph/)  |  Block, File, Object
 [文件IO总结](../../../../2017/04/23/fileIO/)    |  mmap，NIO(FileChannel)
 [Kafka总结](../../../../2016/05/11/kafka/)     | Partition的Segment中的index文件，data文件 
 [RocketMQ总结](../../../../2019/06/18/mqRocketmq/)   | CommitLog， ComsumeQueue， 索引文件(todo mmap优化) 