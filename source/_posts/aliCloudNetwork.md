---
title: 阿里云 Network
date: 2022-10-15 23:27:07
tags:
  - 云计算
categories:
  - 云计算  
  - 产品
---

<p></p>
<!-- more -->


## VPC的组件
+ vSwitch 虚拟交换机
  - 对应一个子网

+ vRouter 虚拟路由器
  - 功能
    - 连接vpc内的各个交换机
    - 连接vpc和其他网络的网关设备
  - 路由表
    - 默认路由 vs. 自定义路由
    - 主路由表 vs. 子路由表
      - 主路由表
        每个vpc一个主路由表
      - 子路由表  
        子网/交换机粒度

## VPC的安全
+ 网络ACL
  - 功能
    - ACL与交换机绑定
  - 边界  
    - 子网间的ACL
    - vpc边界的ACL
  - 无状态  
+ 安全组
  - 主机粒度
  - 虚拟防火墙
  - 有状态        

## NAT网关
+ VPC公网网关
  - SNAT
    NAT Gateway绑定EIP;
    配置子网的SNAT规则;
    ECS通过EIP访问公网;
  - DNAT
    从公网访问ECS


