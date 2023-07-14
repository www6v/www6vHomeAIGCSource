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

关键词： 锁优化，池化，数据库优化，架构优化， 系统优化，性能测试， 监控 

{% asset_img performance.jpg 性能优化总结 %}

{% asset_img performance2.jpg 性能优化总结 %}


# 应用优化
+ 应用
	- 锁[4]
		+ 粒度
		  - 粗化
		+ 最小化锁范围
		+ Eg， 单线程写文件
		+ 锁拆分，分散锁
		  - 减少竞争，race condition
		  - eg. ConcurrentHashMap，LongAdder
		+ 分离锁
		  - 读写锁
		  - 队头队尾， 两把锁
		+ 乐观锁
		  - CAS
		+ 读写锁
		  - 读多写少的场景
	- 并行[1]
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
	- 工具
		+ btrace， 慢响应，生产用
		+ 排查占cpu最多的线程
		+ JVM 工具
	- 池化(重用)
		+ Eg. 线程池，数据库连接池
	- 代码调优
		+ 字符串操作
		+ 多线程调优
			- 锁[4]
			- 线程个数【参考9】
		+ 异步操作[3]
		+ 简化代码
		+ 热点[5]
		+ 数值精度
			- Eg. 双精度 单精度
	- 算法调优
		+ 分而治之[6]
			- fork-join【2】
			- Map-Reduce
		+ 哈希算法
		+ 预处理
			- 提前计算(预处理)，最后合并
	- 算法和数据结构
		+ 算法复杂度 大O表示【参考10】
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
						快排(分治算法[6])
				+ O(n)
				+ O(n^2)
					+ 选择、插入、冒泡
		+ 数据结构
			- 树，链表，栈，队列

# 参考
1. [高性能高并发系统的稳定性保障](http://dwz.cn/4SrP4L) 京东

2. [Linux性能优化实战](https://time.geekbang.org/column/intro/140)  极客时间

3. [性能测试应该怎么做？](https://coolshell.cn/articles/17381.html) 

4. {% post_link 'stability' %}  self

5. [关于容量预估/性能压测的思考](http://blog.jobbole.com/88958/)

6. {% post_link 'stability' %}   self  重复的

7. 《性能之巅：洞悉系统、企业与云计算》 

8. [性能调优攻略](https://coolshell.cn/articles/7490.html/comment-page-1)  *** 

9. {% post_link 'threadNum' %}  self

10. [每个程序员都应该收藏的算法复杂度速查表](http://www.codeceo.com/article/algorithm-complexity-table.html)

11. 《编程珠玑 第2版》 

12. [wordcount设计与优化](https://yq.aliyun.com/articles/25487)  竞赛题


100. [latency](https://colin-scott.github.io/personal_website/research/interactive_latency.html)  未  
101. {%  post_link   'mysqlIndex'  %}     self 未
102. {%  post_link   'nginxOptimize'  %}   self 未
