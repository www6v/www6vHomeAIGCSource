---
title: 垃圾收集GC总结
date: 2014-07-16 14:05:43
tags:
  - Java基础
  - gc
  - jvm
---

![垃圾收集GC总结](http://www6v.github.io/www6vHome/gc/gc.jpg "垃圾收集GC总结")

## 参考：

1. 源码分析：Java对象的内存分配   iceAeterna
2. 深入理解Java虚拟机（第2版） 第3章   周志明
3. 深入理解GC ——MinorGC\MajorGC\FullGC   张硕的博客
4. 触发JVM进行Full GC的情况及应对策略   yexx
5. Netty之有效规避内存泄漏   江南白衣
6. 周期性Full GC的异常排查   weiplex
7. 一个大对象引起的血案，GC的踩坑实录   何锦彬
8. 生产环境下持久带满导致FullGC，如何跟踪 https://hllvm-group.iteye.com/group/topic/28379
9. 又是一个程序员粗心的代码引起频繁FullGC的案例 微信公众号里的
10. JVM初探- 使用堆外内存减少Full GC 菜鸟-翡青
11. 我遇到tomcat 7 full gc频繁的问题 auzll
12. 一次堆外OOM问题的排查过程 谢照东 占小狼的博客
13. 美团三面：一个线程OOM，进程里其他线程还能运行么？ 孤独烟 Java技术驿站
14. netty 堆外内存泄露排查盛宴 super flash 闪电侠的博客


