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



## 目录
<!-- toc -->

## Rumtime [3]
### Scheduler
GMP
### Netpoll
### Memory
### GC

## 基础
##### New vs Make
+ new和make是内置函数,主要用来分配内存空间
+ make
  make 仅用于 slice、map和 channel 的初始化，返回值为类型本身，而不是指针
+ new 
    只用于内存分配，且把内存清零
    返回一个指向对应类型零值的指针
    new() 一般 显示返回指针

```Golang
func make(t Type, size ...IntegerType) Type 
func new(Type) *Type 
```

[9.Go 内置函数make和new的区别？](https://www.golangroadmap.com/class/gointerview/1-9.html)

##### array和slice
+ 数组长度是固定的， slice长度是可变的 
  
##### slice底层实现

```Golang
type slice struct {
    array unsafe.Pointer
    len   int
    cap   int
}
```

[1.Go slice的底层实现原理?](https://www.golangroadmap.com/class/gointerview/2-1.html)


##### 值传递、引用传递
+ Go语言中所有的传参都是**值传递（传值），都是一个副本，一个拷贝**。
+ 是否可以修改原内容数据，和传值、传引用没有必然的关系。在C++中，传引用肯定是可以修改原内容数据的，在Go语言里，虽然只有传值，但是我们也可以修改原内容数据，因为参数是引用类型
+ 引用类型和引用传递是2个概念，切记！！！

+ **类型**
  + 非引用类型（int、string、struct等这些）
  + 引用类型（指针、map、slice、chan等这些）

+ **值传递**
  - 将实参的值传递给形参，形参是实参的一份拷贝，实参和形参的内存地址不同。函数内对形参值内容的修改，是否会影响实参的值内容，取决于参数是否是引用类型
  - 参数如果是非引用类型（int、string、struct等这些），这样就在函数中就无法修改原内容数据；如果是引用类型（指针、map、slice、chan等这些），这样就可以修改原内容数据。  
+ 引用传递
  Go语言是没有引用传递的 
  在C++中，函数参数的传递方式有引用传递

[Go 函数参数传递到底是值传递还是引用传递？](https://www.golangroadmap.com/class/gointerview/1-7.html)  

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

## 异常处理 [4]


## 参考
1. [GOLANG ROADMAP](https://www.golangroadmap.com/class/gointerview/)
    [GOLANG ROADMAP](https://www.golangroadmap.com/)  
    邀请码：caspar 
    邀请码：Gopher-10645-1382
2. 极客时间 《Go 并发编程实战课》  鸟窝
3. 《04 Go 程序是怎么跑起来的》
4. [【go实战系列五】 go1.19.2与pkg中error如何wrap与unwrap Errors | 将error进行wrap向上处理思想 | pkg/errors](https://blog.csdn.net/wanglei19891210/article/details/128092331)





