---
title: AWS Storage
date: 2022-10-01 06:23:50
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->

## EBS

## EFS

## S3
+ S3[2]
  - Static content
  - serverless
  - pay-as-you-go

+ Type
{% asset_img s3-type.JPG  S3 Type %}


+ S3 – Replication[2]
  - Cross Region Replication (CRR)
  - Same Region Replication (SRR)
  - Combine with Lifecycle Policies

+ S3 Select & Glacier Select[3]
  + S3 Select 
    server side filtering
  + Glacier Select

+ Lifecycle Management
  - Transition actions
  - Expiration actions

+ s3访问策略[1]  
{% asset_img s3-accessPolicy.JPG  s3访问策略 %}

+ 访问方式[4]
  - private Address
  - public Address

## 参考
1. [AWS解决方案架构师认证 Professional(SAP)中文视频培训课程2022](https://www.bilibili.com/video/BV1hJ411U7vd?)  P10
2. [SAP-2] Storage Section *** 
3. [S3 Select and Glacier Select – Retrieving Subsets of Objects](https://aws.amazon.com/blogs/aws/s3-glacier-select/)
4. [SAP-1] *** 

[海量数据云归档最佳实践](https://www.bilibili.com/video/BV14a4y1W77S/) bili ucloud
