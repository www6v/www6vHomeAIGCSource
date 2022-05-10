---
title: Reactive
date: 2021-05-10 10:24:41
tags:
  - 异步
categories:
  - 分布式 
  - 服务治理
  - 异步化   
---

<p></p>
<!-- more -->



## Reactive




##### Akka && Actor 
/ | Responsive | Resilient | Elastic | Message Driven
:-: | :-: | :-: | :-: | :-: |
Akka  | Actor and Stream | Supervisor策略 | Load balance and adptive routing（dispatcher）| mail-box, private State， backpressure


+ Actor 允许的操作
   - create Actor
   - Send message
   - desigate how to handle the next message


+ Actor Message：
Simple，Immutable data structures


+ Actor 
Actors process only one message at a time


+ Actor 类型：
Local actor
Remote actor

+ 哪些系统在用Akka
Flink， 
spark 2.0从Akka迁移到Netty
play framework（web）


## 参考：
[5分钟理解分布式架构Actor模型](https://www.bilibili.com/video/BV13e411W7kX?spm_id_from=333.1007.top_right_bar_window_history.content.click)
[The Reactive Manifesto](https://www.reactivemanifesto.org/)