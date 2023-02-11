---
title: Paper-The Tail at Scale
date: 2022-11-30 22:01:55
tags:
  - Distributed
categories:
  - Paper 
  - Distributed
---

<p></p>
<!-- more -->

## The Tail at Scale
+ 文章重点列了七种工程上的解决方案
  + hedged requests（最快请求），
  + tied requests（最快请求完成后取消其他请求），
  + micro-partition（微分区），
  + selectively increase replication factors（增加读分区），
  + put slow machines on probation（隔离慢速机器），
  + ‘good enough’ responses（不完美但是足够好的结果），
  + canary requests（试探性请求）


## 参考
[The Tail at Scale_ Achieving Rapid Response Times in Larg](https://v.youku.com/v_show/id_XNzIyMzMyMzEy.html)  ***

[[CACM2013] The Tail at Scale](https://zhuanlan.zhihu.com/p/562489856)