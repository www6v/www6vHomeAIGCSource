---
title: 缓存(cache)总结
date: 2018-01-21 09:59:17
tags:
  - cache
  - 一致性  
  - 中间件
categories:
  - 分布式 
  - 中间件  
  - 缓存   
---

<p></p>
<!-- more -->  

关键词: 最佳实践、 失效策略(缓存更新)、 使用模式、 缓存与数据库的一致性、 二级缓存（本地缓存+远程缓存）

## 一. 总结
{% asset_img cacheSummary.jpg  cache总结 %}

## 二. 失效策略(缓存更新)、 使用模式

### 缓存更新策略: Read/Write Through模式
{% asset_img write-read-through.PNG  Read/Write Through %}
Read Through : 被动失效
Write Through ： 主动失效

### 缓存更新策略: Cache Aside 模式
Cache Aside 模式和上面的 Read/Write Through 模式非常像，它们处理读请求的逻辑是完全一样的，唯一的一个小差别就是，Cache Aside 模式在更新数据的时候，并不去尝试更新缓存，而是去删除缓存。
{% asset_img  cache-aside.PNG  Cache Aside模式 %}
**普遍使用这种方式**

## 三. 缓存穿透
使用bloomfilter


## 参考:

1. [应用系统数据缓存设计](https://www.geek-share.com/detail/2615401101.html) 淘宝技术部 good
2. Local Cache的小TIP  阿里 放翁（文初）
3. [阿里云分布式缓存OCS与DB之间的数据一致性](https://www.csdn.net/article/1970-01-01/2825234) 杨成虎
4. [缓存失效竟然可以这么解？](https://developer.aliyun.com/article/55842) serana_cai
5. 移动选购线缓存实践 赵思奇
6. 《亿级流量网站架构核心技术》 第9章 张开涛
7. cache 58沈剑
8. [缓存更新的套路](https://coolshell.cn/articles/17416.html)
9. [后端存储实战课 - MySQL如何应对高并发（一）：使用缓存保护MySQL]()  李玥