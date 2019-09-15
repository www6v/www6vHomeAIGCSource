---
title: Linux zero copy
date: 2019-09-14 20:35:29
tags:
  - 云计算
categories:
  - linux 
  - zero-copy
---

<!-- more -->

> 零拷贝就是一种避免 CPU 将数据从一块存储拷贝到另外一块存储的技术

> 零拷贝包括三种方式： 
+ mmap()
 <<深入理解计算机系统>>mmap定义为：Linux通过将一个虚拟内存区域与一个磁盘上的对象(object)关联起来，以初始化这个虚拟内存区域的内容，这个过程称为内存映射(memory mapping)。
+ sendfile() -> Java transferTo();
+ DMA 

<div style="text-align: center;">
<img width="454" alt="mmap概念" src="https://user-images.githubusercontent.com/5608425/64915067-0aa00600-d791-11e9-9aae-6e4832a279af.png"> mmap概念

![12605489-b5b0f3d90c6baa8f](https://user-images.githubusercontent.com/5608425/64915187-57391080-d794-11e9-95e5-012e92b674ee.png)
mmap

![mmap+write](https://user-images.githubusercontent.com/5608425/64915198-b3039980-d794-11e9-8729-3452941cfc0d.jpg)
利用 mmap 代替 read  ==  mmap + write
</div>

## 参考：
原理
1. [零拷贝-zero copy](https://www.cnblogs.com/AaronCui/p/10528046.html)
2. [Efficient data transfer through zero copy](https://developer.ibm.com/articles/j-zerocopy/) good transferTo()
3. [Zero Copy I: User-Mode Perspective](https://www.linuxjournal.com/article/6345)   good
4. [Linux 中的零拷贝技术，第 1 部分](https://www.ibm.com/developerworks/cn/linux/l-cn-zerocopy1/)
5. [Linux 中的零拷贝技术，第 2 部分](https://www.ibm.com/developerworks/cn/linux/l-cn-zerocopy2/)
6. [Linux 中直接 I/O 机制的介绍](https://www.ibm.com/developerworks/cn/linux/l-cn-directio/)  good
7. [理解mmap](https://cloud.tencent.com/developer/article/1145377)
8. [[原创] 深入剖析mmap-从三个关键问题说起](https://www.jianshu.com/p/eece39beee20)

应用
7. [Kafka Zero-Copy 使用分析](https://blog.csdn.net/allwefantasy/article/details/50663533)  transferTo()
8. [linux零拷贝原理，RocketMQ＆Kafka使用对比](https://cloud.tencent.com/developer/news/333695)
9. [RocketMQ入门（上）](http://www.uml.org.cn/zjjs/201504011.asp)