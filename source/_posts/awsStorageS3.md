---
title: AWS Storage-S3
date: 2022-10-01 06:23:50
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->

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

+ 访问S3
  + s3访问策略[1]  
    {% asset_img s3-accessPolicy.JPG  s3访问策略 %}
  + 访问方式[4]
    - private Address
    - public Address

+ Versioning
  + preserve, retrieve, and restore

+ 基本特性[5]
  - S3的文件存储在存储桶（Buckets）内，可以理解为文件夹
  - 存储桶创建之后会生成一个URL
    S3是以HTTPS的形式展现的，而非HTTP
  - S3的存储桶创建的时候可以选择所在区域（Region），但不能选择可用区（AZ），AWS会负责S3的高可用、容灾问题 
    - S3创建的时候可以选择某个AWS区域，一旦选择了就不能更改
    - 如果要在其他区域使用该S3的内容，可以使用跨区域复制
  - S3拥有不同的等级（Standard, Stantard-IA, Onezone-IA, RRS, Glacier）
  - 启用了版本控制（Version Control）你可以恢复S3内的文件到之前的版本
  - S3可以开启生命周期管理
    - 要启用生命周期管理需要先启用版本控制功能
  - 支持加密功能  
  - 使用访问控制列表（Access Control Lists）和桶策略（Bucket Policy）可以控制S3的访问安全

## 参考
1. [AWS解决方案架构师认证 Professional(SAP)中文视频培训课程2022](https://www.bilibili.com/video/BV1hJ411U7vd?)  P10
2. [SAP-2] Storage Section *** 
3. [S3 Select and Glacier Select – Retrieving Subsets of Objects](https://aws.amazon.com/blogs/aws/s3-glacier-select/)
4. [SAP-1] *** 
5. [AWS学习笔记（十） Amazon Simple Storage Service (S3)](http://www.cloudbin.cn/?p=1968) 

[海量数据云归档最佳实践](https://www.bilibili.com/video/BV14a4y1W77S/) bili ucloud



[08-S3存储桶策略（S3 Bucket Policies）](https://www.iloveaws.cn/1238.html)
[09-配置跨账户S3存储桶的访问（Cross Account S3 Bucket Configuration）](https://www.iloveaws.cn/1361.html)
[10-S3标准 ACL（Canned ACL）](https://www.iloveaws.cn/1426.html)
[39-S3存储桶跨区域复制 (CRR)](https://www.iloveaws.cn/2428.html)