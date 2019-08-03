---
title: Kubenetes调度器
date: 2019-06-09 12:27:44
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---


{% asset_img   k8sScheduler.jpg  k8s调度器  %} 

<!-- more -->

{% asset_img   schedulerAbstract.JPG  调度系统泛型  %} 


类型|	资源选择|	排他性|	分配粒度|	集群策略
-|-|-|-|-
中央调度器|	全局|	无，时序|	全局策略|	严格的优先级(抢占式) 
两层调度调度器|	动态资源集|	悲观锁|	增量囤积|	严格公正
共享状态|	全局|	乐观锁|	调度器策略|	优先级抢占

表1. 常见调度器的比较






## 参考:

1. [《Kubenetes in Action》 第11章  第16章  七牛容器云团队](http://product.dangdang.com/26439199.html?ref=book-65152-9168_1-529800-3)
2. [《大数据日知录：架构与算法》第4章 张俊林](https://www.amazon.cn/dp/B00NGW4EAG/ref=sr_1_1?__mk_zh_CN=%E4%BA%9A%E9%A9%AC%E9%80%8A%E7%BD%91%E7%AB%99&keywords=%E5%A4%A7%E6%95%B0%E6%8D%AE%E6%97%A5%E7%9F%A5%E5%BD%95%EF%BC%9A%E6%9E%B6%E6%9E%84%E4%B8%8E%E7%AE%97%E6%B3%95&qid=1560055240&s=gateway&sr=8-1)
3. [Kubernetes集群调度器原理剖析及思考](https://mp.weixin.qq.com/s/gfq1qghLW7g4gKZBBP17IA)
4. [Kubernetes高级调度- Taint和Toleration、Node Affinity分析](https://mp.weixin.qq.com/s/oL7_a9a_V913IR78_dZfaA)