---
title: 性能优化总结
date: 2018-11-21 12:11:33
tags: 
  - 基础
  - 性能
  - 性能优化
categories: 
  - 性能  
  - 总结
---

<p></p>
<!-- more -->

关键词： 锁优化，池化，数据库优化，架构优化， 系统优化，性能测试， 监控 

{% asset_img performance.jpg 性能优化总结 %}

{% asset_img performance2.jpg 性能优化总结 %}

## 一. 连接池优化
### 1. 分类 
 数据库连接池， redis连接池， http连接池

### 2. 数据库连接池： 
+ 最小连接数， 最大连接数
   建议**最小连接数控制在 10 左右**，**最大连接数控制在 20～30 左右**
+ 连接的可用性   
   使用连接发送**“select 1”**的命令给数据库看是否会抛出异常，如果抛出异常则将这个连接从连接池中移除，并且尝试关闭.

### 3. 线程池
+ JDK线程池
重要参数： **coreThreadCount** 和 **maxThreadCount**，

{% asset_img jdk-threadpool.PNG JDK线程池 %}

+ Tomcat线程池
Tomcat 使用的线程池就不是 JDK 原生的线程池，而是做了一些改造，**当线程数超过 coreThreadCount 之后会优先创建线程，直到线程数到达maxThreadCount**，这样就比较适合于 Web 系统**大量 IO 操作的场景**了。

+ 最佳实践
大量的任务堆积会占用大量的内存空间，一旦内存空间被占满就会**频繁地触发 Full GC**，造成服务不可用，我之前排查过的一次 GC 引起的宕机，起因就是系统中的一个**线程池使用了无界队列**.

## 参考：
1. [高性能高并发系统的稳定性保障](http://dwz.cn/4SrP4L) 京东
2. [Linux性能优化实战](https://time.geekbang.org/column/intro/140)  极客时间
3. [性能测试应该怎么做？](https://coolshell.cn/articles/17381.html) 
4. [稳定性总结](../../../../2017/05/09/stability/) self
5. [关于容量预估/性能压测的思考](http://blog.jobbole.com/88958/)
6. [稳定性总结](../../../../2017/05/09/stability/)  self
7. [<<性能之巅：洞悉系统、企业与云计算  Brendan Gregg>>](http://item.jd.com/11755695.html)
8. [性能调优攻略](https://coolshell.cn/articles/7490.html/comment-page-1) good
9. [线程池最佳线程数](../../../../2014/07/02/threadNum/)  self
10. [每个程序员都应该收藏的算法复杂度速查表](http://www.codeceo.com/article/algorithm-complexity-table.html)
11. [《编程珠玑 第2版》 Jon Bentley](http://item.jd.com/11642529.html)
12. [wordcount设计与优化](https://yq.aliyun.com/articles/25487)  竞赛题
13. [mysql](../../../../2019/09/10/mysql/) self 索引优化， 锁的优化   未
14. [Nginx优化](../../../../2020/03/26/nginxOptimize/)  self 未
15. [高并发系统设计40问 - 07 | 池化技术：如何减少频繁创建数据库连接的性能损耗？]() 唐扬
