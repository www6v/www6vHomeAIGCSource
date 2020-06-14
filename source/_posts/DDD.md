---
title: DDD  领域驱动设计
date: 2020-05-22 09:54:58
tags:
  - DDD
  - 领域驱动设计
categories:
  - 分布式  
  - 架构  
  - DDD  
---

<p hidden>https</p>

<!-- more -->

## 目标：
+ DDD的精髓是降低**系统复杂度**
+ 规则

## 三个核心
1. 统一语言

+ 核心领域词汇表
+ 统一语言重构迭代： 模型-》实现-》 重构-》 隐喻 -》 再到模型
+ 命名规范
+ DSL - Domain Specific Language

2. 领域划分 
+ 边界上下文（Bounded Context）
+ 上下文映射（Context Mapping)
共享内核（Shared Kernel） 
防腐层（Anti-Corruption）： 类似adaptor、facade， 对内部领域模型的隔离和屏蔽。

3. 领域模型 
+ 抽象： 
  是从具体事物抽取、概括出它们共同的方面、本质属性与关系等。

+ 领域建模方法论：
  UML用例分析、 UML用例分析法
  四色建模法
  [事件风暴](https://www.eventstorming.com/)

## 落地
+ 基于DDD应用架构的核心：
  分离业务复杂度和技术复杂度

+ 分层
  Controller层
  Application层
  Domain层
  Infrastructure层



## 参考：
1. 《DDD（Domain Driven Design)的精髓》  直播+ppt  阿里张建飞  钉钉2020.05.21视频
2. 《领域驱动设计精粹》 未 
3. 《实现领域驱动设计》 未
4. 《领域专用语言实战》 未
5.  [事件风暴和领域建模在阿里巴巴的落地实践](https://developer.aliyun.com/live/2874)  未


