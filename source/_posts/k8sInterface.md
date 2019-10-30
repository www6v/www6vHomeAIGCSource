---
title: Kubernetes开放接口
date: 2019-08-11 01:04:40
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

{% asset_img   k8sInterface.jpg  Kubenetes开放接口  %}


<div style="text-align: center;">
![k8s-interface](https://user-images.githubusercontent.com/5608425/65022324-51455a00-d963-11e9-9338-26675af8d3b7.JPG)  Kubenetes开放接口
![flannel-udp](https://user-images.githubusercontent.com/5608425/65022322-50acc380-d963-11e9-8476-5e5ab22c8b4c.JPG)  flannel-udp模式
![flannel-vxlan](https://user-images.githubusercontent.com/5608425/65022323-51455a00-d963-11e9-9442-d4f1b84ecce5.JPG)  flannel-vxlan模式
</div>


## 参考:

1. [CNI (Container Network Interface)](https://feisky.xyz/kubernetes-handbook/network/cni/)
2. [容器开放接口规范（CRI OCI CNI）](https://www.jianshu.com/p/62e71584d1cb)
3. [CRI - Container Runtime Interface（容器运行时接口）](https://jimmysong.io/kubernetes-handbook/concepts/cri.html)
4. [为Kubernetes选择合适的容器运行时](https://mp.weixin.qq.com/s/sshrTSsUfqjja6g4-Lb42g)
5. [calico网络原理及与flannel对比](https://blog.csdn.net/hxpjava1/article/details/79566192)
6. [Kubernetes CNI网络最强对比：Flannel、Calico、Canal和Weave](https://mp.weixin.qq.com/s/GQc8XPV4MaCWiTcN2wVzbw)
7. <<深入剖析Kubernetes - 09  从容器到容器云：谈谈Kubernetes的本质>> 张磊
8. <<趣谈网络协议 - 30容器网络之Flannel：每人一亩三分地>> 刘超
9. <<趣谈网络协议 - 31容器网络之Calico：为高效说出善意的谎言>> 刘超
10. <<深入剖析Kubernetes - 33  深入解析容器跨主机网络>> 张磊
11. <<深入剖析Kubernetes -34  Kubernetes网络模型与CNI网络插件>>  张磊

