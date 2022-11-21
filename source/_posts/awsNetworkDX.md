---
title: AWS Network-Direct Connect
date: 2022-10-30 10:08:06
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->

## Direct Connect[1][2]   
+ Virtual Interfaces 
  - Public VIF
    公共 VIF 使您的网络能够访问所有区域（中国除外）的 AWS 全球骨干网络上的所有 AWS 公共 IP 地址。
  - Private VIF
    私有 VIF 使您的网络能够通过其私有 IP 地址访问已在您的虚拟私有云 (VPC) 中配置的资源。

+ 高可用
  [常规做法: DX + VPN]
  
+ 双向转发检测 (BFD)
  DR

+ Billing
  - 两个主要成本组成部分
    -  所有 AWS Direct Connect 位置的每端口小时定价和 [使用时长]
    -  AWS Direct Connect 位置和 AWS 区域的数据传出费用  [数据传输的量]

+ Direct Connect gateway[3][4]
  Virtual private gateway associations
  private VIF that references the Gateway and the Connection
  {% asset_img directConnectionGateway.JPG  Direct Connect gateway %} 

## 参考
1. [Chapter5 AWS Direct Connect](https://zhuanlan.zhihu.com/p/531166462) 
2. [SAP-1] Direct Connect Section
3. [New – AWS Direct Connect Gateway – Inter-Region VPC Access](https://aws.amazon.com/blogs/aws/new-aws-direct-connect-gateway-inter-region-vpc-access/)
4. [Working with Direct Connect gateways](https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-gateways.html)

