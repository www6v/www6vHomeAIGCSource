---
title: 分布式锁
date: 2016-12-05 23:33:34
tags:
  - 中间件
  - 锁
categories: 
  - 分布式
  - 一致性
  - 分布式锁  
---

{% asset_img distributedLock.jpg 分布式锁 %}

{% asset_img distributedLock-redis.jpg 图1.redis分布式锁 %}

{% asset_img distributedLock-zk.jpg 图2.zk分布式锁 %}

## 锁的特性:

1. 排它性
2. 超时释放锁
3. 高可用，锁集群容错
4. 可重入锁, 避免死锁
5. 乐观锁， 悲观锁

## 参考：

1. 分布式系统互斥性与幂等性问题的分析与解决 点评 蒋谞 
2. 漫画：什么是分布式锁？ 程序员小灰
3. 《从Paxos到Zookeeper分布式一致性原理与实践》 倪超 6.1.7节
4. [How to do distributed locking](http://martin.kleppmann.com/2016/02/08/how-to-do-distributed-locking.html) Martin Kleppmann  未
5. [SOFAJRaft-RheaKV 分布式锁实现剖析 | SOFAJRaft 实现原理](https://mp.weixin.qq.com/s/ahcbgxWVVmRwrH9Y4-gXBA)   SOFALab 米麒麟 未
6. [Redis 总结](../../../../2016/11/12/redis/) self
7. [分布式服务总结 分布式锁](https://www.jianshu.com/p/31e85a18a9e7)  未
   通过栅栏(fencing)使得锁更安全, fencing token, 乐观锁



