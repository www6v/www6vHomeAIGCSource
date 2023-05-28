---
title: Redis 优化建议
date: 2021-05-24 16:12:00
tags:
  - Redis
categories:
  - 数据库  
  - KV
  - Redis
---

<p></p>
<!-- more -->

## 优化建议
{%  asset_img  'redis-suggest.jpg'  450  300  %}

## 优化建议[2]
+ 对象内存优化
+ 客户端缓冲优化
+ 碎片优化
+ 子进程内存优化

+ 序列化 + 压缩
  Renault（序列化： Json or Hession，压缩： Hession自带压缩 ）

## 提高redis命中率 [3][4]
+ 缓存粒度
  缓存粒度越小，命中率越高
+  合理调整缓存有效期的时间
  避免缓存同时失效
+ 预加载
+ 防止缓存击穿和穿透[5]
+ 增加存储容量
  容量不足时会触发Redis内存淘汰机制
  - 清空策略 [6]
   FIFO(first in first out)
   LFU(less frequently used)
   LRU(least recently used)
   
## 参考
1. 加餐（六）| Redis的使用规范小建议
2. [Redis 内存优化在 vivo 的探索与实践](https://zhuanlan.zhihu.com/p/506470564) vivo 
3. [如何提高redis缓存命中率](https://segmentfault.com/a/1190000023730820)
4. [关于如何提高缓存命中率（redis）](https://www.cnblogs.com/chenhaoyu/p/11308753.html)
5. {% post_link 'redisReliability-1' %}
6. [缓存那些事](https://tech.meituan.com/2017/03/17/cache-about.html)