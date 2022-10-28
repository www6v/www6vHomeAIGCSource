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


## LB[2]
+ 3类LB [hand-on]
  - classic LB
  - Application LB
  - Network LB

参考:
[AWS中负载均衡器类型](https://zhuanlan.zhihu.com/p/152022399)
[Classic Load Balancer](https://zhuanlan.zhihu.com/p/157289913)
[应用程序负载均衡器概述](https://zhuanlan.zhihu.com/p/159446935) 
[配置ALB基于路径的路由功能](https://zhuanlan.zhihu.com/p/161848151)
[网络负载均衡器(NLB)](https://zhuanlan.zhihu.com/p/166345804)
[配置网络负载均衡器](https://zhuanlan.zhihu.com/p/179949353)


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


## Serverless
领域  |  Serverless 服务
:-:| :-:
计算  |   Lambda， Fargate
程序集成 |  EventBridge, SNS, Step Functions,  SQS,  API Gateway,  AppSync
存储 |   S3， DynamoDB， RDS，Aurora Serverless
分析  | Redshift Serverless, EMR Serverless，MSK Serverless


##### Lambda[1]
+ 场景
+ 并发 流量
+ 版本

参考:
[AWS 15 年（1）：从 Serverful 到 Serverless](https://www.cnblogs.com/sammyliu/p/15739301.html)

## 参考
1. bilibili video
2. aws中文教程




