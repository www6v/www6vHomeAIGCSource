---
title: 垃圾收集GC总结
date: 2014-07-16 14:05:43
tags:
  - gc
categories: 
  - Java基础
  - 内存
  - gc      
---

<p></p>
<!-- more -->

{% asset_img  gc.jpg  垃圾收集GC总结 %}



### 并发标记算法
1. CMS： 三色标记算法 + 增量更新（Incremental update）
2. G1： 三色标记算法 + STAB（snapshot-at-the-beginning）
[Java虚拟机 ----三色标记与G1垃圾回收器](https://blog.csdn.net/qq_36697880/article/details/105206385)

## 参考：

1. 源码分析：Java对象的内存分配   iceAeterna
2. 《深入理解Java虚拟机（第2版）》 第3章   周志明
3. 深入理解GC ——MinorGC\MajorGC\FullGC   张硕的博客
4. 触发JVM进行Full GC的情况及应对策略   yexx
5. Netty之有效规避内存泄漏   江南白衣
6. [周期性Full GC的异常排查](https://yq.aliyun.com/articles/72217)  weiplex
7. 一个大对象引起的血案，GC的踩坑实录   何锦彬
8. [生产环境下持久带满导致FullGC，如何跟踪](https://hllvm-group.iteye.com/group/topic/28379) 
9. [又是一个程序员粗心的代码引起频繁FullGC的案例](https://www.jianshu.com/p/f92c190f7dec) 微信公众号里的  
10. JVM初探- 使用堆外内存减少Full GC   菜鸟-翡青
11. [我遇到tomcat 7 full gc频繁的问题](https://www.iteye.com/blog/auzll-1904081)  auzll
12. [一次堆外OOM问题的排查过程](https://mp.weixin.qq.com/s/xICP6icb3mpj0lvj9zYbiw)  谢照东   占小狼的博客
13. 美团三面：一个线程OOM，进程里其他线程还能运行么？    孤独烟 Java技术驿站
14. [netty 堆外内存泄露排查盛宴](https://tech.meituan.com/2018/10/18/netty-direct-memory-screening.html)   闪电侠的博客  netty的bug
15. [线上故障排查(2) - Java应用故障之堆溢出OOM问题及排查方案](https://blog.csdn.net/fenglibing/article/details/82692169)  冯立彬 未


