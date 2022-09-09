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
##### New vs Make
+ new和make是内置函数,主要用来分配内存空间
+ make
  make 仅用于 slice、map和 channel 的初始化，返回值为类型本身，而不是指针
+ new 
    只用于内存分配，且把内存清零
    返回一个指向对应类型零值的指针
    new() 一般 显示返回指针

```
func make(t Type, size ...IntegerType) Type

func new(Type) *Type
```    
[9.Go 内置函数make和new的区别？](https://www.golangroadmap.com/class/gointerview/1-9.html)

##### array和slice
+ 数组长度是固定的， slice长度是可变的 
  
##### slice底层实现    
      
##### Context

##### channel
+ channel的读写
  + 向关闭的channel中写入数据会panic
  + 关闭的channel中读数据
    有数据会读到数据，没数据会是nil  

+ buffer channel vs. 非buffered channel  
/   |无缓冲 |	有缓冲
:-: |  :-: | :-:
创建方式 | make(chan TYPE) |	make(chan TYPE, SIZE)
发送阻塞 |	数据接收前发送阻塞 |	缓冲满时发送阻塞
接收阻塞 | 	数据发送前接收阻塞 |	缓冲空时接收阻塞 

[3.Go channel有无缓冲的区别？](https://www.golangroadmap.com/class/gointerview/4-3.html)

##### 值传递、引用传递（值引用，对象引用）  

##### select vs. switch  
+ select只能应用于channel的操作
  则会随机选取其中一个满足条件的分支
+ switch 分支是顺序执行的

## 内存 
##### 内存逃逸
+ 编译器会根据变量是否被外部引用来决定是否逃逸：
    - 如果函数外部没有引用，则优先放到栈中；
    - 如果函数外部存在引用，则必定放到堆中;
    - 如果栈上放不下，则必定放到堆上;
[2.Go 内存逃逸机制？](https://www.golangroadmap.com/class/gointerview/8-2.html#%E6%A6%82%E5%BF%B5)

##### 内存泄漏
+ 可以利用pprof对程序进行分析从而定位内存泄漏地址

##### 堆和栈

##### 内存分配
+ google tcmalloc
  每个线程维护一个独立的内存池
+ 多级别管理
  4K， 8K， 16K ...
+ 回收内存
  放回预先分配的大块内存中
+ 内存管理组件
  - mspan
    - 68个规格， [8个字节...32K]
    - 双向链表
  - mcache
    线程缓存 
  - mcentral
    管理全局的mspan供所有线程使用
  - mheap
    管理动态分配内存, 持有的整个堆空间
[1.Go 内存分配机制？](https://www.golangroadmap.com/class/gointerview/8-1.html#%E8%AE%BE%E8%AE%A1%E6%80%9D%E6%83%B3)    

## 参考
+ [GOLANG ROADMAP](https://www.golangroadmap.com/class/gointerview/)
  [GOLANG ROADMAP](https://www.golangroadmap.com/)  
  邀请码：caspar 






