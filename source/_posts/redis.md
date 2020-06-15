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
### 1. sentinel
   master-slave异步复制, 所以会丢消息

```   
   参数: 
   # 至少有一个slave复制
   min-slaves-to-write 1   
   # slave节点最大10s的延迟
   min-slaves-max-lag 10   
```

#### 2. redis cluster
**整体架构**
1. 去中心化的;
2. 所有数据划分为16384个slots，每个节点负责其中一部分slots;

**容错**
1. 主从容错，主升从。
2. PFail（Possibly Fail） -> 临时不可用
   Fail -> 确定不可用， PFail Count> 集群的1/2

**Gossip**协议
集群节点采用 Gossip 协议来广播自己的状态以及自己对整个集群认知的改变;
可能下线 (PFAIL-Possibly Fail) && 确定下线 (Fail)

**slot迁移**
在迁移过程中，客户端访问的流程会有很大的变化。
迁移是会影响服务效率的，同样的指令在正常情况下一个 ttl 就能完成，而在迁移中得 3 个 ttl 才能搞定。

**网络抖动**
```
# 表示当某个节点持续 timeout 的时间失联时，才可以认定该节点出现故障
cluster-node-timeout 
```

**槽位迁移感知**
2个error指令
1.MOVED：  用来纠正槽位
2.ASKING： 用来临时纠正槽位

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

+ 近似LRU算法[11]

## 四. hash和scan命令
+ redis hash的结构：一维数组+二维链表（和java的hashmap结构一样）


+ redis rehash: 渐进式rehash
Java rehash： 一次性将旧数组下挂接的元素全部转移到新数组下面
 

+ scan命令：
zset -> zscan
hash -> hscan
set -> sscan
key of hash -> scan
SCAN：命令用于迭代 数据库键。
SSCAN：命令用于迭代 set 中的元素。
HSCAN：命令用于迭代 hash 中的键值对。
ZSCAN：命令用于迭代  zset 中的元素（包括元素成员和元素分值）。

+ 大key在数据迁移、扩容、删除时会有卡顿。 
解决方案： 用scan扫描大key， --bigkeys参数


## 五. IO模型和性能
+ 非阻塞IO： read， write时不阻塞
+ 事件轮询和多路复用[8]

+ redis性能
最低配置: 4GB， 2核， 链接数2w， QPS 16w

+ redis性能高的原因
1. 高效的数据结构
2. 多路复用IO模型
3. 事件机制
总结:Reactor + 队列 [10]

> 大体上可以说 Redis 的工作模式是，reactor 模式配合一个队列，用一个 serverAccept 线程来处理建立请求的链接，
并且通过 IO 多路复用模型，让内核来监听这些 socket，一旦某些 socket 的读写事件准备就绪后就对应的事件压入队列中，
然后 worker 工作，由文件事件分派器从中获取事件交于对应的处理器去执行，当某个事件执行完成后文件事件分派器才会从队列中获取下一个事件进行处理。
可以类比在 netty 中，我们一般会设置 bossGroup 和 workerGroup 默认情况下 bossGroup 为 1，workerGroup = 2 * cpu 数量，
这样可以由多个线程来处理读写就绪的事件，但是其中不能有比较耗时的操作如果有的话需要将其放入线程池中，不然会降低其吐吞量。
在 Redis 中我们可以看做这二者的值都是 1。

## 参考:
《Redis 深度历险：核心原理与应用实践》 钱文品
1. 原理 4：雷厉风行 —— 管道
2. 原理 5：同舟共济 —— 事务
3. 原理 8：有备无患 —— 主从同步
4. 原理 3：未雨绸缪 —— 持久化
5. 集群 1：李代桃僵 —— Sentinel
6. 集群 3：众志成城 —— Cluster
7. 大海捞针 ——— scan
8. 鞭辟入里 ——— 线程IO模型

---
5. 《Redis实战》 黄健宏 3.7 ,4.4, 6.2
6. [Redis 数据结构和对象系统，记住这 12 张图就够啦！](https://mp.weixin.qq.com/s/fO0yoHGqtFH5lpu6688h2w)
7. [七问Redis，才知道我与技术大牛的差距在哪里 ](https://mp.weixin.qq.com/s?__biz=MzI4NTA1MDEwNg==&mid=2650780240&idx=1&sn=49fb636a97a3c21fec7d2e2b59bea09f&chksm=f3f907c5c48e8ed3aec22d5c9b227e08916da9c4318524b435335340dc9852b314dd8f3abf8b&scene=0&xtrack=1#rd) good
8. [Mysql事务总结](../../../../2015/02/21/transaction/) self
9. [美团针对Redis Rehash机制的探索和实践](https://www.cnblogs.com/meituantech/p/9376472.html) good
10. [为什么 Redis 单线程能达到百万+QPS？](https://mp.weixin.qq.com/s/QrvUl6Ul9DxYoRZwSsMQZw) good
11. [经典面试题：Redis 内存满了怎么办？](https://mp.weixin.qq.com/s/gkkjJu04sS2qtRdd-yB5DQ)

---

### 回收策略

10. [Redis内存回收机制，把我整懵了...](http://mp.weixin.qq.com/s?__biz=MjM5ODI5Njc2MA==&mid=2655826994&idx=2&sn=c7efe2b7cdd350f1b3c6fb72cc8c1cd7&chksm=bd74f9e58a0370f3fdbe7c81365b73eafcfc77c4856ce865d43ab8502e677a6100ef7a24d193&scene=0&xtrack=1#rd)
11. [Kafka日志清理之Log Deletion](https://blog.csdn.net/u013256816/article/details/80418297)


