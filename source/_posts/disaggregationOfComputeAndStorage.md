---
title: 存算分离-数据应用
date: 2022-02-02 18:07:53
tags:
  - 高可用
categories: 
  - 架构 
  - 系统架构
  - 存算分离
---

<p></p>
<!-- more -->



|             | 存算分离                                                     | NONE-存算分离   |
| ----------- | ------------------------------------------------------------ | --------------- |
| NewSQL,HTAP | TiDB[tidb,tikv] , openGaussDB[2], CockroachDB? <br/> Aurora[10], PolarDB[3], | PGXC风格[1]     |
| 大数据      | clickhouse, hbase                                            | ES              |
| MQ          | Pulsar                                                       | kafka, rocketmq |
| 文件系统    | Ceph[PG, ODS], PolarFS[5]                                    |                 |
| KV          | GaussDB(for Redis) [4]                                       | redis Cluster   |
| 其他        | serverless[FasS, BaaS]                                       |                 |



## 参考
[1] 《04 | 架构风格：NewSQL和PGXC到底有啥不一样？》  王磊
[2]  [opengauss系统架构](https://docs.opengauss.org/zh/docs/3.1.1/docs/Description/系统架构.html)
[3]  PolarDB Serverless: A Cloud Native Database for Disaggregated Data Centers
[4]  [GaussDB(for Redis)揭秘：Redis存算分离架构最全解析](https://blog.csdn.net/devcloud/article/details/118360126) 
[5] [阿里推出PolarFS分布式文件系统，存储与计算分开！附论文](https://zhuanlan.zhihu.com/p/42754631)
[10] VERBITSKI A，GUPTA A，SAHA D，et al. Amazon aurora：design considerations for high throughput cloud-native relational databases ［C］. Proceedings of the 2017 ACM International Conference on Man⁃ agement of Data，2017 ：1041-1052.

