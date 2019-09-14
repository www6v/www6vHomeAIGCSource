---
title: Linux zero copy
date: 2019-09-14 20:35:29
tags:
  - 云计算
categories:
  - linux 
  - zero-copy
---

> 零拷贝就是一种避免 CPU 将数据从一块存储拷贝到另外一块存储的技术

+ mmap()
+ sendfile() -> Java transferTo();
+ DMA 

<!-- more -->

## 参考：
原理
1. [零拷贝-zero copy](https://www.cnblogs.com/AaronCui/p/10528046.html)
2. [Efficient data transfer through zero copy](https://developer.ibm.com/articles/j-zerocopy/)
3. [Zero Copy I: User-Mode Perspective](https://www.linuxjournal.com/article/6345)
4. [Linux 中的零拷贝技术，第 1 部分](https://www.ibm.com/developerworks/cn/linux/l-cn-zerocopy1/)
5. [Linux 中的零拷贝技术，第 2 部分](https://www.ibm.com/developerworks/cn/linux/l-cn-zerocopy2/)
6. [Linux 中直接 I/O 机制的介绍](https://www.ibm.com/developerworks/cn/linux/l-cn-directio/)

应用
7. [Kafka Zero-Copy 使用分析](https://blog.csdn.net/allwefantasy/article/details/50663533)  transferTo()
8. [linux零拷贝原理，RocketMQ＆Kafka使用对比](https://cloud.tencent.com/developer/news/333695)
9. [RocketMQ入门（上）](http://www.uml.org.cn/zjjs/201504011.asp)