---
title: 分布式系统 模式
date: 2022-03-01 18:07:28
tags:
  - 分布式
categories: 
  - 分布式
  - 模式
---
<p></p>
<!-- more -->

### Fault Tolerant Consensus
| 英文                                                         | 中文                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Paxos](https://martinfowler.com/articles/patterns-of-distributed-systems/paxos.html) | [Paxos](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/paxos.md) |
| [Quorum](https://martinfowler.com/articles/patterns-of-distributed-systems/quorum.html) *** | [Quorum](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/quorum.md) |
| [Generation Clock](https://martinfowler.com/articles/patterns-of-distributed-systems/generation.html) *** | [世代时钟（Generation Clock）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/generation-clock.md) |



### Pattern Sequence for implementing replicated log

| 英文                                                         | 中文                                                         | Example & 扩展                                               |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Replicated Log](https://martinfowler.com/articles/patterns-of-distributed-systems/replicated-log.html) *** | [复制日志（Replicated Log）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/replicated-log.md) | Raft                                                         |
| [Write-Ahead Log](https://martinfowler.com/articles/patterns-of-distributed-systems/wal.html) *** | [预写日志（Write-Ahead Log）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/write-ahead-log.md) | MySQL redo log<br>HBase WAL<br>Redis aof                     |
| [Low-Water Mark](https://martinfowler.com/articles/patterns-of-distributed-systems/low-watermark.html) *** | [低水位标记（Low-Water Mark）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/low-water-mark.md) |                                                              |
| [High-Water Mark](https://martinfowler.com/articles/patterns-of-distributed-systems/high-watermark.html) *** | [高水位标记（High-Water Mark）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/high-water-mark.md) | kafka HW <br>{% post_link 'streamingFlinkWatermarkWindow' %} |
| [HeartBeat](https://martinfowler.com/articles/patterns-of-distributed-systems/heartbeat.html) *** | [心跳（HeartBeat）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/heartbeat.md) | {% post_link 'crashDetect' %}                                |
| [Leader and Followers](https://martinfowler.com/articles/patterns-of-distributed-systems/leader-follower.html) ***<br>leader election | [领导者和追随者（Leader and Followers）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/leader-and-followers.md) | {% post_link 'kafkaElection' %} <br> {% post_link 'raft' %} <br>{% post_link 'zookeeperZab' %}<br>es 选主[todo] |
| [Follower Reads](https://martinfowler.com/articles/patterns-of-distributed-systems/follower-reads.html) *** | [追随者读取（Follower Reads）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/follower-reads.md) |                                                              |
| [Segmented Log](https://martinfowler.com/articles/patterns-of-distributed-systems/log-segmentation.html) *** | [分段日志（Segmented Log）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/segmented-log.md) | Kafka segment                                                |
| [Request Pipeline](https://martinfowler.com/articles/patterns-of-distributed-systems/request-pipeline.html) | [请求管道（Request Pipeline）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/request-pipeline.md) |                                                              |
| [Singular Update Queue](https://martinfowler.com/articles/patterns-of-distributed-systems/singular-update-queue.html) | [单一更新队列（Singular Update Queue）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/singular-update-queue.md) |                                                              |
| [Single Socket Channel](https://martinfowler.com/articles/patterns-of-distributed-systems/single-socket-channel.html) | [单一 Socket 通道（Single Socket Channel）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/single-socket-channel.md) |                                                              |



### Atomic Commit

| 英文                                                         | 中文                                                         | Example & 扩展 |
| ------------------------------------------------------------ | ------------------------------------------------------------ | -------------- |
| [Two Phase Commit](https://martinfowler.com/articles/patterns-of-distributed-systems/two-phase-commit.html) | [两阶段提交（Two Phase Commit）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/two-phase-commit.md) | 两阶段变种     |
| [Fixed Partitions](https://martinfowler.com/articles/patterns-of-distributed-systems/fixed-partitions.html) | /                                                            |                |
| [Key-Range Partitions](https://martinfowler.com/articles/patterns-of-distributed-systems/key-range-partitions.html) | /                                                            |                |



### Kubernetes or Kafka Control Plane
| 英文                                                         | 中文                                                         | Example & 扩展                                               |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Lease](https://martinfowler.com/articles/patterns-of-distributed-systems/time-bound-lease.html) *** | [租约（Lease）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/lease.md) | {% post_link 'crashDetect' %} <br>ETCD  Lease <br/>K8s Lease<br />Eureka Lease |
| [State Watch](https://martinfowler.com/articles/patterns-of-distributed-systems/state-watch.html) *** | [状态监控（State Watch）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/state-watch.md) |                                                              |
| [Idempotent Receiver](https://martinfowler.com/articles/patterns-of-distributed-systems/idempotent-receiver.html) | [幂等接收者（Idempotent Receiver）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/idempotent-receiver.md) |                                                              |



### Logical Timestamp usage 

| 英文                                                         | 中文                                                         | Example & 扩展                                               |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Lamport Clock](https://martinfowler.com/articles/patterns-of-distributed-systems/lamport-clock.html) | [Lamport 时钟（Lamport Clock）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/lamport-clock.md) |                                                              |
| [Versioned Value](https://martinfowler.com/articles/patterns-of-distributed-systems/versioned-value.html) *** | [有版本的值（Versioned Values）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/versioned-value.md) | tikv mvcc[TSO]<br>[CockroachDB](https://www.cockroachlabs.com/docs/stable/) mvcc[HLC]<br> |
| [Hybrid Clock](https://martinfowler.com/articles/patterns-of-distributed-systems/hybrid-clock.html) *** | [混合时钟（Hybrid Clock）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/hybrid-clock.md) | [CockroachDB](https://www.cockroachlabs.com/docs/stable/)    |
| [Gossip Dissemination](https://martinfowler.com/articles/patterns-of-distributed-systems/gossip-dissemination.html) *** | [Gossip 传播（Gossip Dissemination）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/gossip-dissemination.md) | Redis Gossip                                                 |
| [Consistent Core](https://martinfowler.com/articles/patterns-of-distributed-systems/consistent-core.html) | [一致性内核（Consistent Core）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/consistent-core.md) |                                                              |
| [Version Vector](https://martinfowler.com/articles/patterns-of-distributed-systems/version-vector.html) | [版本向量（Version Vector）](https://github.com/www6v/patterns-of-distributed-systems/blob/master/content/version-vector.md) |                                                              |



### Others

- [Request Batch](https://martinfowler.com/articles/patterns-of-distributed-systems/request-batch.html)
- [Clock-Bound Wait](https://martinfowler.com/articles/patterns-of-distributed-systems/clock-bound.html)
- [Emergent Leader](https://martinfowler.com/articles/patterns-of-distributed-systems/emergent-leader.html)
- [Request Waiting List](https://martinfowler.com/articles/patterns-of-distributed-systems/request-waiting-list.html)



## Self

|            | Example & 扩展              |
| ---------- | --------------------------- |
| time wheel | {% post_link 'timedTask' %} |



## 参考

1. [Patterns of Distributed Systems](https://martinfowler.com/articles/patterns-of-distributed-systems/)
[《分布式系统模式》中文版](https://github.com/www6v/patterns-of-distributed-systems)
2. {% post_link 'distributedDatabaseGlobalTime' %}  self
