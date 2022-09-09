---
title: Golang 基础
date: 2022-03-08 23:07:50
tags:
  - Golang
categories:
  - Golang
  - 基础
---

<p></p>
<!-- more -->

## 基础
##### new vs Make
+ new和make是内置函数,主要用来分配内存空间
+ make
  make 仅用于 slice、map和 channel 的初始化，返回值为类型本身，而不是指针
+ new 
    只用于内存分配，且把内存清零
    返回一个指向对应类型零值的指针
    new() 一般 显示返回指针

##### array和slice
+ 数组长度是固定的， slice长度是可变的 
  
##### slice底层实现    
      
##### context

##### channel
+ channel的读写
  + 向关闭的channel中写入数据会panic
  + 关闭的channel中读数据
    有数据会读到数据，没数据会是nil  

+ buffer channel vs. 非buffered channel   

##### 值传递、引用传递（值引用，对象引用）  

##### select vs. switch  
+ select只能应用于channel的操作
  则会随机选取其中一个满足条件的分支
+ switch 分支是顺序执行的

## 内存 
##### 内存逃逸
+ 栈逃逸到了堆上[B栈有个面试题]

##### 内存泄漏
+ 可以利用pprof对程序进行分析从而定位内存泄漏地址

##### 堆和栈



