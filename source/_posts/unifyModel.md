---
title: 统一模型
date: 2023-05-13 11:10:44
tags:
  - 统一模型
categories:
  - 架构    
  - 系统架构
  - 统一模型
---

<p></p>
<!-- more -->



| 计算密集     | 技术                                                         | 产品                                                     |
| ------------ | ------------------------------------------------------------ | -------------------------------------------------------- |
| 微服务       | RPC<br/>Service Mesh(3th)<br>多运行时(4th )                  | Dubbo<br/>istio proxyless<br/>daper                      |
| 容器         | 编排                                                         | K8s                                                      |
| Service Mesh | Sidecar <br/>控制面， 数据面                                 | Envoy xDS <br/>微软SMI                                   |
| 可观测       | Tracing+Metric+Logs                                          | OpenTelemetry=<br>OpenCensus+OpenTracing                 |
| Sererless    | Sererless+ VM<br/>Sererless+容器<br/>Sererless+服务<br/>Sererless+数据库<br/> | Ali ECS<br/>Ali ECI<br/>FasS<br/>Aurora，TiDB Cloud<br/> |





| 数据密集 | 技术                               | 产品                          |
| -------- | ---------------------------------- | ----------------------------- |
| 消息队列 | CloudEvent                         | EventMesh                     |
| 数据库   | 存算分离(资源伸缩)，融合HTAP(模型) | TiDB(TiKV, TiFlash) ，PolarDB |
| 大数据   | 流计算                             | Beam，Flink                   |

