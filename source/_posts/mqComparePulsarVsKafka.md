---
title: Pulsar vs. Kafka
date: 2022-06-10 11:43:43
tags:
  - 消息系统
categories:
  - 分布式
  - 中间件 
  - 消息系统
  - 总结  
---

<p></p>
<!-- more -->

## 功能性

|            | kafka                | pulsar                                     |
| ---------- | -------------------- | ------------------------------------------ |
| 租户       | 单租户,可底层隔离    | 多租户, 企业级隔离.方便对接k8s的namespace. |
| 数据转移   | mirror maker独立部署 | geo-replication 内置功能                   |
| 冷热存储   | 商业使用             | 层级存储, 支持的非常好                     |
| 组件依赖   | 2.8.0之后剥离ZK      | 强依赖ZK, 组件复杂                         |
| 云原生支持 | 较为复杂             | 天然支持                                   |



## 非功能性

|                         | kafka                                                        | pulsar                                                       |
| ----------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 分区                    | kafka分区与broker强耦合[一个partion一个broker]               | partion条带化，分成粒度更细的segment。segment 分散再多个bookeeper的节点上 |
| 水平扩展[某一节点宕机]  | 1. broker id不会自动转移，要手动维护。2. 新的broker无法承载旧的partition的流量，要手动均衡。 | broker计算节点宕机，zookeeper元数据要变更。不影响producer，comsumer。 |
| 追赶读&延迟抖动敏感场景 | 1. 重度依赖pagecahce， 追赶读的数据会冲刷掉追尾读的未读取部分 2. zero copy在内存有明显争抢情况下，会出现延迟抖动非常剧烈。 | 使用JVM管理的堆外内存，更可控。对内存的依赖小于kafka.        |



## 参考
[深入对比 Apache Pulsar 与 Kafka](https://www.bilibili.com/video/BV19e4y1M7Ao/)  Pulsar Summit Asia 2022 ***