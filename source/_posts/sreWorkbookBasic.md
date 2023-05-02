---
title: SRE 五大根基
date: 2022-04-27 22:33:17 
tags: 
  - sre
categories:
  - 稳定性
  - sre
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# SRE五大根基 
### 实践SLO  

##### 服务的SLO [1]
  - VALET[Home Depot]
    + Volume
    + Avail
    + Latency
    + Errors
    + Ticket

#####  数据服务的SLO
{% post_link 'redisSLO' %}

##### SLI [1]

| 服务类型 | SLI类型                |
| -------- | ---------------------- |
| 请求驱动 | 可用性，延迟，质量     |
| 流水线   | 时效性，正确率，覆盖率 |
| 存储     | 持久性                 |

##### SLO 仪表板[趋势] [1]
{% asset_img  'slo-trend.JPG'  %}

### 监控

### 告警

### 减少琐事

### 简单化


# 参考
1. [《Google SRE工作手册》第二期SRE五大根基之一：SLO](https://www.bilibili.com/video/BV1ZK41127WY/)  V ***
2. [《Google SRE工作手册》第二期SRE五大根基之二：监控](https://www.bilibili.com/video/BV1JY411o7AS/)  V *** 
3. {%  post_link 'sreWorkbook' %} self