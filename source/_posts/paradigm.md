---
title: 范式 Paradigm
date: 2020-11-08 17:34:42
tags:
  - 范式
categories: 
  - 范式   
---

<p></p>
<!-- more -->

## 语言范式
#### 面向对象

#### 函数式
1. 成熟度 
Clojure
Scala，Java， Javascript

2. Function is First Class
闭包;
高阶函数;
柯里化： Scala的柯里化
部分施用 partial：Scala的部分施用
【更加接近人的语言】

3. 并行
Java Lamda，Java Stream
Spark算子（基本构造单元）

4. 效率
Scala的效率生产率是Java的2-3倍，
Scala 10行代码Java要20-30行

#### 面向过程

【用了面向对象语言写出的不一定是面向对象的代码】


## 语言编程范式
#### 传引用
JAVA（native）, C++指针

#### 传值
Java的clone浅拷贝 vs 深拷贝 ，
C++拷贝构造

#### 所有权
Rust， 
C++ move所有权

## 语言编程范式
#### 命令式
#### 申明式
Spring Annotation 申明式
K8S yaml 申明式

## 并发范式 
#### 多线程 +锁
Java

#### CSP 协程
Golang，Rust，  
C++， Python， Lua
Java协程框架

#### Actor
Scala
Akka

#### 函数式

#### 分离标识与状态
Clojure

#### Future + Promise

## 流范式 Stream
#### 大数据流
Lamda架构

#### HTTP2 流， TCP-Stream

#### Pipeline 
CPU流水线


## 复制范式 Replication
#### 主从
MySQL
#### 多主
Git
#### 无主
Cassandra

#### Kafka ISR
原理上是主从，但是从延迟太大会被踢出ISR


## 数据存储和处理
#### OLTP
MYSQL

#### OLAP
HADOOP

#### HATP（A，T）
TiDB， TiKV(行存)， Tiflash（列存）







