---
title: 性能优化总结
date: 2018-11-21 12:11:33
tags: 
  - 基础
  - 性能
  - 性能优化
categories: 
  - 性能  
  - 总结
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 关键词 
锁优化，池化，数据库优化，架构优化， 系统优化，性能测试， 监控 


# 应用优化
+ 应用
	- 锁 【4】
		+ 粒度
		  - 粗化
		+ 最小化锁范围
		  - Eg， 单线程写文件
		+ 锁拆分，分散锁
		  - 减少竞争，race condition
		  - eg. ConcurrentHashMap，LongAdder
		+ 分离锁
		  - 读写锁
		    - 读多写少的场景
		  - 队头队尾， 两把锁
		+ 乐观锁
		  - CAS	  
	- 并行  【1】
		+ 多线程
		  - fork-join模式【2】
		  - 本地化 Eg. ThreadLocal
		+ Actor
		  - Eg. Akka
		+ CSP
		  - Eg. Goroutie
		+ 函数式范性
		  - 不可变对象
		+ 单核单线程
		  - Eg. Redis, Nginx
	- 池化(重用)
		+ Eg. 线程池，数据库连接池
	- 代码调优
		+ 字符串操作
		+ 多线程调优
			- 锁 【4】
			- 线程个数【9】
		+ 异步操作  【8】
		+ 简化代码
		+ 热点优化  【5】
		+ 数值精度
			- Eg. 双精度 单精度

# 算法优化
+ 算法
	- 算法调优
		+ 分而治之 【6】
			- fork-join【2】
			- Map-Reduce
		+ 哈希算法
		+ 预处理
			- 提前计算(预处理)，最后合并
	- 算法和数据结构
		+ 算法复杂度 大O表示【10】
			- 时间复杂度
				+ O(1)
					+ 数组访问
					+ 栈、链表的插入/删除
					+ Hash Table
				+ O(log(n))
					+ 二叉搜索树
						+ 自平衡二叉搜索树
							AVL树
							红黑树
					+ B树(多路树)
				+ O(n log(n))
					+ 快排、归并、堆
						快排(分治算法【6】) 
				+ O(n)
				+ O(n^2)
					+ 选择、插入、冒泡
		+ 数据结构
			- 树，链表，栈，队列



# 通用优化
- 通用方法
	+ 异步化  【8】
		+ 消息
			+ 进程内
			   Eg.  Disruptor, EventBus
			+ Broker
		+ 事件
		  Eg. EventSource
		+ 服务异步化
		  Eg. 异步网关
	+ Batch
		+ Eg. redis pipeline
		+ buffer io
	+ Copy on Write
	    + Eg. mysql MVCC, CopyOnWriteArrayList


# 数据库优化
- 索引优化
- 大表优化
  - 水平拆分
  - 垂直拆分
- 慢SQL优化
- 乐观锁

# 架构/系统优化
+ 架构/系统优化
	- 弹性/伸缩
		+ 资源调度 Eg. k8s
		+ 资源扩容
	- 可扩展
		+ 垂直拆分
		+ 水平拆分
	- 分布式
		+ 并行 【1】
		+ 延迟
		  Eg.  跨IDC网络延迟 上海<->北京  50ms
	- 节省空间/时间换空间【8、11】
		+ 不存储，重新计算
		+ 稀疏数据结构
			Eg. 稀疏矩阵
		+ 数据压缩传输
			RSYNC 的核心算法
			Huffman 编码压缩算法
		+ 动态分配策略
			Eg. ArrayList(10)，HashMap(16)的动态扩展
		+ 垃圾回收
	- 空间换时间
		+ 缓存
		+ 数据冗余，replication
	- 系统结构
		+ 大型系统分解成模块
		  “粗略估算”，性能分析
	- 系统软件
		+ 替换更快的操作系统、中间件、数据库、编译器


# Linux系统优化
+ 系统
	- 文件系统
		+ pageCache, 预读
		  Eg. Rocketmq
		+ 顺序写，随机读
		+ 大块读优于小块读
	- CPU
		+ CPU绑定
		+ CPU上下文切换
			+ Eg. Redis单线程
			  CPU不是Redis的瓶颈，
			  瓶颈可能是内存的大小或者网络带宽
		+ CPU缓存
			+ 问题：伪共享
			  解决：cacheline padding
	- 网络I/O
		+ NIO,非阻塞I/O，epoll
		+ 协议调优
		  TCP参数
	- 内存
		+ zeroCopy
		+ HugePage


# 参考
1. [高性能高并发系统的稳定性保障](http://dwz.cn/4SrP4L) 京东
2. [Linux性能优化实战](https://time.geekbang.org/column/intro/140)  极客时间
3. [性能测试应该怎么做？](https://coolshell.cn/articles/17381.html)  coolshell  deleted
4. {% post_link 'stability' %}  self  deleted
5. [关于容量预估/性能压测的思考](http://blog.jobbole.com/88958/)  deleted  失效
6. {% post_link 'stability' %}   self  重复的 deleted
7. xxx
8. [性能调优攻略](https://coolshell.cn/articles/7490.html/comment-page-1)  coolshell  *** 
9. {% post_link 'threadNum' %}  self
10. [每个程序员都应该收藏的算法复杂度速查表](http://www.codeceo.com/article/algorithm-complexity-table.html)
11. 《编程珠玑 第2版》 
12. [wordcount设计与优化](https://yq.aliyun.com/articles/25487)  竞赛题

### 其他
100. [latency](https://colin-scott.github.io/personal_website/research/interactive_latency.html)  未  
101. {%  post_link   'mysqlIndex'  %}     self 未
102. {%  post_link   'nginxOptimize'  %}   self 未
