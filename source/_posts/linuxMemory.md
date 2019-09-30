---
title: Linux内存管理
date: 2019-08-23 15:38:18
tags:
  - linux
categories:
  - linux  
  - 内存管理 
---

<p hidden></p>
<!-- more -->

<div style="text-align: center;">
![进程空间管理-64位](https://user-images.githubusercontent.com/5608425/63573728-b00ff180-c5b8-11e9-9038-4cda1cd99148.jpg) 进程空间管理-64位

![NUMA架构下的物理内存管理](https://user-images.githubusercontent.com/5608425/63572472-873a2d00-c5b5-11e9-9253-5282537c00b2.JPG)    NUMA架构下的物理内存管理
</div>

 > Linux中的内存管理的“页”大小为4KB。把所有的空闲页分组为11个页块链表，每个块链表分别包含很多个大小的页块，有1、2、4、8、16、32、64、128、256、512和1024个连续页的页块。最大可以申请1024个连续页，对应4MB大小的连续内存。每个页块的第一个页的物理地址是该页块大小的整数倍。

<div style="text-align: center;">	
![用户态内存映射-MMAP](https://user-images.githubusercontent.com/5608425/63574111-9d49ec80-c5b9-11e9-8e74-42248f7b2757.jpg)   用户态内存映射-MMAP

![内核态内存映射](https://user-images.githubusercontent.com/5608425/63574862-58bf5080-c5bb-11e9-8fcc-f342ecbb7f76.jpg)  内核态内存映射
</div>


## 参考：

1. [趣谈Linux操作系统 - 22-进空间管理：项目组还可以自行布置会议室]()  刘超
2. [趣谈Linux操作系统 - 23-物理内存管理（上）：会议室管理员如何分配会议室？]()   刘超
3. [趣谈Linux操作系统 - 25-用户态内存映射：如何找到正确的会议室？]()  刘超
4. [趣谈Linux操作系统 - 26-内核态内存映射：如何找到正确的会议室？]()   刘超 
