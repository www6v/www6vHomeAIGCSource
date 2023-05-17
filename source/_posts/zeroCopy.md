---
title: Linux zero copy-零拷贝
date: 2019-09-14 20:35:29
tags:
  - 云计算
categories:
  - linux 
  - zero-copy
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 零拷贝
### 零拷贝
  就是一种避免 CPU 将数据从一块存储拷贝到另外一块存储的技术

### 零拷贝类型
  + mmap()
    <<深入理解计算机系统>>mmap定义为：Linux通过将一个虚拟内存区域与一个磁盘上的对象(object)关联起来，以初始化这个虚拟内存区域的内容，这个过程称为内存映射(memory mapping)。
  + sendfile() -> Java transferTo();

### mmap
+ mmap 内存映射 [4]
{%  asset_img  'mmap1.jpg'  %}

+ mmap 内存映射 [5]
{%  asset_img  'mmap2.jpg'  %}

+ 利用 mmap 代替 read  ==  mmap + write [1][3]
{%  asset_img  'mmap.jpg'  %}

### sendfile [1][3]
{%  asset_img  'sendfile.jpg'  %}

### read + write(传统传输方式)  [1][3]
{%  asset_img  'read-write.jpg'  %}

## 总结: read+write vs. mmap vs. sendfile
|              | context switch次数 | 数据拷贝次数            |
| ------------ | ------------------ | ----------------------- |
| read + write | 4次                | 2次CPU copy+2次DMA copy |
| mmap + write | 4次                | 1次CPU copy+2次DMA copy |
| sendfile     | 2次                | 1次CPU copy+2次DMA copy |



# 参考

原理
1. [零拷贝-zero copy](https://www.cnblogs.com/AaronCui/p/10528046.html) *** 
2. [Efficient data transfer through zero copy](https://developer.ibm.com/articles/j-zerocopy/)
   sendfile减少了上下文切换次数，transferTo()  ***
3. [Zero Copy I: User-Mode Perspective](https://www.linuxjournal.com/article/6345)   ***
4. [理解mmap](https://cloud.tencent.com/developer/article/1145377)
5. [[原创] 深入剖析mmap-从三个关键问题说起](https://www.jianshu.com/p/eece39beee20)
6. {% post_link 'linuxMemory' %} self

---

已失效
100. [Linux 中的零拷贝技术，第 1 部分](https://www.ibm.com/developerworks/cn/linux/l-cn-zerocopy1/)  已失效
101. [Linux 中的零拷贝技术，第 2 部分](https://www.ibm.com/developerworks/cn/linux/l-cn-zerocopy2/)  已失效
102. [Linux 中直接 I/O 机制的介绍](https://www.ibm.com/developerworks/cn/linux/l-cn-directio/)     已失效  ***