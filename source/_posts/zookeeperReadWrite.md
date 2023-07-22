---
title: Zookeeper-读写流程
date: 2015-03-26 22:22:29
tags:
---







#  读/写流程

###  写
+ 写Leader
+ 写Follower/Observer
  将写请求转发给Leader处理

###  读
+ Leader/Follower/Observer都可直接处理读请求，从本地内存中读取数据并返回给客户端即可。



## 参考
1. [深入浅出Zookeeper（一） Zookeeper架构及FastLeaderElection机制 ](http://www.jasongj.com/zookeeper/fastleaderelection/) *** 
100. [ZooKeeper 核心通识](https://zhuanlan.zhihu.com/p/571732977) 未
