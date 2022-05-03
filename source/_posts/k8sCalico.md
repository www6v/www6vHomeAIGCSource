---
title: Calico
date: 2022-05-03 10:15:18
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->


## Calico
##### 原理:  
+ 基于iptable/linux kernel包转发;
  根据iptables规则进行路由转发;

+ BGP(Border Gateway Protocol 边界网关协议): 就是在大规模网络中实现节点路由信息共享的一种协议

  
<code>
BGP 协议传输的消息

1 [BGP 消息]
2 我是宿主机 192.168.1.3
3 10.233.2.0/24 网段的容器都在我这里 
4 这些容器的下一跳地址是我  
</code>

##### 组件:
+ Calico 的 CNI 插件

+ Felix
  路由规则(核心); iptables的配置组件Felix; 
  它是一个 DaemonSet，负责在宿主机上插入路由规则(即:写入 Linux 内核的 FIB 转发信息库)，以及维护 Calico 所需的网络设备等工作。

<code>
  路由规则：
<目的容器 IP 地址段> via <网关的 IP 地址> dev eth0
</code>

+ BIRD， 路由广播组件BGP Speaker
  BIRD是 BGP 的客户端，专门负责在集群里分发路由规则信息。


##### 架构
+ Node-to-Node Mesh模式
  - 默认配置下，是一个被称为“Node-to-Node Mesh”的模式，一般推荐用在少于 100 个节点的集群里
    Node 称为 BGP Peer 

  - 非overlay, Calico 没有使用 CNI 的网桥模式;

<code> 
宿主机 Node 2 上的 Container 4 对应的路由规则，如下所示: 

10.233.2.3 dev cali5863f3 scope link   
即:发往 10.233.2.3 的 IP 包，应该进入 cali5863f3 设备。   
</code> 


  {% asset_img  mesh-mode1.png  Node-to-Node Mesh模式  %}

  {% asset_img  mesh-mode.png  Node-to-Node Mesh模式  %}

+ Route Reflector模式 + IPIP模式
  大规模

  {% asset_img  route-reflector+ipip.png  Route Reflector模式+IPIP模式  %}

  {% asset_img  route-reflector.png  Route Reflector模式+IPIP模式  %}

## 参考:
趣谈网络协议  刘超
《31容器网络之Calico：为高效说出善意的谎言》

深入剖析Kubernetes  张磊
《35  解读Kubernetes三层网络方案》
