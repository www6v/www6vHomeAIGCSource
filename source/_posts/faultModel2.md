---
title: 故障模型-中间件层 
date: 2018-05-03 21:59:42
tags:
  - 故障模型
categories:
  - 稳定性
  - 故障模型
---

<p></p>
<!-- more -->

## 故障模型-中间件层 
+ 故障模型-Runtime&Middleware&OS
	- 负载均衡失效
	- 数据库
		- 数据库热点
		- 数据库连接满
		- 数据库宕机
		- 数据库同步延迟
		- 数据库主备延迟【参考2】
	- 缓存
		- 缓存热点【参考1】
		- 缓存限流
	- OS资源
		- CPU抢占
			- 案例 : HashMap并发访问，CPU100%【参考1】
			- 案例：正则表达式回溯，CPU100%
		- 内存抢占
			- 案例：OOM killer
		- 上下文切换

# 参考
### 大纲
1. [超全总结 | 阿里如何应对电商故障？神秘演练细节曝光](https://developer.aliyun.com/article/105551) 阿里巴巴  周洋

### Runtime & Middleware & OS
1. {% post_link 'redisHotkey' %}  self

2. [UCloud高可用数据库UDB主从复制延时的解决](https://www.admin5.com/article/20190404/902952.shtml)
