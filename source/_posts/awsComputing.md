---
title: AWS 计算Computing
date: 2022-03-30 09:53:11
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->

## EC2
##### Types
{% asset_img  ec2-types.JPG  EC2类型 %}

## EC2 Auto Scaling [hand-on][2]
+ Auto Scaling + CloudWatch
  - Auto Scaling
    - 配置最大 最小 实例数
    - 扩展策略
      目标跟踪策略[简单]
      步进扩展策略[复杂-根据CloudWatch来配置-优先建议采用]
  - CloudWatch
    配置平均cpu使用率, 如果大于或小于某个使用量, 做扩缩

参考：
[AWS解决方案架构师认证 Professional(SAP)中文视频培训课程2022](https://www.bilibili.com/video/BV1hJ411U7vd?)  P23-25

## 参考
1. bilibili video
2. aws中文教程




