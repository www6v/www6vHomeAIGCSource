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


## Route 53 [1][2]
+ Routing Policies
  + Simple
  + Weighted 
  + Latency-based
  + Failover (Active-Passive)
  + Geolocation
  + Geoproximity
    - Traffic flow
  
  {% asset_img routingPolicy.JPG  Routing Policy %}

+ Hosted Zones
  hosted zone: a set of records belonging to a domain
  - Public Hosted Zones
  - Private Hosted Zones
    Association with VPC


+ Health Checks
  Automated DNS Failover 
  + for public resources
    - Private Hosted Zones
      create a CloudWatch Metric and associate a CloudWatch Alarm
  + Resolver Endpoints
    - Inbound Endpoint
    - Outbound Endpoint
      - Resolver Rules  

+ CNAME vs 别名        

## 参考
1. SAP-1  
2. SAP-2  DNS Section
3. [AWS学习笔记（十八） Route53](http://www.cloudbin.cn/?p=2349)



