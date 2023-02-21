---
title: MySQL事务-总结
date: 2015-02-21 14:44:33
tags:
  - mysql
categories:  
  - 数据库
  - 关系型
  - mysql
---

<p></p>
<!-- more -->

{% asset_img  transaction.jpg  本地事务总结 %}

## redo log
+  有了redolog之后，当对缓冲区的数据进行增删改之后，会首先将操作的数据页的变化，记录在redo log buffer中。在事务提交时，会将redo log buffer中的数据刷新到redo log磁盘文件中。过一段时间之后，如果刷新缓冲区的脏页到磁盘时，**发生错误，此时就可以借助于redo log进行数据恢复，这样就保证了事务的持久性**。
+  因为在业务操作中，我们操作数据一般都是**随机读写磁盘**的，而不是顺序读写磁盘。 而redo log在往磁盘文件中写入数据，由于是日志文件，所以都是**顺序写**的。顺序写的效率，要远大于随机写。 这种先写日志的方式，称之为** WAL（Write-Ahead Logging）**。


## 参考:
1. [拨开云雾见天日：剖析单机事务原理](https://dbaplus.cn/news-160-1729-1.html) CHEN川 ***
2. [多版本并发控制(MVCC)在分布式系统中的应用](https://coolshell.cn/articles/6790.html) Todd
3. 阿里云分布式缓存OCS与DB之间的数据一致性 杨成虎
4. [乐观锁和 MVCC 的区别？  二楼 三楼](https://www.zhihu.com/question/27876575)
5. [mysql可重复读和幻读实例  CWeeYii](https://blog.csdn.net/cweeyii/article/details/70991230)
6. [MySQL脏读、虚读、幻读 Eternity味道](https://www.cnblogs.com/lz0925/articles/8988922.html)
7. [MySQL 中事务的实现原理](https://blog.csdn.net/J_java1/article/details/82025189)  失效

