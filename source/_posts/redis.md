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

[kafka-size]:https://user-images.githubusercontent.com/5608425/66014512-ca1ae900-e501-11e9-93d7-840409a862c5.png
[kafka-time]:https://user-images.githubusercontent.com/5608425/66014513-cab37f80-e501-11e9-9b2c-917838d91a4d.png
[kafka-offset]:https://user-images.githubusercontent.com/5608425/66014514-cab37f80-e501-11e9-9be8-a247690b5f9f.png

{% asset_img redis.jpg Redis 总结 %}


## 一. redis集群
1. sentinel
   master-slave异步复制, 所以会丢消息
   参数: 
   min-slaves-to-write 1   // 至少有一个slave复制
   min-slaves-max-lag 10   // slave节点最大10s的延迟

2. redis cluster
   + 去中心化的
   + 所有数据划分为16384个slots，每个节点负责其中一部分slots。

## 二. 事务
 | 原子性  |    一致性 | 隔离性  | 持久性
 :-: | :-:     | :-:      | :-:     | :-: 
redis |一定的原子性，但不支持回滚   | × | √  | 通过一定策略可以保证持久性
       |没有进行回滚，不具备原子性.<br>操作之后写AOF日志|aof可以保证，但从应用层看没有回滚和原子性，所以并不能保证一致性| 单线程天然隔离|纯内存(×)<br>RDB Bgsave(√) <br> RDB 异步执行(×)
mysql  |√       |√    |√    | √
       |undo log|锁   |锁    | redo log


## 三. 回收策略
 回收策略       | redis   | kafka    
 :-:     | :-:     | :-:       
 基于时间 | 过期删除策略 <br>1. 定时删除 <br>2. 惰性删除 <br>3.定期删除  | ![kafka-time]  
 基于大小 | 内存淘汰策略 <br>1. noeviction <br>2.lru <br>3. random <br>4. ttl  | ![kafka-size]
 其他 | x  | ![kafka-offset]  



## 参考:
《Redis 深度历险：核心原理与应用实践》 钱文品
1. 原理 4：雷厉风行 —— 管道
2. 原理 5：同舟共济 —— 事务
3. 原理 8：有备无患 —— 主从同步
4. 原理 3：未雨绸缪 —— 持久化
5. 集群 1：李代桃僵 —— Sentinel

---
5. 《Redis实战》 黄健宏 3.7 ,4.4, 6.2
6. [Redis 数据结构和对象系统，记住这 12 张图就够啦！](https://mp.weixin.qq.com/s/fO0yoHGqtFH5lpu6688h2w)
7. [七问Redis，才知道我与技术大牛的差距在哪里 ](https://mp.weixin.qq.com/s?__biz=MzI4NTA1MDEwNg==&mid=2650780240&idx=1&sn=49fb636a97a3c21fec7d2e2b59bea09f&chksm=f3f907c5c48e8ed3aec22d5c9b227e08916da9c4318524b435335340dc9852b314dd8f3abf8b&scene=0&xtrack=1#rd) good
8. [Mysql事务总结](../../../../2015/02/21/transaction/) self
9. [美团针对Redis Rehash机制的探索和实践](https://www.cnblogs.com/meituantech/p/9376472.html) good

---

### 回收策略

10. [Redis内存回收机制，把我整懵了...](http://mp.weixin.qq.com/s?__biz=MjM5ODI5Njc2MA==&mid=2655826994&idx=2&sn=c7efe2b7cdd350f1b3c6fb72cc8c1cd7&chksm=bd74f9e58a0370f3fdbe7c81365b73eafcfc77c4856ce865d43ab8502e677a6100ef7a24d193&scene=0&xtrack=1#rd)
11. [Kafka日志清理之Log Deletion](https://blog.csdn.net/u013256816/article/details/80418297)


