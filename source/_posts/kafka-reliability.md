---
title: Kafka 可靠性总结
date: 2016-07-05 06:20:57
tags:
  - kafka
  - 可用性  
categories:
  - 分布式 
  - 中间件
  - 消息系统
  - Kafka    
---

{% asset_img  Kafka-Reliability.jpg  Kafka 可靠性总结 %}


<style>
table th:first-of-type {
	width: 100px;
}
</style>


<style>
table th:nth-of-type(3) {
	width: 200px;
}
</style>


<div style="text-align: center;">

                表. 高可靠配置
</div>

位置 | 配置项| 可靠性
:-:|:-:|:-:
topic的配置|replication.factor>=3,即副本数至少是3个 |复制因子<br>replication.factor(topic级别) <br>default.replication.factor(broker级别)
|2<=min.insync.replicas<=replication.factor <br> 最少同步副本min.insync.replicas| 3副本（总）<br>1.3副本，一般最少同步2副本 <br>2.最少同步2副本时，如2副本挂了，这时不能写，只能读.<br>设置为1，单副本挂了，就会丢数据【3】
broker的配置|leader的选举条件unclean.leader.election.enable=false <br> unclean.leader.election -> broker级别 |1.允许不同步的副本成为首领 ，有数据不可靠的风险.<br>2.不允许不同步的副本成为首领 ，降低了可用性.
producer的配置|request.required.acks=-1(all)【6】 <br> producer.type=sync【7】|







	
	    
		   

	    
		    

	    
		    




## 参考:

1. Kafka设计解析（六）- Kafka高性能关键技术解析 郭俊
2. kafka数据可靠性深度解读 朱忠华
3. 《Kafka权威指南》 第6 章可靠的数据传递 薛命灯
