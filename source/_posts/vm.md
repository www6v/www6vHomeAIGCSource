---
title: 云计算中的虚拟机vm
date: 2020-07-29 12:09:24
tags:
  - 云计算
categories:
  - 云计算  
  - 虚拟机
---

<p></p>
<!-- more -->


## AZ和Region
{% asset_img   az.jpg  可用区  %}

{% asset_img   region.jpg  region  %}

##  计算资源高可用 -> 虚拟机  
### 1. IDC内高可用（AZ内部）
   **虚拟机打散分布**
   AWS 称为置放群组（Placement Group）；
   Azure 称为可用性集（Availability Set）；
   阿里云对应的服务则是部署集；
### 2.  IDC数据中心之间的高可用(AZ之间)
   多可用区的实例部署；
   vpc打通可用区；
### 3. 整个区域级别的事故(region)
   + **多区域架构**层面相关的预案；
   DNS 层面进行导流，把域名解析到另外的一个区域的备用服务上，底层的数据则需要我们日常进行着跨区域的实时同步。
   + **多云**的方案
   避免厂商锁定

##  虚拟机(弹性伸缩 + 负载均衡器)   
AWS 中相关的产品命名是 EC2 自动伸缩（Auto Scaling）;
Azure 中是虚拟机规模集（VM Scale Set）;
阿里云则叫做弹性伸缩;

##  虚拟机 
KVM, quem, libvirt


## 参考:
1. [深入浅出云计算-07 | 云端架构最佳实践：与故障同舞，与伸缩共生]()  何恺铎