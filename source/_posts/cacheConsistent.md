---
title: 缓存 一致性
date: 2021-05-25 15:06:33
tags:
  - 缓存
categories:
  - 中间件  
  - 缓存
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 关键词
 失效策略(缓存更新)、  缓存与数据库的一致性

# 失效策略(缓存更新) [9]

### Read/Write Through模式
{% asset_img write-read-through.PNG  Read/Write Through %}
Read Through : 被动失效
Write Through ： 主动失效

###  Cache Aside 模式
Cache Aside 模式和上面的 Read/Write Through 模式非常像，它们处理读请求的逻辑是完全一样的，唯一的一个小差别就是，Cache Aside 模式在更新数据的时候，并不去尝试更新缓存，而是去删除缓存。
{% asset_img  cache-aside.PNG  Cache Aside模式 %}
**普遍使用这种方式**


场景：
订单服务收到更新数据请求之后，先更新数据库，如果更新成功了，再尝试去删除缓存中订 单，如果缓存中存在这条订单就删除它，如果不存在就什么都不做，然后返回更新成功。这 条更新后的订单数据将在下次被访问的时候加载到缓存中。使用 Cache Aside 模式来更新 缓存，可以非常有效地避免并发读写导致的脏数据问题。


###  Write Behind模式
linux page cache: dirty page刷盘。
kafka使用page cache异步刷盘。


# 失效策略
+ 失效策略
	- 被动失效
		- 有空窗期问题
	- 主动更新【1】
		- 无空窗期问题
		- 有并发更新问题。并发写，数据覆盖一致性问题【2】
			- 锁控制,少有这样做的
				- 客户端读写锁
				- 服务端加锁
			- 版本控制
				- 单版本机制【3】
				- 多版本机制
				  - 类似向量时钟， NoSQL使用
	- 消息机制【3,4】
		- 增量db数据通过消息来异步变更缓存的数据


#  缓存的应用模式
+ 缓存的应用模式
	+ Cache-Aside
		- 业务代码直接维护缓存
		- 有并发更新问题【2】
	+ Cache-As-SoR
		- Read-Through
		- Write-Through
			- 同步写
		- Write-Behind
			- 异步写

# Cache与数据库的一致性
+ Cache与数据库的一致性
	+ 读操作
		- 先读缓存，再读数据库
	+ 写操作
		- 先写数据库，在写缓存

# 参考
1. [应用系统数据缓存设计](https://www.geek-share.com/detail/2615401101.html) 淘宝技术部 *** 失效
2. Local Cache的小TIP  阿里 放翁（文初）
3. [阿里云分布式缓存OCS与DB之间的数据一致性](https://www.csdn.net/article/1970-01-01/2825234) 杨成虎
4. [缓存失效竟然可以这么解？](https://developer.aliyun.com/article/55842) serana_cai
5. xxx
6. 《亿级流量网站架构核心技术》 第9章 张开涛
7. xxx
8. [缓存更新的套路](https://coolshell.cn/articles/17416.html)  coolshell ***
9. 《后端存储实战课 - MySQL如何应对高并发（一）：使用缓存保护MySQL》  李玥
10. [浅谈缓存最终一致性的解决方案](https://zhuanlan.zhihu.com/p/554879252)   腾讯 未