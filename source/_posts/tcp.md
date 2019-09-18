---
title: TCP总结
date: 2015-04-25 14:59:29
tags: 
  - 网络
  - TCP
categories: 
  - 分布式
  - 网络
  - TCP   
---

{% asset_img  tcp-base.jpg  TCP基础总结 %}
{% asset_img  tcp-optimize.jpg  TCP优化 %}

<!-- more -->

<div style="text-align: center;">
![图1.TCP三次握手](https://user-images.githubusercontent.com/5608425/65186269-e2b7e780-da9b-11e9-926f-ea186bb3282a.jpg)   
图1.TCP三次握手

![图2.TCP四次挥手](https://user-images.githubusercontent.com/5608425/65186267-e21f5100-da9b-11e9-9f92-3fcab8f30679.jpg)   
图2.TCP四次挥手

![tcp-sync-queue-and-accept-queue](https://user-images.githubusercontent.com/5608425/65186270-e3507e00-da9b-11e9-8419-bab1f09e35eb.jpg)  图3.全/半连接队列
</div>

## 参考:

1. java socket参数详解:TcpNoDelay huang_xw
2. [关于TCP 半连接队列和全连接队列 蛰剑](http://jm.taobao.org/2017/05/25/525-1/)
3. [就是要你懂 TCP 蛰剑](http://jm.taobao.org/2017/06/08/20170608/) 
4. [就是要你懂 TCP | 最经典的TCP性能问题 蛰剑](http://jm.taobao.org/2017/06/01/20170601/)  Nagle算法, delay ack
5. [就是要你懂 TCP | 通过案例来学习 MSS、MTU 蛰剑](http://jm.taobao.org/2017/07/27/20170727/)
6. Where do resets come from? MichaelPlatts [msft]
7. TCP的三次握手以及重置(Reset) 赵帅强
8. 【剖析 | SOFARPC 框架】系列之连接管理与心跳剖析 SOFARPCLab
9. 蚂蚁金服通信框架SOFABolt解析 | 编解码机制 SOFABoltLab水寒
10. 《趣谈网络协议 - 第11讲 TCP协议（上）：因性恶而复杂，先恶后善反轻松》  刘超
11. 《 Linux性能优化实战 - 40 - 案例篇：网络请求延迟变大了，我该怎么办？》 倪朋飞
12. [Kubernetes 网络疑难杂症排查分享](https://tencentcloudcontainerteam.github.io/2019/08/12/troubleshooting-with-kubernetes-network/)   腾讯云容器团队
13. [TCP 的那些事儿（上）](https://coolshell.cn/articles/11564.html)

