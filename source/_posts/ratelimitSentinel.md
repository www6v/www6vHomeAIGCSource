---
title: 限流-Sentinel
date: 2022-03-28 16:06:26
tags:
  - 限流  
categories: 
  - 稳定性  
  - 限流  
---


<p></p>
<!-- more -->



## Sentinel

+ 限流 类型 [2]
  - 直接失败  [滑动时间窗口]
  - Warmup 预热 [令牌桶算法]
  - 限流排队  [漏桶算法]

+ 分布式限流 [1]

## 参考

1.  [集群流量控制](https://sentinelguard.io/zh-cn/docs/cluster-flow-control.html)
2.  [【图灵学院】2022最新B站独家分布式限流算法原理与应用讲解视频短合集](https://www.bilibili.com/video/BV1MP4y1176q?p=11)   V
99. [流控降级最佳实践](https://github.com/www6v/StabilityGuide/blob/master/docs/prevention/resilience/%E6%B5%81%E6%8E%A7%E9%99%8D%E7%BA%A7%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5.md)  阿里 未
100. [常用限流降级组件对比](https://github.com/alibaba/Sentinel/wiki/%E5%B8%B8%E7%94%A8%E9%99%90%E6%B5%81%E9%99%8D%E7%BA%A7%E7%BB%84%E4%BB%B6%E5%AF%B9%E6%AF%94) Sentinel vs. Hystrix  未 

{% post_link 'ratelimit' %}  self
