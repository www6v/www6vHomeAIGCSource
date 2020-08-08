---
title: TCP故障模式
date: 2020-08-08 23:17:36
tags:
  TCP
---

<p hidden></p>
<!-- more -->

## 一. 故障模式

### 对端无FIN包发送
+ 网络中断
  read **TIMEOUT**（setsockopt）
  先write再read， 持续重传直至**TIMEOUT**。 之后再**write()**， 返回**SIGPIPE信号（Broken Pipe）**。
  write Unreachable
+ 系统奔溃（如断电）
  read()或者write()持续重传直至**TIMEOUT**
  对端重启，read()或者write()返回RST。 **read（）**调用返回**Connection Reset**。**write()**返回**SIGPIPE信号（Broken Pipe）**。

### 对端有FIN包发送（如程序奔溃）
+ read直接感知FIN  
+ 没有read
  如果不read没办法得到TCP对端的响应.

  通过write()产生RST， **read（）**感知**RST（Connection reset by peer）**。 
  {% asset_img tcp-write-read.JPG   %}

  **向一个关闭连接连续写导致SIGPIPE信号（Broken Pipe）**。
  {% asset_img tcp-write.JPG   %}

## 二. Java对应的错误  

### java.net.SocketTimeoutException


### java.net.SocketException: Connection reset/Connect reset by peer: Socket write error
指连接被重置。这里有两种情况，分别对应两种错误：第一种情况是通信的一方已经将Socket 关闭，可能是主动关闭或者是因为异常退出，
这时如果通信的另一方还在**写数据**，就会触发这个异常**（Connect reset by peer）**；
如果对方还在尝试从 TCP 连接中**读数据**，则会抛出 **Connection reset** 异常。

> 为了避免这些异常发生，在编写网络通信程序时要确保：
程序退出前要主动关闭所有的网络连接。
检测通信的另一方的关闭连接操作，当发现另一方关闭连接后自己也要关闭该连接。

### java.net.SocketException: Broken pipe
指通信管道已坏。发生这个异常的场景是，通信的一方在**收到“Connect reset by peer:Socket write error”后**，如果再继续**写数据**则会抛出 **Broken pipe** 异常，解决方法同上。


## 参考:
1. [网络编程实战进 - 17 | TCP并不总是“可靠”的？]() 盛延敏   操作系统的视角
2. [深入拆解Tomcat & Jetty -  38 | Tomcat拒绝连接原因分析及网络优化]() 李号双  Java的视角