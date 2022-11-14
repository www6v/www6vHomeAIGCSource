---
title: AWS Network-DNS
date: 2022-05-03 11:55:59
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->


## Route 53
+ Routing Policies
  + Simple
  + Weighted 
  + Latency-based
  + Failover (Active-Passive)
  + Geolocation
  + Geoproximity
    - Traffic flow


+ Hosted Zones
  - Public Hosted Zones
  - Private Hosted Zones


+ Health Checks
  Automated DNS Failover 
  + for public resources
    - Private Hosted Zones
      create a CloudWatch Metric and associate a CloudWatch Alarm

## 参考
SAP-2  DNS Section
[AWS学习笔记（十八） Route53](http://www.cloudbin.cn/?p=2349)



