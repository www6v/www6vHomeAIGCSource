---
title:  Kubernetes服务
date: 2019-11-04 11:56:32
tags:
  - Kubernetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->

## 一. Kubenetes服务

<div style="text-align: center;">
![Kubernetes服务发现架构](https://user-images.githubusercontent.com/5608425/68105556-d4257280-ff19-11e9-9d19-f18f5c454f34.jpg)
Kubernetes服务发现架构
</div>

{% asset_img   k8sService.jpg  Kubernetes服务  %} 

+ ClusterIP 模式的 Service: **稳定的 IP 地址**，即 VIP.  ClusterIP是VIP, 虚拟IP.    
+ Headless Service: **稳定的 DNS 名字**, 名字是通过 Pod 名字和 Service 名字拼接出来.  

### 1.1  服务对外暴露方式

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


### 1.2 通过DNS发现服务
> 每个Service对象相关的DNS记录有两个：
{SVCNAME}.{NAMESPACE}.{CLUSTER_DOMAIN}
{SVCNAME}.{NAMESPACE}.svc.{CLUSTER_DOMAIN}

```
root@kubia-9nvx7:/# cat /etc/resolv.conf
nameserver 172.17.0.2
search default.svc.cluster.local svc.cluster.local cluster.local
options ndots:5
```

```
（1）拥有ClusterIP的Service资源，要具有以下类型的资源记录
A记录：<service>.<ns>.svc.<zone>. <ttl>  IN  A  <cluster-ip>

（2）Headless类型的Service资源，要具有以下类型的资源记录
A记录：<service>.<ns>.svc.<zone>. <ttl> IN A <endpoint-ip>

（3）ExternalName类型的Service资源，要具有CNAME类型的资源记录
CNAME记录：<service>.<ns>.svc.<zone>. <ttl> IN CNAME <extname>.
```

### 1.3 ClusterIP模式的yaml配置
Service（接口声明） + Deployment（ endpoint 接口实现）


## 二. Kubenetes服务工作原理

+ Service是由**kube-proxy**组件，加上**iptables**来共同实现的。
+ kube-proxy的作用: 网络配置

##### 2.1 kube-proxy 
##### userspace 代理模式
<div style="text-align: center;">
<img width="450" alt="user-space-proxy" src="https://user-images.githubusercontent.com/5608425/68077955-2b3b2280-fe08-11e9-8672-3210219a7372.png">
userspace 代理模式
</div>

##### iptables Proxy Mode
<div style="text-align: center;">
<img width="450" alt="iptables-proxy" src="https://user-images.githubusercontent.com/5608425/68077954-2b3b2280-fe08-11e9-8231-cb9bc177ba21.png">
 Iptables Proxy Mode
</div>


```
-A OUTPUT -m comment --comment "kubernetes service portals" -j KUBE-SERVICES

# 访问10.107.54.95后跳转到KUBE-SVC-4N57TFCL4MD7ZTDA链
-A KUBE-SERVICES -d 10.107.54.95/32 -p tcp -m comment --comment "default/nginx: cluster IP" -m tcp --dport 80 -j KUBE-SVC-4N57TFCL4MD7ZTDA

# 随机转发的目的地，分别是 KUBE-SEP-UZXILYFQQ2IZUWN5 和 KUBE-SEP-43IWXJI557JKCKCF
-N KUBE-SVC-4N57TFCL4MD7ZTDA
-A KUBE-SVC-4N57TFCL4MD7ZTDA -m statistic --mode random --probability 0.50000000000 -j KUBE-SEP-UZXILYFQQ2IZUWN5
-A KUBE-SVC-4N57TFCL4MD7ZTDA -j KUBE-SEP-43IWXJI557JKCKCF

## DNAT到pod的ip和端口
-A KUBE-SEP-UZXILYFQQ2IZUWN5 -p tcp -m tcp -j DNAT --to-destination 172.17.0.4:80
-A KUBE-SEP-43IWXJI557JKCKCF -p tcp -m tcp -j DNAT --to-destination 172.17.0.5:80
```

##### IPVS proxy mode
> IPVS是LVS一个组件，提供高性能、高可靠性的四层负载均衡器。IPVS 是IP Virtual Server的简写。IPVS构建在netfilter上，作为Linux 内核的一部分，从传输层实现了负载均衡。
 

## 参考:
1. [深入理解 Kubernetes之：Service](https://www.kubernetes.org.cn/5992.html) good
2. [第14 章 ： Kubernetes Services](https://edu.aliyun.com/lesson_1651_17064#_17064)  阿里
3. [《Kubenetes in Action》](http://product.dangdang.com/26439199.html?ref=book-65152-9168_1-529800-3)  七牛容器云团队
4. [Kubernetes中的服务发现机制与方式](https://mp.weixin.qq.com/s/3THiWFt52tZckFGxg3Cx-g) 马永亮 
5. [《深入剖析Kubernetes - 37  找到容器不容易：Service、DNS与服务发现》]() 张磊