---
title: AWS Network-VPC Endpoint
date: 2022-06-17 17:44:27
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->


+ VPC Endpoints[2]
  VPC Endpoints 使您能够将您的 VPC 私下连接到可支持的 AWS 服务和 VPC 终端节点服务（由 AWS PrivateLink 提供支持），而无需 Internet 网关、NAT 设备、VPN 连接或 AWS Direct Connect 连接。
  - 网关终端节点
    支持S3 和 DynamoDB 的通信
    网关终端节点将路由表目标用于路由表中的指定路由以获得支持的服务。
    - 注意点
      使用 VPC 终端节点， S3 存储桶策略可以允许基于 VPC 标识符或特定 VPC 终端节点标识符的访问。 但是，在使用 VPC 终端节点时，S3 存储桶策略不支持基于 IP 地址的策略。   
  - 接口终端节点
    支持Kinesis Streams、ELB API、Amazon EC2 API等  .
    接口终端节点（由 AWS PrivateLink 提供支持）在您的 VPC 中使用具有私有 IP 地址的弹性网络接口，该地址用作流向受支持服务的流量的入口点。
{% asset_img  vpc-endpoint.JPG  interface endpoint vs. Gateway endpoint %}


## 参考
2. [Chapter 2-Amazon Virtual Private Cloud (Amazon VPC) and Networking Fundamentals](https://zhuanlan.zhihu.com/p/529181222) *** 

[44-VPC 终端节点-网关终端节点](https://www.iloveaws.cn/3257.html)
[45-VPC 终端节点-接口终端节点](https://www.iloveaws.cn/3606.html)
[46-使用VPC终端节点策略控制对服务的访问](https://www.iloveaws.cn/3638.html)
[53-VPC 终端节点服务](https://www.iloveaws.cn/3882.html)  seen
[47-配置VPC终端节点策略](https://www.iloveaws.cn/3656.html)



