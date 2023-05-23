---
title: 故障模型-应用层
date: 2018-10-27 14:39:20
tags:
  - 故障模型
categories:
  - 稳定性
  - 故障模型
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 故障模型-Application & Data
###	 OOM
		+ 堆内 【10】
			- PermGen
				+ 原因：反射类多
				+ 解决
				  先jmap，后btrace【11、12 case2】
			- heap
				解决：对比Fullgc后的相同对象的数量、大小
		+ 堆外Native

参考: 
3. {% post_link 'gc' %}  self
10. 如何排查Java内存泄露(内附各种排查工具介绍) 不闻
11. [生产环境下持久带满导致FullGC，如何跟踪](https://hllvm-group.iteye.com/group/topic/28379) 
12. {% post_link 'optimize' %}  self

###	 应用性能变差
		+ 原因
			- 锁  
			- heap
				+ fullgc后没有空间
					原因：内存泄露
					工具：heap dump
				+ fullgc后有空间
					解决：设置门槛，过滤大量短生命周期对象【12 case1，13】
			- gc停顿长
				解决：【12 case3，13】
参考:
3. {% post_link 'gc' %}  self
12. {% post_link 'optimize' %}  self
13. [听阿里巴巴JVM工程师为你分析常见Java故障案例](https://blog.csdn.net/github_32521685/article/details/89953050)  ***

###	 Load过高
		+ cpu load高【13】
			- 启动阶段
				原因：JIT编译器
				解决：分层编译
			- 运行阶段
				原因：有热点方法
				工具：MAT
			- 解决
				工具【8、9】
				数据收集  4、5
参考:
不正当使用HashMap导致cpu 100%的问题追究 王宏江
[一个由正则表达式引发的血案](http://www.cnblogs.com/study-everyday/p/7426862.html)   CPU飚高
8. [vjtools](https://github.com/vipshop/vjtools) 
9. [useful-scripts](https://github.com/oldratlee/useful-scripts) 
13. [听阿里巴巴JVM工程师为你分析常见Java故障案例](https://blog.csdn.net/github_32521685/article/details/89953050)  ***

###	进程Hang

###	 进程被杀， JVM crash
		+ 原因：
		  JNI 
		  Unsafe
		+ 工具：core dump


###	 异常
		+ 启动异常
		+ 心跳异常

### CI/CD
	+ 环境错误
	+ 部署包错误
	+ 配置错误，误删

###	系统单点
		+ 原因: 设计问题
		+ 解决：服务去状态，多实例部署

###	异步阻塞同步

###	依赖超时，依赖异常
		+ 解决【15,16】
			- 区分强弱依赖
			- 压测 + 容量规划
			- 熔断 && 降级
参考: 
15. {% post_link 'Hystrix' %}  self 
16. {% post_link 'stability' %}  self

###	业务线程池满
		+ 最佳实践:【4】
		+ 案例：【14】
			- 问题：使用blockingQueue.put
			- 解决：blockingQueue.offer（time超时机制）+限制队列长度
			- 最佳实践：生产上线程池的core Size和poolSize设置的一样，请求不在队列里排队
参考：
4. {% post_link 'threadNum' %}  self
14. [从一个故障说说Java的三个BlockingQueue  阿里毕玄](http://hellojava.info/?p=464)

###	流控不合理

###	其他-数据收集
		+ 1.Heap dump
		+ 2. GC 日志
		+ 3. core dump
		+ 4. 线程stack
		+ 5.os进程信息

# 参考

### 大纲
1. [超全总结 | 阿里如何应对电商故障？神秘演练细节曝光](https://developer.aliyun.com/article/105551) 阿里巴巴  周洋

### Application & Data

5. [如何检测 Web 服务请求丢失问题](https://mp.weixin.qq.com/s/QA_BTF1D3GJJ7_nYQ6oAzQ)  Nginx tracing + Tomcat tracing
6. [系统中的故障场景建模](https://www.infoq.cn/article/system_failure_modeling/)  应用层
7. 大方法 codecache  

