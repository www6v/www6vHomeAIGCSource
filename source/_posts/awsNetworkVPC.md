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


## VPC 概念和组件[1][2][3]
+ Subnet & CIDR  
  [010-计算机网络-无分类编址CIDR](https://www.bilibili.com/video/BV1Ff4y1S7Lf/)
  [Tool](https://network00.com/NetworkTools/IPv4SubnetCreator/)
  
+ Routing Table
  [实际中没有看到路由器,只有路由表]
  [路由表概述](https://help.aliyun.com/document_detail/106224.html) 阿里云 有例子

+ Security Groups & Network ACLs [1]
  + Security Groups
    EC2 level-工作在EC2 instance level
    stateful firewall
  + Network ACLs
    工作在subnet level 
    stateless firewall

+ NAT Gateway && NAT Instance [1]
  - NAT Gateway 
    [通过internet gateway,访问外网, 外网访问不到内部, 多对一]
  - NAT Instance  

+ Internet Gateway
  [一对一的, 静态ip绑定到internet gateway, 外网访问内网的EC2]


+ 弹性网络接口ENI[2]
  - 弹性网络接口必须有一个主要的私有 IPv4 地址，并且始终与至少一个安全组相关联。
  - 弹性网络接口可以在运行时（热连接）、停止时（热连接）或启动时（冷连接）连接到实例。
  - 不能分离主网络接口。
  - 弹性网络接口仅限于单个可用区。


+ IP 寻址
+ 仅出口 Internet 网关 (EIGW)
+ 虚拟专用网关 (VGW)、客户网关和VPN
+ VPC peering
+ 归置组
+ DNS 服务器  



## 参考
1. [SAP-1] VPC Section *** 
2. [Chapter 2-Amazon Virtual Private Cloud (Amazon VPC) and Networking Fundamentals](https://zhuanlan.zhihu.com/p/529181222) *** 
3. [【云计算】AWS高级网络.LAB1.1.vpc_peering](https://www.bilibili.com/video/BV1CG41137bx/)
4. [VPC](https://jayendrapatil.com/aws-virtual-private-cloud-vpc/) ***  未
[UCloud 陈煌栋-UCloud VPC的技术演进之路]() 









