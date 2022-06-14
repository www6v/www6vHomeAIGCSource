---
title: Linux总结
date: 2019-08-22 15:46:10
tags:
  - linux
categories:
  - linux
  - kernel 
  - 总结  
---

<p hidden></p>
<!-- more -->

关键字: 内核, 系统调用

<div style="text-align: center;">

![内核体系结构](https://user-images.githubusercontent.com/5608425/63564514-e5f0ae00-c597-11e9-9d32-985d0771c207.png) 内核体系结构

![系统调用](https://user-images.githubusercontent.com/5608425/63564517-e721db00-c597-11e9-86eb-2e5d502a2c52.jpg)  系统调用

![进程执行](https://user-images.githubusercontent.com/5608425/63564515-e6894480-c597-11e9-90c2-eba751ad0c08.jpg) 进程执行



</div>

## 一. 内核初始化
+ Systemd 1号进程在用户态将运行一个用户进程, 1号进程和子进程形成一棵进程树。
+ 内核态2号进程： 使用 kernel_thread 函数创建进程。  线程 == 轻量级进程
  

## 三. 进程间通信

+ 管道，命令行中常用的模式
+ 消息队列其实很少使用，因为有太多的用户级别的消息队列，功能更强大。
+ 共享内存加信号量是常用的模式。这个需要牢记，常见到一些知名的以C语言开发的开源软件都会用到
它。
+ 信号更加常用，机制也比较复杂。


## 四. Map
{% asset_img  kernelMap.jpg  kernel %}

## 参考：
+ [趣谈Linux操作系统 - 03 你可以把Linux内核当成一家软件外包公司的老板]()   刘超
+ [趣谈Linux操作系统 - 08_内核初始化：生意做大了就得成立公]()    刘超
+ [趣谈Linux操作系统 - 10_进程：公司接这么多项目，如何管]()   刘超
+ [趣谈Linux操作系统 - 36-进程间通信：遇到大项目需要项目组之间的合作才行]() 刘超









 
