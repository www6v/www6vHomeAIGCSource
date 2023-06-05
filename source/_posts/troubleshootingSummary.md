---
title: 故障模型 && 故障排查
date: 2021-05-23 16:10:09
tags:
  - 故障排查
categories:
  - 汇总
  - 故障排查
top: true  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


## 故障模型 && 故障排查
##### Java Core && 应用
+ {% post_link  'faultModel1' %}
  + {% post_link  'memoryLeak' %} 
  + {% post_link  'twoGCcase' %}
  + {% post_link  'interrupted' %}
  + {% post_link  'classloader' %}
  + {% post_link  'multiAgent' %}  ***
  + {% post_link  'lostTraceId' %}  ***

#####  中间件

+ {% post_link  'faultModel2' %}
  - 微服务
    + {% post_link  'findProblem' %}
    + {% post_link  'slowRT' %} 
    + {% post_link  'zookeeperBug' %}  ***
  - Redis
    + {%  post_link  'redisBigKey'  %} ***
    + {% post_link 'redisNodeId' %} *** 
  - Kafka
    + {% post_link  'kafkaGracefulDown' %}  ***
  - 多线程 - 死锁
    + {% post_link  'mybatisBug' %}
  - 数据库
    + {% post_link  'tidbTroubleshooting' %}   
    + {% post_link  'mysqlBestPractice' %}
  - {% post_link  'splitBrain' %}


##### Infra
+ {% post_link  'faultModel3' %}
  + {% post_link  'haproxyTcpdump' %}   网络
  + {% post_link 'tcpTimewait' %} ***
  + {% post_link 'linuxPerformance-cpu' %}  

##### K8s
+ {% post_link  'k8sTroubleshoot' %}  
+ {% post_link  'k8sProblem' %}     
+ {% post_link  'k8sBestPractice' %}  

##### Basic
+ {% post_link  'tcpFault' %}
+ {% post_link  'crashDetect' %}







  
