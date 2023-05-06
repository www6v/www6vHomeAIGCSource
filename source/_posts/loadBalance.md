---
title: 负载均衡-算法
date: 2022-05-06 11:29:37
tags:
  - 负载均衡
categories:
  - 中间件
  - 负载均衡
---

<p></p>
<!-- more -->



| 组件 | 类型     | 负载均衡算法                                                 | 场景                                                         |
| ---- | -------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| LVS  | **静态** | RR：roundrobin                                               | 轮询机制                                                     |
|      |          | WRR：Weighted RR                                             | 加权轮询，权重越大承担负载越大                               |
|      |          | SH：Source Hashing 源地址哈希                                | 实现session sticky<br/>缺点：调度粒度大，对负载均衡效果差；  |
|      |          | DH：Destination Hashing 目标地址哈希                         |                                                              |
|      | **动态** | LC：least connections                                        | 适用于长连接应用<br>`Overhead=activeconns*256+inactiveconns` |
|      |          | WLC：Weighted LC                                             | 默认调度方法,较常用（加上了权重）<br>`Overhead=(activeconns*256+inactiveconns)/weight` |
|      |          | [SED](https://so.csdn.net/so/search?q=SED&spm=1001.2101.3001.7020)：Shortest Expection Delay | `Overhead=(activeconns+1)*256/weight`                        |
|      |          | NQ：Never Queue，                                            | 第一轮均匀分配，后续SED<br/>***\*SED\****算法改进            |
|      |          | LBLC：Locality-Based LC                                      | 动态的 ***\*DH\****连接算法                                  |
|      |          | LBLCR：LBLC with Replication                                 | 带复制功能的LBLC                                             |
|      |          |                                                              |                                                              |

| 组件  | 类型          | 负载均衡算法      | 场景 |
| ----- | ------------- | ----------------- | ---- |
| Nginx | **静态**<br/> | 轮询<br/>         |      |
|       |               | 加权轮询<br/>     |      |
|       |               | IP Hash<br/>      |      |
|       | **动态**<br/> | Fair<br/>         |      |
|       |               | Least Connections |      |



| 组件    | 类型          | 负载均衡算法           | 场景 |
| ------- | ------------- | ---------------------- | ---- |
| HAproxy | **静态**<br/> | 轮询<br/>              |      |
|         |               | 加权轮询<br/>          |      |
|         |               | IP Hash<br/>           |      |
|         | **动态**<br/> | Least Connections<br/> |      |
|         |               | Source                 |      |

