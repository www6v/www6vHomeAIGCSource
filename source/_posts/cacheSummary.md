---
title: 缓存(cache)总结
date: 2018-01-21 09:59:17
tags:
  - cache
  - 一致性  
  - 中间件
categories:
  - 中间件  
  - 缓存   
---

<p></p>
<!-- more -->  

## 目录
<!-- toc -->

# 关键词
 失效策略(缓存更新)、 使用模式、 缓存与数据库的一致性、 二级缓存（本地缓存+远程缓存）

# 总结
{% asset_img cacheSummary.jpg  cache总结 %}

# 失效策略(缓存更新)、 使用模式

### 缓存更新策略: Read/Write Through模式
{% asset_img write-read-through.PNG  Read/Write Through %}
Read Through : 被动失效
Write Through ： 主动失效

### 缓存更新策略: Cache Aside 模式
Cache Aside 模式和上面的 Read/Write Through 模式非常像，它们处理读请求的逻辑是完全一样的，唯一的一个小差别就是，Cache Aside 模式在更新数据的时候，并不去尝试更新缓存，而是去删除缓存。
{% asset_img  cache-aside.PNG  Cache Aside模式 %}
**普遍使用这种方式**


场景：
订单服务收到更新数据请求之后，先更新数据库，如果更新成功了，再尝试去删除缓存中订 单，如果缓存中存在这条订单就删除它，如果不存在就什么都不做，然后返回更新成功。这 条更新后的订单数据将在下次被访问的时候加载到缓存中。使用 Cache Aside 模式来更新 缓存，可以非常有效地避免并发读写导致的脏数据问题。


### 缓存更新策略: Write Behind模式
linux page cache: dirty page刷盘。
kafka使用page cache异步刷盘。


#  缓存穿透

缓存穿透: 指缓存和数据库中都没有的数据，而用户不断发起请求，如发起为id为“-1”的数据或id为特别大不存在的数据.

解决方案:
1. 回种空值
2. 使用bloomfilter


# 多级缓存 [5?]

+ 本地缓存+远程缓存
	- 远端Cache推全量或者部分的数据到本地cache，并设置过期时间【初始化】
	- 查询流程
		- 先从本地缓存拿，如果有数据且有效，就直接返回
		- 如果没有命中
			- 1.本地查询远端服务，并拿到结果
			- 2.本地更新远端缓存
			- 3.更新本地缓存
	- 本地cache失效+更新流程,本地防穿透【1】
		- 同步更新缓存
			- 访问同一个key的业务线程只有一个线程穿透到远端Cache，其他线程等待穿透线程的返回结果[加锁]
		- 异步更新缓存
			- 1.过期时间到了后，产生过期事件，延长数据有效期，返回旧的数据
			- 2. 检查过期事件，后台线程池更新缓存数据，并重新设置有效时间
		- eg. Google LoadingCache 以上两种方式都有
	- 远端cache，防穿透
		- 远端cache访穿透采用永久缓存数据，每次查询都能查到值.
		- 通过辅助信息判断逻辑过期, 再从远端服务异步拉数据刷新远端cache。

# 命中率
+ cache命中率不高
	- 会增加接口响应时间


# 参考
1. [应用系统数据缓存设计](https://www.geek-share.com/detail/2615401101.html) 淘宝技术部 *** 失效
2. Local Cache的小TIP  阿里 放翁（文初）
3. [阿里云分布式缓存OCS与DB之间的数据一致性](https://www.csdn.net/article/1970-01-01/2825234) 杨成虎
4. [缓存失效竟然可以这么解？](https://developer.aliyun.com/article/55842) serana_cai
5. 移动选购线缓存实践 赵思奇
6. 《亿级流量网站架构核心技术》 第9章 张开涛
7. cache 58沈剑
8. [缓存更新的套路](https://coolshell.cn/articles/17416.html)
9. [后端存储实战课 - MySQL如何应对高并发（一）：使用缓存保护MySQL]()  李玥