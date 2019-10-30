---
title: 超时和重试总结
date: 2016-01-17 12:23:58
tags:
  - 中间件
  - 服务化
  - 超时
categories:
  - 分布式 
  - 服务治理
  - 超时   
---

**关键词**： 超时, 降级, 重试 

{% asset_img  timeout.jpg  超时总结 %}

+ 超时和延迟的原因:
1. 服务端获得请求了，但超时了;
2. 服务端没获得请求，请求失败了， 超时了;

+ 重试方式:
指数级退避 Exponential Blackoff[3][4]


## 参考:

1. 《亿级流量网站架构核心技术》 张开涛
2. Hedwig文档
3. [网络重试中的 指数退避抖动 算法 Exponential Backoff And Jitter](https://www.jianshu.com/p/0a6ee8c13522)
4. [AWS 中的错误重试和指数退避](https://docs.aws.amazon.com/zh_cn/general/latest/gr/api-retries.html)
