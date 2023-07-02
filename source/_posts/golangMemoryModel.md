---
title: Golang Rumtime-内存模型
date: 2022-06-21 03:55:05
tags:
  - Golang
categories:
  - Golang  
  - 内存模型
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 系统内存管理[4]
+ 三个角色 
  + Mutator [App]
  + Allocator
    - Bump/Sequential  Allocator
    - Free List Allocator
      - First-Fit
      - Next-Fit
      - Best-Fit
      - Segregated-Fit
        工业界用的多, golang是这种类型的变种
  + Collector  #2

+ 栈内存管理
  - malloc
    + '<128KB'  
      program break
    + '>=128KB' 
      mmap 


# Golang内存 
### 内存分配 [4][5]
+ 三种类型
  - Tiny
  - Small
  - Large
+ google tcmalloc
  每个线程维护一个独立的内存池
+ 多级别管理
  4K， 8K， 16K ...
+ 回收内存
  放回预先分配的大块内存中
+ **内存管理组件**
  - mspan
    - 68个规格， [8个字节...32K]
    - 双向链表
  - mcache 线程缓存 
    + alloc
    + tiny
    + tinyoffset
  - mcentral 管理全局的mspan供所有线程使用
    + noneempty
      - mspan
    + empty
      - mspan
  - mheap 管理动态分配内存, 持有的整个堆空间
    + arenas
    + central  
  - 多级结构
    mcache -> mcentral -> mheap
    
### 内存逃逸 [6]
+ 编译器会根据变量是否被外部引用来决定是否逃逸：
    - 如果函数外部没有引用，则优先放到栈中；
    - 如果函数外部存在引用，则必定放到堆中;
    - 如果栈上放不下，则必定放到堆上;

### 内存泄漏 
+ 根因 [7][8]
  - goroutine泄漏
  - slice造成内存泄漏
    原因 - 浅拷贝
  - time.Ticker造成内存泄漏
    原因 - 没关闭timer
  - cgo引起的内存泄漏
    线程个数
    
  
+ **常规分析手段** [8]
  可以利用pprof对程序进行分析从而定位内存泄漏地址

### 堆和栈

### 垃圾回收器 [9] #2
 Go语言的GC使用了**标记(mark)—清除(sweep)**技术

# 系统结构 [1]
### 现代计算机的多级存储结构
+ cacheline

### 多核带来的问题 
+ 单变量的并发操作也必须用同步手段,  比如atomic
+ 全局视角下观察到的多变量读写的顺序 可能会乱序

### 单变量  [2]
单变量的原子读/写,   多核使用MESI协议保证正确性

### 多变量 
+ 问题
  乱序执行  内存重排
  
+ 解决方案
  Memory barrier   

### false sharing  [3]
因为CPU处理读写是以cache line为单位, 所以在并发修改变量时,  会一次性将其他CPU Core中的cache line invalidate 掉, 导致未修改的内存上相邻的变量也需要同步,  带来额外的性能负担

### Happen-before 

# 参考
1. 《15 辅导 + 案例分析 + 答疑-更多课程》  体系课_Go高级工程师实战营(完结)  ***
2. [MESI](https://www.scss.tcd.ie/Jeremy.Jones/VivioJS/caches/MESIHelp.htm)
3. {% post_link 'falseSharing' %}  self
4. 《13 Go 语言的内存管理与垃圾回收》 体系课_Go高级工程师实战营(完结) 
5.  [1.Go 内存分配机制？](https://www.golangroadmap.com/class/gointerview/8-1.html#%E8%AE%BE%E8%AE%A1%E6%80%9D%E6%83%B3) 
6.  [2.Go 内存逃逸机制？](https://www.golangroadmap.com/class/gointerview/8-2.html#%E6%A6%82%E5%BF%B5)
7.  [浅谈Golang内存泄漏](https://cloud.tencent.com/developer/article/2134737)  code in git
8.  [golang：快来抓住让我内存泄漏的“真凶”！](https://cloud.tencent.com/developer/article/2279678)  cgo引起的内存泄漏+常规分析手段
9.  [Go 垃圾回收器指南](https://colobu.com/2022/07/16/A-Guide-to-the-Go-Garbage-Collector/) 
100. {% post_link 'javaMemoryModel' %} self
