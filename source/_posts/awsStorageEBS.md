---
title: AWS Storage-EBS
date: 2022-06-17 18:17:32
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->


## EBS
+ Limited support for attaching multiple instances*
  多个实例attach有限制
+ EC2 instances must be in the same AZ as the EBS volume
  不能跨AZ
+ EBS volumes are replicated within an AZ
  可在同一个AZ内复制

## EBS Types
+ SSD-Backed Volumes
+ HDD-Backed Volumes

## EBS vs instance store
+ Instance Store volumes are physically attached to the host
  Instance Store 本地盘
+ EBS volumes are attached over the network
  EBS over network


## 参考
[SAP-1]  EBS