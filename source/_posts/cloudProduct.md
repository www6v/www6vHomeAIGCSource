---
title: 云计算产品
date: 2022-04-30 18:00:03
tags:
  - 云计算
categories:
  - 云计算  
  - 产品
---

<p></p>
<!-- more -->


## 计算
 /  | AWS | 阿里云 | 腾讯云
:-: | :-: | :-: | :-:
VM | EC2 | ECS | CVM
Auto Scale| Auto Scaling| Auto Scaling| Auto Scaling
Serverless | Lambda | Function Compute| 云函数 SCF
容器（托管）| EKS（Kubernetes Service） | ACK | TKE
容器（serverless）| ECS（Container Service）/Fargate | ECI（Container Instance）/ASK  | EKS(Kubernetes Service)


####  Kubernetes产品形态
1. 托管集群（ 阿里 ACK ）
2. serverless Kubernetes （阿里 ASK， ECI）
3. service mesh（阿里 ASM）
4. 边缘托管（华为openedge）
{% asset_img   product.jpg  Kubernetes产品形态  %}


## 网络
云上网络  | AWS | 阿里云 | 腾讯云 
:-: | :-: | :-: | :-:
VPC |VPC | VPC | VPC
EIP IPv4/IPv6 | EIP | EIP IPv4/IPv6 | EIP IPv4/IPv6
NAT网关| NAT Gateway| NAT Gateway| NAT Gateway
负载均衡| ELB(NLB，ALB) | SLB | CLB
私网连接 | Private Link | PrivateLink | Private Link
计费模式| | 共享带宽包/共享流量包 | 共享带宽包/共享流量包


跨地域网络  | AWS | 阿里云 | 腾讯云 
:-: | :-: | :-: | :-:
VPC对等连接| VPC Peering | |  对等连接（Peering Connection)
多VPC互联 | Transit Gateway(TGW) | 云企业网（CEN） | 云联网（CCN）
动态加速网络| Global accelerator | Global accelerator | Anycast Internet Acceleration


混合云网络  | AWS | 阿里云 | 腾讯云 
:-: | :-: | :-: | :-:
VPN | VPN | VPN | VPN
专线| Direct Connect | Express Connect<br>高速通道-专线 | Direct Connect
DNS | Route 53 | DNS/Private Zone| DNSPod

ENI， SD-WAN
 
## 存储
 /  | AWS | 阿里云 | 腾讯云 
:-: | :-: | :-: | :-:
对象存储| S3 | OSS | COS
块存储| EBS | EBS | CBS
文件存储| EFS | NAS| CFS
archive| S3 Glacier | OSS Archive Storage | COS Archive Storage


参考：
[从AWS到阿里云： 产品体系差异分析](https://zhuanlan.zhihu.com/p/158035354)
7. [Serverless Kubernetes：理想，现实与未来](https://mp.weixin.qq.com/s/o_dPKP_6dL92Q4jiG4097A)  易立、张维
