---
title: Java多线程中的取消和关闭
date: 2014-04-09 11:20:13
tags: 
  - 多线程
categories: 
  - Java基础
  - 多线程  
---

<p></p>
<!-- more -->

- 取消和关闭
  - 基础
    - 中断状态
    - 中断请求
    - 取消点
  - 任务取消
    - 取消策略（how/when/what）
      - how/when
        - volatile的取消状态+非阻塞方法(正确)
        - volatile的取消状态+阻塞方法(错误)
        - 中断的状态显示的检查（正确）.Thread.currentThread().isInterrupted()
      - what, 中断策略（如何响应中断请求）
        - InterruptedException传递给调用者，捕获后恢复中断的状态，Thread.currentThread().interrupted().
        - 封装成shutdown方法
        - 通过Future.cancel来取消任务
          - 中断当前线程
        - 阻塞函数
          - 抛出InterruptedException
          - Thread.isInterrupted()返回false
          - eg. Object的wait(),Thread的join(),sleep()
        - IO上的阻塞
          - BIO
            - Socket读写网络
            - JDBC驱动MySQL-connector-java
          - nio
            - InterruptibleChannel
              - InterruptibleChannel将被关闭
              - 抛出ClosedByInterruptException
              - Thread.isInterrupted()返回true
            - Selector
              - Selector#select()方法将立即返回
              - 不会抛出异常
              - Thread.isInterrupted()返回true
  - 服务取消
    - 生命周期方法
      - start()
      - stop()
    - ExceuteService.shutDown()/shutDownNow()
    - 致命药丸(akka的Poison Pill)  
  - 锁中断
    - 不可中断 
      - 内部锁synchronized, ReentrantLock.lock()
    - 可中断
      - 显示锁ReentrantLock.tryLock()，.lockInterruptibly()
