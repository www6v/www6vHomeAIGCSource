---
title: Golang基础-Slice
date: 2022-07-09 18:43:02
tags:
  - Golang
categories:
  - Golang  
  - 基础
---

<p></p>
<!-- more -->


### array和slice
+ 数组长度是固定的， slice长度是可变的 
  
### slice底层实现 [2]
```Golang
type slice struct {
    array unsafe.Pointer
    len   int
    cap   int
}
```

### slice 初始化 [1]
对于 make 来说，它可以初始化 slice 的 length 和 capacity，**如果我们能确定 slice 里面会存放多少元素，从性能的角度考虑最好使用 make 初始化好**，因为对于一个空的 slice append 元素进去每次达到阈值都需要进行**扩容**

### Code Example [1]

# 参考
1. [[长文]从《100 Go Mistakes》我总结了什么？](https://www.luozhiyun.com/archives/797)
   gExamples slice_test.go
2. [1.Go slice的底层实现原理?](https://www.golangroadmap.com/class/gointerview/2-1.html)