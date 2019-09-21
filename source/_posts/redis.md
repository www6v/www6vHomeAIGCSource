---
title: Redis 总结
date: 2016-11-12 23:29:16
tags:
  - 中间件
  - 存储
  - Redis
categories: 
  - 分布式
  - 存储
  - Redis    
---

<p></p>
<!-- more -->

{% asset_img redis.jpg Redis 总结 %}

 | 原子性  |    一致性 | 隔离性  | 持久性
 :-: | :-:     | :-:      | :-:     | :-: 
 redis |一定的原子性，但不支持回滚   | × | √  | 通过一定策略可以保证持久性
       |没有进行回滚，不具备原子性.<br>操作之后写AOF日志|aof可以保证，但从应用层看没有回滚和原子性，所以并不能保证一致性| 单线程天然隔离|纯内存(×)<br>RDB Bgsave(√) <br> RDB 异步执行(×)
mysql  |√       |√    |√    | √
       |undo log|锁   |锁    | redo log


## 参考:
《Redis 深度历险：核心原理与应用实践》
1. 原理 4：雷厉风行 —— 管道| 钱文品
2. 原理 5：同舟共济 —— 事务| 钱文品
3. 应用 1：千帆竞发 —— 分布式锁| 钱文品
4. 拓展 3：拾遗漏补 —— 再谈分布式锁| 钱文品
5. 原理 8：有备无患 —— 主从同步| 钱文品
6. 原理 3：未雨绸缪 —— 持久化| 钱文品

---

7. 《Redis实战》 黄健宏 3.7 ,4.4, 6.2
8. Redlock：Redis分布式锁最牛逼的实现 阿飞的博客
9. [美团针对Redis Rehash机制的探索和实践](https://www.cnblogs.com/meituantech/p/9376472.html)
10. [Redis 数据结构和对象系统，记住这 12 张图就够啦！](https://mp.weixin.qq.com/s/fO0yoHGqtFH5lpu6688h2w)
11. [七问Redis，才知道我与技术大牛的差距在哪里 ](https://mp.weixin.qq.com/s?__biz=MzI4NTA1MDEwNg==&mid=2650780240&idx=1&sn=49fb636a97a3c21fec7d2e2b59bea09f&chksm=f3f907c5c48e8ed3aec22d5c9b227e08916da9c4318524b435335340dc9852b314dd8f3abf8b&scene=0&xtrack=1#rd)
12. [Mysql事务总结](../../../../2015/02/21/transaction/) self

