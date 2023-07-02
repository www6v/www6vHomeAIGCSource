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

# Rumtime [3]
### Scheduler
GMP
### Netpoll
### Memory
### GC

# 基础
### 内建函数
+ init
  - make()
  - new()
+ slice  
  - append()
    用于切片(slice) 追加元素
  - copy()
    只能用于数组切片内容赋值
+ size 
  - len()
   计算数组(包括数组指针)、切片(slice)、map、channel、字符串等数据类型的长度
  - cap()
   返回指定类型的容量
+ print() & println()
+ resource reclaim
  - close()
  - delete()
+ num
  - complex()
  - real() & imag()
+ error handle
  - panic()
  - recover()
+ others [6]
  - clear()   
   对于map对象: clear函数清空map对象的所有的元素
   对于slice对象： clear函数将所有的元素设置为元素类型的零值，长度不变，容量不变
  - min()  &&  max()

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

### array和slice
+ 数组长度是固定的， slice长度是可变的 
  
### slice底层实现

```Golang
type slice struct {
    array unsafe.Pointer
    len   int
    cap   int
}
```

[1.Go slice的底层实现原理?](https://www.golangroadmap.com/class/gointerview/2-1.html)


### 值传递、引用传递
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

###  select vs. switch  
+ select只能应用于channel的操作
  则会随机选取其中一个满足条件的分支
+ switch 分支是顺序执行的

### Method &  Function
+ Method
方法(Method)是一个带有receiver的函数Function
+ Receiver[5]

### 异常处理 [4]

## 参考
1. [GOLANG ROADMAP](https://www.golangroadmap.com/class/gointerview/)
    [GOLANG ROADMAP](https://www.golangroadmap.com/)  
    邀请码：caspar 
    邀请码：Gopher-10645-1382
2. 极客时间 《Go 并发编程实战课》  鸟窝
3. 《04 Go 程序是怎么跑起来的》
4. [【go实战系列五】 go1.19.2与pkg中error如何wrap与unwrap Errors | 将error进行wrap向上处理思想 | pkg/errors](https://blog.csdn.net/wanglei19891210/article/details/128092331)
5. [golang 方法接收者](https://zhuanlan.zhihu.com/p/522568859)  mycode-go
6. [你知道吗？Go新增加了三个内建函数 ](https://colobu.com/2023/05/28/go1-21-whats-new-builtin/)





