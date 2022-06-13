---
title: Netty总结
date: 2015-08-23 17:56:48
tags:
  - 中间件
  - 网络
  - Netty
categories:
  - 分布式 
  - 服务治理
  - Netty    
---

<p></p>
<!-- more -->

{% asset_img  nettySummary.jpg  Netty总结 %}


## netty的粘包和拆包
类型 |  实现
:-:|:-:
固定长度解码器  |   使用FixedLengthFrameDecoder
自定义字符进行分隔  |  使用DelimiterBasedFrameDecoder
自定义长度  |  进行长度字段解码，就是消息体传了消息的长度 <br> LengthFieldBasedFrameDecoder和LengthFieldPrepender结合

## 参考 :

### 线程模型

1. Netty源代码
2. Netty源码分析之NioEventLoop 占小狼
3. Netty案例集锦之多线程篇(续) 李林锋
4. Netty案例集锦之多线程篇 李林锋
5. Netty系列之Netty线程模型 李林锋
6. Netty精粹之基于EventLoop机制的高效线程模型 Float_Luuu
7. Netty系列之Netty可靠性分析 李林锋
8. 实例浅析epoll的水平触发和边缘触发，以及边缘触发为什么要使用非阻塞IO yuuyuu
9. Netty高性能编程备忘录(上) 江南白衣

### ByteBuf & zerocopy
1. Netty源代码
2. netty系列之netty高性能之道 李林锋
3. 《Netty权威指南》 第15章 李林锋
4. [对于 Netty ByteBuf 的零拷贝(Zero Copy) 的理解](https://www.cnblogs.com/xys1228/p/6088805.html)  xys1228
5. jvm堆外直接内存实现高性能接入层 天空的蜗牛

### Plain NIO
1. 《Netty in Action》 第4章 [PlainNioServer](https://github.com/www6v/netty-in-action-cn/blob/ChineseVersion/chapter4/src/main/java/nia/chapter4/PlainNioServer.java)

### 粘包和拆包
[通过大量实战案例分解Netty中是如何解决拆包黏包问题的？](https://baijiahao.baidu.com/s?id=1716387532053553497&wfr=spider&for=pc)
[netty解决拆包粘包的三种方案](https://blog.csdn.net/wwwzhouzy/article/details/119154039)
