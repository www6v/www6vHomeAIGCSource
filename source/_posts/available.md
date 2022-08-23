---
title: 高可用 available
date: 2022-06-26 21:55:43
tags:
  - 高可用
categories: 
  - 架构 
  - 高可用
---

<p></p>
<!-- more -->


##  CAP
CP系统: hbase, zookeeper
AP系统: cassandra, eureka



## nPRT公式

##### 可以推导出风险期望的公式


##### 控制风险的4大因素（nPRT）

+ 减少风险数量，n
+ 降低风险变故障的概率（即：增加风险变故障的难度），P
+ 减小故障影响范围，R
+ 缩短故障影响时长，T


##### 高可用架构设计的7大核心原则

+ 少依赖原则：能不依赖的，尽可能不依赖，越少越好（n）
+ 弱依赖原则：一定要依赖的，尽可能弱依赖，越弱越好（P）
+ 分散原则：鸡蛋不要放一个篮子，分散风险（R）
+ 均衡原则：均匀分散风险，避免不均衡（R）
+ 隔离原则：控制风险不扩散，不放大（R）
+ 无单点原则：要有冗余或其他版本,做到有路可退（T）
+ 自我保护原则：少流血，牺牲一部分，保护另外一部分（P&R&T）

{%asset_img ha.png 高可用 %}

## 服务高可用 [2] [R]
+ 地域&错误感知自动 failover
  视 endpoint 健康度自动 failover 一定比例流量至其他可用区/地域，直至 endpoint 全部不健康时 100% 流量自动 failover 至其他可用区/地域。
+ 地域感知流量分发 distribute
eg. 上海一区和上海二区按照 80% 和 20% 的比例分发

## 数据高可用 [3] [P]
+ 数据复制
  - 主从复制
     - 同步复制，异步复制
     - 复制日志的实现： 
        基于语句到复制， 
        基于wal的传输，
        基于行的逻辑日志复制
        eg. mysql， redis， hbase 
     - 复制滞后问题
  - 多主复制
  - 无主复制
+ 一致性和共识
  raft - etcd
  zab - zookeeper

## 可用性 7 级图表 [5]
当一个服务挂了的时候
+ 第一级：Crash with data corruption, destruction. 
+ 第二级：Crash with new data loss. 
+ 第三级：Crash without data loss. 
         数据高可用-冗余, destruction 测试
+ 第四级：No crash, but with no or very limited service, low service quality.  
         流控系统， eg. 秒杀流量漏斗
+ 第五级：Partial or limited service, with good to medium service quality. 
+ 第六级：Failover with significant user visible delay, near full quality of service  
         容灾，恢复慢
+ 第七级：Failover with minimal to none user visible delay, near full quality  
         异地容灾


## 系统中的高可用
[MySQL 同步复制及高可用方案总结](https://mp.weixin.qq.com/s/fh_9Mk-FVFSkX5pmsc8HPA)  MHA, MMM
[这可能是目前最全的Redis高可用技术解决方案总结](https://mp.weixin.qq.com/s/Iz7cwun1y_oLUV9fDDh0UQ)  Master-slave, Cluster
[面试|图解 kafka 的高可用机制](https://mp.weixin.qq.com/s/GMsYVgPmoCbdWW4FQthrAA)  isr
[干货 | 阿里巴巴HBase高可用8年抗战回忆录](https://mp.weixin.qq.com/s/yH5JVD422k6FNtiqAGw75Q)
etcd - raft
Redlock - redis分布式锁的高可用
[Kubernetes 之 master高可用集群搭建](https://mp.weixin.qq.com/s/Br6J3nC51SnRTXBArfs_ug)


## 参考
1. [高可用的本质](https://mp.weixin.qq.com/s/CkFHTuxqoj1WJ7d0HUEbAg)
2. [云原生应用负载均衡系列 (2): 入口流量分发、容错与高可用调度](https://mp.weixin.qq.com/s/0f9Z8yIsT7-iJ2AUHfgqiw)
3. <<数据密集型应用系统设计>>  5章, 9章
4. <<亿级流量 网站架构核心技术>>  1.4
5. [来自 Google 的高可用架构理念与实践](https://www.ktanx.com/blog/p/4273)