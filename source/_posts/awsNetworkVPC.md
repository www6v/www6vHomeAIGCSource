---
title: AWS Network-VPC
date: 2022-10-30 09:57:32
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->


## VPC[5]
+ CIDR & subnet
+ Routing Table
  [没有看到路由器]
+ Security Groups & Network ACLs
  + Security Groups
    EC2 level-工作在EC2 instance level
    stateful firewall
  + Network ACLs
    工作在subnet level 
    stateless firewall
+ NAT Gateway 
  [通过internet gateway,访问外网, 外网访问不到内部, 多对一]
+ Internet Gateway
  [一对一的, 静态ip绑定到internet gateway, 外网访问内网的EC2]

## 参考
1. [路由表概述](https://help.aliyun.com/document_detail/106224.html) 阿里云 有例子
2. [010-计算机网络-无分类编址CIDR](https://www.bilibili.com/video/BV1Ff4y1S7Lf/)
3. [【云计算】AWS高级网络.LAB1.1.vpc_peering](https://www.bilibili.com/video/BV1CG41137bx/)
4. [UCloud 陈煌栋-UCloud VPC的技术演进之路]() 
5. [SAP-1] VPC Section *** 
6. [VPC](https://jayendrapatil.com/aws-virtual-private-cloud-vpc/) *** 
7. [Tool](https://network00.com/NetworkTools/IPv4SubnetCreator/)
