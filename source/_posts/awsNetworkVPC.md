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


## VPC 概念和组件[1][2]
+ Subnet & CIDR  
  [010-计算机网络-无分类编址CIDR](https://www.bilibili.com/video/BV1Ff4y1S7Lf/)
  [Tool](https://network00.com/NetworkTools/IPv4SubnetCreator/)
  
+ Routing Table
  [实际中没有看到路由器,只有路由表]
  [路由表概述](https://help.aliyun.com/document_detail/106224.html) 阿里云 有例子

+ Security Groups & Network ACLs
  + Security Groups
    EC2 level-工作在EC2 instance level
    stateful firewall
  + Network ACLs
    工作在subnet level 
    stateless firewall

+ NAT Gateway && NAT Instance 
  - NAT Gateway 
    [通过internet gateway,访问外网, 外网访问不到内部, 多对一]
  - NAT Instance  

+ Internet Gateway
  [一对一的, 静态ip绑定到internet gateway, 外网访问内网的EC2]

+ VPC Endpoints[2]
  - 网关终端节点
    支持S3 和 DynamoDB 的通信
  - 接口终端节点
    支持Kinesis Streams、ELB API、Amazon EC2 API等  

+ IP 寻址
+ 仅出口 Internet 网关 (EIGW)
+ 虚拟专用网关 (VGW)、客户网关和VPN
+ VPC 对等互连
+ 归置组
+ 弹性网络接口 ENI
+ 亚马逊域名服务 (DNS) 服务器  


## 参考
1. [SAP-1] VPC Section *** 
2. [Chapter 2-Amazon Virtual Private Cloud (Amazon VPC) and Networking Fundamentals](https://zhuanlan.zhihu.com/p/529181222) *** 
3. [【云计算】AWS高级网络.LAB1.1.vpc_peering](https://www.bilibili.com/video/BV1CG41137bx/)
4. [VPC](https://jayendrapatil.com/aws-virtual-private-cloud-vpc/) ***  未
[UCloud 陈煌栋-UCloud VPC的技术演进之路]() 









