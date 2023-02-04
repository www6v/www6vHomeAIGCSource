---
title: gRPC
date: 2022-03-21 09:43:56
tags:
  - 异步
categories:
  - 分布式 
  - 基础
  - rpc  
---

<p></p>
<!-- more -->


## gRPC
##### 通信[1]
+ 基于HTTP2连接，发送消息
+ protobuf做消息序列化

##### HTTP2 [2]
+ 优点
  + 头部压缩、多路复用   
  + stream,  frame

###### gRPC的通信模式[1] 
+ 一元RPC模式
+ 服务端 流式RPC模式
+ 客户端 流式RPC模式
+ 双向流RPC模式

## 参考
1. [IT老齐的gRPC实战课](https://space.bilibili.com/359351574/channel/collectiondetail?sid=412936)
2. 《透视HTTP协议》《33 | 我应该迁移到HTTP/2吗？》

