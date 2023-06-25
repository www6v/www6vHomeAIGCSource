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

# 现代计算机的多级存储结构[1]
+ cacheline


# 多核带来的问题 [1]
+ 单变量的并发操作也必须用同步手段,  比如atomic
+ 全局视角下观察到的多变量读写的顺序 可能会乱序

# 单变量 [1][2]
单变量的原子读/写,   多核使用MESI协议保证正确性

# 多变量 [1]
+ 问题
  乱序执行  内存重排
  
+ 解决方案
  Memory barrier   

# false sharing [1][4]
因为CPU处理读写是以cache line为单位, 所以在并发修改变量时,  会一次性将其他CPU Core中的cache line invalidate 掉, 导致未修改的内存上相邻的变量也需要同步,  带来额外的性能负担

# Happen-before [1]

# 参考
1. 《15 辅导 + 案例分析 + 答疑-更多课程》  体系课_Go高级工程师实战营(完结)  ***
2. [MESI](https://www.scss.tcd.ie/Jeremy.Jones/VivioJS/caches/MESIHelp.htm)
3. {% post_link 'javaMemoryModel' %} self
4. {% post_link 'falseSharing' %}  self