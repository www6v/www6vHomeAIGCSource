---
title: Kubernetes网络
date: 2019-08-23 19:04:40
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

{% asset_img   k8sNetwork.jpg  图1.Kubenetes网络  %}

## 一. 容器和容器之间的网络
   + 使用Docker的一种网络模型：–net=container
   + 每个Pod容器有有一个pause容器

## 二. Pod与Pod之间的网络

基础: 网桥

### 2.1 同节点pod通信  
通过**网桥**通信

<div style="text-align: center; width:60%; height: 60%">
![pod-to-pod-in-node](https://user-images.githubusercontent.com/5608425/68114098-31c4b980-ff30-11e9-9dbd-163452ec51bc.jpg)
图2. 同节点pod通信
</div>

### 2.2 不同节点中的Pod通信（跨主机网络通讯）

### 2.2.1  Overlay (Flannel)
1. **Flannel**

<div style="text-align: center;">
![flannel-udp](https://user-images.githubusercontent.com/5608425/65022322-50acc380-d963-11e9-8476-5e5ab22c8b4c.JPG)  
图3. flannel-UDP模式
</div>

**flannel-UDP模式(三层overlay)**
原理： 
    fannelId进程封装/解开虚拟网卡docker0,fannel0的数据;
    三层的overlay网络;

组件： TUN设备是**3层**的虚拟网络设备 ; fannel0

劣势:  三次用户态和内核态切换 ; 性能差， 已弃用 

<div style="text-align: center;">
![flannel-vxlan](https://user-images.githubusercontent.com/5608425/65022323-51455a00-d963-11e9-9442-d4f1b84ecce5.JPG)  
图4. flannel-vxlan模式
</div>

**flannel-vxlan模式(两层虚拟网络)**

> VXLAN 的覆盖网络的设计思想是：在现有的三层网络之上，“覆盖”一层虚拟的、由内核 VXLAN
模块负责维护的二层网络，使得连接在这个 VXLAN 二层网络上的“主机”（虚拟机或者容器都可
以）之间，可以像在同一个局域网（LAN）里那样自由通信

组件： 
    VTEP（VXLAN Tunnel End Point）设备; fannel.1; 
    组成一个虚拟的**两层**网络

优势： 
    进行封装和解封装的对象，是二层数据帧（Ethernet frame）;
    而且这个工作的执行流程，全部是在内核里完成的（因为VXLAN本身就是内核中的一个模块）;
    主流的网络容器方案。
   

**总结**:  
  flannel-UDP模式和flannel-vxlan模式都可以称作"隧道"机制；
  都是是overlay的。   

### 2.2.2 纯3层网络方案
1. **Flannel host-gw**

2. **Calico**
原理:  
  基于iptable/linux kernel包转发;
  根据iptables规则进行路由转发;
  非overlay;
组件:
  路由规则; iptables的配置组件Felix;  
  路由广播组件BGP Speaker;  
  

3. **Host Network模式**
容器的网络和宿主机的网络打平，在同一层;
underlay方案;

## 三. Pod与Service之间的网络

[Kubernetes服务](../../../../2019/11/04/k8sService/)

## 四. Internet与Service之间的网络
### 4.1 Service到Internet 
iptables执行源NAT( SNAT )

### 4.2 Internet到Service
1. NodePort  四层

<div style="text-align: center; width:60%; height: 60%">
![node-port](https://user-images.githubusercontent.com/5608425/68234082-7d17be80-003b-11ea-891f-90a9e174bbc8.png)
</div>

2. Service LoadBalancer  四层

<div style="text-align: center; width:60%; height: 60%">
![loadbalancer](https://user-images.githubusercontent.com/5608425/68290997-e216f700-00c3-11ea-82d3-b5e3f4c565a1.jpg)
</div>

3. Ingress Controller  七层

<div style="text-align: center; width:60%; height: 60%">
![ingress-1](https://user-images.githubusercontent.com/5608425/68234079-7c7f2800-003b-11ea-8ada-2c034db8b25a.png)
![ingress-2](https://user-images.githubusercontent.com/5608425/68234081-7c7f2800-003b-11ea-804c-1c5d87164d06.png)   
</div>

## 参考:
1. [第13 章 ： Kubernetes网络概念及策略控制](https://edu.aliyun.com/lesson_1651_13087#_13087) CNCF × Alibaba 云原生技术公开课
2. [calico网络原理及与flannel对比](https://blog.csdn.net/hxpjava1/article/details/79566192)
3. [Kubernetes CNI网络最强对比：Flannel、Calico、Canal和Weave](https://mp.weixin.qq.com/s/GQc8XPV4MaCWiTcN2wVzbw)
8. [K8s网络模型](https://mp.weixin.qq.com/s/spw8fHkIjiyf4kg5RQIL_w)  阿里 加多

---
趣谈网络协议  刘超
《30容器网络之Flannel：每人一亩三分地》
《31容器网络之Calico：为高效说出善意的谎言》

深入剖析Kubernetes  张磊
《32  浅谈容器网络》
《33  深入解析容器跨主机网络》 
《34  Kubernetes网络模型与CNI网络插件》 
《35  解读Kubernetes三层网络方案》
 






