---
title: Split Brain
date: 2017-02-19 23:44:11
tags:
  - 一致性
  - 可用性
categories:
  - 分布式 
  - 一致性  
  - Split Brain   
---

**关键词**: 脑裂, fence, Quorums , epoch


**脑裂**： 类似 CAP中的P
**Partition tolerance(分区容错性)**: 网络分区发生时，一致性和可用性两难全

## 一. 通用解决方案
1. Quorums
2. Redundant communications，冗余通信的方式
3. Fencing


## 二. 系统
|现象| 解决方案
:-:|:-:|:-:
kafka|kafka脑裂现象:1. 存在多个controller <br> 2. consumer的splitBrain| controller使用epoch来避免脑裂
elastic search | | 配置discovery.zen.minimum_master_nodes，类似Quorums
zookeeper| 两个leader[3] | Quorums <br>leader单调递增的epoch
raft脑裂| 两个majority | [2] Quorums + term  

redis脑裂、mysql脑裂 

## 参考:
1. [redis 脑裂等极端情况分析](https://www.cnblogs.com/yjmyzz/p/redis-split-brain-analysis.html)
   > Redis Cluster is not able to guarantee strong consistency. / In general Redis + Sentinel as a whole are a an eventually consistent system
2. [raft协议](../../../../2019/06/21/raft/) self
3. [脑裂是什么？Zookeeper是如何解决的？](https://www.cnblogs.com/nicerblog/p/11232531.html)




	

	
	
	
