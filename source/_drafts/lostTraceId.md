---
title: TraceId 丢失问题
date: 2021-05-17 17:30:08
tags:
  - 故障排查
categories:
  - 稳定性
  - 故障排查 
  - TraceId 丢失
---

<p></p>
<!-- more -->


{% draft %}
{% enddraft %}

## 目录

<!-- toc -->


# 关键词  
traceId,  跨线程传递方案,  上下文,  @Async 

#  正文

<iframe height='1000'   width='1000'   src="https://tech.meituan.com/2023/04/20/traceid-google-dapper-mtrace.html"  id="iframe1"></iframe>

# 参考
[一次「找回」TraceId的问题分析与过程思考](https://tech.meituan.com/2023/04/20/traceid-google-dapper-mtrace.html) 


#  Here[总结]
{% draft %}
{% enddraft %}

### 现象
在一次排查线上告警的过程中，突然发现一个链路信息有点不同寻常（这里仅展示测试复现的内容）：

在机器中可以清楚的发现“2022-08-02 19:26:34.952 DXMsgRemoteService ”这一行日志信息并没有携带TraceId，导致调用链路信息戛然而止，无法追踪当时的调用情况。

### 排查

首先在代码中定位TraceId没有追踪到的部分，发现问题出现在一个@Async注解下的方法，删除无关的业务信息代码，并增加MTrace埋点方法后的复现代码如下
``` Java
@SpringBootTest
@RunWith(SpringRunner.class)
@EnableAsync
public class DemoServiceTest extends TestCase {
	@Resource
		private DemoService demoService;
	@Test
		public void testTestAsy() {
		Tracer.serverRecv("test");
		String mainThreadName = Thread.currentThread().getName();
		long mainThreadId = Thread.currentThread().getId();
		System.out.println("------We got main thread: "+ mainThreadName + " - " +  mainThreadId + "  Trace Id: " + Tracer.id() + "----------");
		demoService.testAsy();
	}
}
@Component
public class DemoService {
	@Async
		public void testAsy(){
		String asyThreadName = Thread.currentThread().getName();
		long asyThreadId = Thread.currentThread().getId();
		System.out.println("======Async====");
		System.out.println("------We got asy thread: "+ asyThreadName + " - " +  asyThreadId + "  Trace Id: " + Tracer.id() + "----------");
	}
}
```

### 根因
可以发现，其继承了spring的TaskExecutor接口，其实质是java.util.concurrent.Executor，结合我们这次“丢失”的TraceId问题来看，我们已经找到了  **CAT** 的跨线程传递方案“失效”的原因：虽然 **CAT**已经通过javaagent&instrument技术可以完成Trace信息跨线程传递，但是目前只覆盖到ThreadPoolExecutor类、ScheduledThreadPoolExecutor类和ForkJoinTask类的字节码，而@Async在未指定线程池的情况下默认会启用SimpleAsyncTaskExecutor，其本质是java.util.concurrent.Executor没有被覆盖到，就会造成ThreadLocal中的get方法获取信息为空，导致最终TraceId传递丢失。


### 解决方案
实际上@Async支持我们使用自定义的线程池，可以**手动自定义Configuration来配置ThreadPoolExecutor线程池，然后在注解里面指定bean的名称**，就可以切换到对应的线程池去
``` Java
@Configuration
public class ThreadPoolConfig {
	@Bean("taskExecutor")
	    public Executor taskExecutor() {
		ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
		//设置线程池参数信息
		taskExecutor.setCorePoolSize(10);
		taskExecutor.setMaxPoolSize(50);
		taskExecutor.setQueueCapacity(200);
		taskExecutor.setKeepAliveSeconds(60);
		taskExecutor.setThreadNamePrefix("myExecutor--");
		taskExecutor.setWaitForTasksToCompleteOnShutdown(true);
		taskExecutor.setAwaitTerminationSeconds(60);
		taskExecutor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
		taskExecutor.initialize();
		return taskExecutor;
	}
}
```

