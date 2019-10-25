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

Tcp五元组: 源ip, 源port, 目的ip, 目的port, 协议

<!-- more -->

## 一.  TCP Keep-Alive 
【TCP Keep-Alive】 |  基础  |  并行请求
-|-|-
HTTP1.1|Connection  Header <br>[Connection: keep-alive<br>Connection: close] | 1. 浏览器默认不开启 HTTP Pipelining, 不可行(一个TCP连接中的多个并行HTTP请求) <br> 2. 一个 HOST 上建立多个 TCP 连接,Chrome 最多允许对同一个 Host 建立六个 TCP 连接
HTTP2.0| HTTP2是在HTTPS上实现的 |  HTTP2的Multiplexing多路传输特性， 可行


	
## 二. TCP 握手、挥手

<div style="text-align: center;">
![图1.TCP三次握手](https://user-images.githubusercontent.com/5608425/65186269-e2b7e780-da9b-11e9-926f-ea186bb3282a.jpg)   
图1.TCP三次握手

![图2.TCP四次挥手](https://user-images.githubusercontent.com/5608425/65186267-e21f5100-da9b-11e9-9f92-3fcab8f30679.jpg)   
图2.TCP四次挥手

![tcp-sync-queue-and-accept-queue](https://user-images.githubusercontent.com/5608425/65186270-e3507e00-da9b-11e9-8419-bab1f09e35eb.jpg)  图3.全/半连接队列
</div>

## 参考:

1. [java socket参数详解:TcpNoDelay](https://blog.csdn.net/huang_xw/article/details/7340241) huang_xw  
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
14. [面试官问我：一个 TCP 连接可以发多少个 HTTP 请求？我竟然回答不上来...](https://mp.weixin.qq.com/s?__biz=MzUyOTk5NDQwOA==&mid=2247486314&idx=2&sn=2bd0223856ce7c7cdc3114f55090fd2d&chksm=fa59ccadcd2e45bb3230029cdece65eeeca9446c4671b99f6627e5c237b44272d608cb0d2c7f&scene=0&xtrack=1#rd)
15. [为什么基于TCP的应用需要心跳包（TCP keep-alive原理分析）](http://hengyunabc.github.io/why-we-need-heartbeat/)

