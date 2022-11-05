---
title: AWS Network-Overview
date: 2022-10-01 06:14:02
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->

## Overview[1][3]
{% asset_img   awsNetwork.jpg AWS网路产品 %}


##### 云上网络[场景]
+ vpc
+ vpc peering ***
  - [劣势：没有transitive 特性]
+ private link
  - vpc上打个洞，用的比较少
+ ELB 

##### 跨地域网络[场景]
+ sd-wan    
  + cloudwan  

##### 混合云网络[场景]
+ vpn
  + client vpn ***
  + vpn gateway  
  + vpn site-to-site *** 
    [AWS Site-to-Site VPN](https://zhuanlan.zhihu.com/p/395805857)
    [AWS Site-to-Site VPN 的工作原理](https://docs.aws.amazon.com/zh_cn/vpn/latest/s2svpn/how_it_works.html)
+ 专线
  + direct connect ***
+ transit gateway ***
  - [劣势： 不能跨region. 如果要跨region, 需要TGW之间做peering] 

##### (解决方案)
+ transit vpc

##### VPC Peering vs. Transit VPC vs. Transit Gateway
{% asset_img   aws-network-compare.JPG  VPC Peering vs. Transit VPC vs. Transit Gateway  %}


## 参考
1.[亚马逊云科技企业组网解决方案 | 一期一会](https://www.bilibili.com/video/BV1gQ4y1k7LH/)
3. [【云计算】AWS高级网络.LAB1.1.vpc_peering](https://www.bilibili.com/video/BV1CG41137bx/)
7. [AWS networking](https://www.zhihu.com/column/c_1520366118765621248) *** 笔记  未

### white paper
[Building a Scalable and Secure Multi-VPC AWS Network Infrastructure-AWS Whitepaper](https://d1.awsstatic.com/whitepapers/building-a-scalable-and-secure-multi-vpc-aws-network-infrastructure.pdf) ***  未
[教主技术进化论2022第24期 AWS网络白皮书.1.vpc_peering](https://www.bilibili.com/video/BV1Cd4y1377m/) 





