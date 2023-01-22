---
title: 云计算产品-网络Network
date: 2022-05-22 11:07:18
tags:
  - 云计算
categories:
  - 云计算  
  - 产品
---

<p></p>
<!-- more -->





## 网络 [1] [5]
|          云上网络[场景]          |                             AWS                              |                            Azure                             |                            阿里云                            |            腾讯云             |
| :------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :---------------------------: |
|     Cloud virtual networking     |  [Virtual Private Cloud (VPC)](https://aws.amazon.com/vpc)   | [Virtual Network](https://azure.microsoft.com/services/virtual-network) |                             VPC                              |              VPC              |
|          EIP IPv4/IPv6           |                             EIP                              |                                                              |                        EIP IPv4/IPv6                         |         EIP IPv4/IPv6         |
|           NAT gateways           | [NAT Gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) | [Virtual Network NAT](https://learn.microsoft.com/en-us/azure/virtual-network/nat-gateway/nat-overview) |                         NAT Gateway                          |          NAT Gateway          |
|          Load balancing          | ELB(NLB，ALB)[Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html) | [Load Balancer](https://azure.microsoft.com/services/load-balancer) | SLB 默认是多可用区的，一主一备<br> CLB: 4层+7层, standby一个可用区中的实例处于工作状态 <br> |              CLB              |
| Application-level load balancing | [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html) | [Application Gateway](https://azure.microsoft.com/services/application-gateway) |               ALB: 7层,在所有可用区同时工作[3]               |                               |
|           Route table            | [Custom Route Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) | [User Defined Routes](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-udr-overview) |                                                              |                               |
|           Private link           |      [PrivateLink](https://aws.amazon.com/privatelink)       | [Azure Private Link](https://azure.microsoft.com/services/private-link) |                         PrivateLink                          |         Private Link          |
|    Private PaaS connectivity     | [VPC endpoints](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints.html) | [Private Endpoint](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview) |                                                              |                               |
|     Virtual network peering      | [VPC Peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) | [VNET Peering](https://azure.microsoft.com/resources/videos/virtual-network-vnet-peering) |                                                              | 对等连接（Peering Connection) |
|    Content delivery networks     |       [CloudFront](https://aws.amazon.com/cloudfront)        | [Front Door](https://azure.microsoft.com/services/frontdoor) |                                                              |                               |
|             计费模式             |                                                              |                                                              |                    共享带宽包/共享流量包                     |     共享带宽包/共享流量包     |


| 跨地域网络[场景] |         AWS          | Azure |       阿里云       |            腾讯云             |
| :--------------: | :------------------: | :---: | :----------------: | :---------------------------: |
|    多VPC互联     | Transit Gateway(TGW) |       |  云企业网（CEN）   |         云联网（CCN）         |
|   动态加速网络   |  Global accelerator  |       | Global accelerator | Anycast Internet Acceleration |


|      混合云网络[场景]       |                             AWS                              |                            Azure                             |              阿里云              |     腾讯云     |
| :-------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :------------------------------: | :------------: |
| Cross-premises connectivity | VPN [VPN Gateway](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) | [VPN Gateway](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways) |               VPN                |      VPN       |
|      Dedicated network      |    [Direct Connect](https://aws.amazon.com/directconnect)    | [ExpressRoute](https://azure.microsoft.com/services/expressroute) | Express Connect<br>高速通道-专线 | Direct Connect |
|       DNS management        |          [Route 53](https://aws.amazon.com/route53)          |       [DNS](https://azure.microsoft.com/services/dns/)       |         DNS/Private Zone         |     DNSPod     |
|      DNS-based routing      |          [Route 53](https://aws.amazon.com/route53)          | [Traffic Manager](https://azure.microsoft.com/services/traffic-manager) |                                  |                |
|           SD-WAN            |                           CloudWan                           |                                                              |         智能接入网关 SAG         |                |

ENI，




## 参考
1. [从AWS到阿里云： 产品体系差异分析](https://zhuanlan.zhihu.com/p/158035354)
2. 无
3. <<云网络-数字经济的连接>>  3.7 阿里
4. [阿里云系列课程](https://www.bilibili.com/video/BV1tD4y1977x?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036) *** 有ppt链接
5. [Networking on Azure and AWS](https://learn.microsoft.com/en-us/azure/architecture/aws-professional/networking)