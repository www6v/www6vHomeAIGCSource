---
title: Redis数据结构
date: 2021-05-05 22:25:55
tags:
  - 中间件
  - 存储
  - Redis
categories: 
  - 分布式
  - 存储
  - Redis
---

<p></p>
<!-- more -->


## 数据结构和实现

![redis 数据结构](redisDataStructure.png)

---

 数据结构	  | 基础	  |  优化  | 特点   
 :-: | :-:     | :-:  |  :-:
 String	| SDS| |
 List | 双向列表 | 压缩列表 |
 Hash | hash表  | 压缩列表 |  渐进式rehash
 SortedSet | 跳表 | 压缩列表 |
 Set | 整数数组 | |

---

![数据结构的时间复杂度](Complex.png)


## 全局hash表 && 渐进式 rehash
![全局Hash表](globalHash.png)


## 参考：
02 | 数据结构:快速的Redis有哪些慢操作?