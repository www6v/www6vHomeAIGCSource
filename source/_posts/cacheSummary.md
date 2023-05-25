---
title: 缓存(cache)总结
date: 2018-01-21 09:59:17
tags:
  - cache
  - 一致性  
  - 中间件
categories:
  - 中间件  
  - 缓存   
---

<p></p>
<!-- more -->  

## 目录
<!-- toc -->

# 总结
{% asset_img cacheSummary.jpg  cache总结 %}

#  缓存穿透

缓存穿透: 指缓存和数据库中都没有的数据，而用户不断发起请求，如发起为id为“-1”的数据或id为特别大不存在的数据.

解决方案:
1. 回种空值
2. 使用bloomfilter

# 命中率
+ cache命中率不高
	- 会增加接口响应时间


# 参考
1. [应用系统数据缓存设计](https://www.geek-share.com/detail/2615401101.html) 淘宝技术部 *** 失效
2. Local Cache的小TIP  阿里 放翁（文初）
3. xxx
4. xxx
5. xxx
6. xxx
7. cache 58沈剑



