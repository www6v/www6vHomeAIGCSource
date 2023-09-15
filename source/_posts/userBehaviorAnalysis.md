---
title: 用户行为分析
date: 2022-09-15 13:30:09
tags:
  - 用户行为分析
categories: 
  - 大数据
  - 用户行为分析  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 架构 [5]

# 完整链路 [4]
埋点 -> 使用app -> 数据上报 -> 数据模型 -> 行为分析 

# 采集用户行为数据 [2]
### 平台设置埋点 [6] [10]

### 第三方统计工具
百度统计
CNZZ统计
GrowingIO
诸葛IO
神策IO
Google Analytics
Thinking Analytics
友盟
Mixpanel
Heap

# 指标 [2]
### 粘性指标
+ 关注用户周期内持续访问的情况
新用户数与比例、活跃用户数与比例、用户转化率、用户留存率、用户流失率、用户访问率

### 活跃指标
+ 用户访问的参与度
活跃用户、新增用户、回访用户、流失用户、平均停留时长、使用频率

### 产出指标
+ 用户创造的直接价值输出
页面浏览数PV、独立访客数UV、点击次数、消费频次、消费金额

# 用户行为分析
###   AARRR漏斗模型 [1] [3]
+ 实现用户增长的5个指标
    - Acquisition（获取）：指的是用户从各种渠道进入产品的过程。
    - Activation（激活）：指的是用户开始使用产品，并完成核心操作的过程。
    - Retention（留存）：指的是用户在完成激活后，继续使用产品，并形成一定程度的用户粘性。
    - Revenue（收入）：指的是用户在使用产品后，产生的实际收益。
    - Referral（自传播）：指的是用户在使用产品后，愿意将产品推荐给他人，形成口碑和自然增长。

###  常用方法 [1] [2] [4]
+ 行为事件分析
+ 用户留存分析 [7] [8]
+ 漏斗模型分析 [7] [9]
+ 用户行为路径分析 [7][11]
+ 页面点击分析
+ 福格模型分析
+ 用户分群分析
  用户画像（基本属性、用户偏好、生活习惯、用户行为等）的标签信息将用户分群


# 参考
1. [用户行为分析](https://blog.csdn.net/Sake360/article/details/120350080)
2. [用户研究：如何做用户行为分析？](https://baijiahao.baidu.com/s?id=1653670195355016641&wfr=spider&for=pc)
3. [万字详解用户行为分析](https://blog.csdn.net/WindyQCF/article/details/123911538)
4. [用户行为分析是什么？怎么做？](https://baijiahao.baidu.com/s?id=1663323869315685791&wfr=spider&for=pc)
5. [数十亿用户数据，上千个用户标签维度，用户分析怎么做？](https://www.infoq.cn/article/xZYe1DUopNA9CzLwau3O) ***
   [活动回顾 | 数十亿用户数据，上千个用户标签维度，用户分析怎么做？](https://mp.weixin.qq.com/s?__biz=MzIyNTIyNTYwOA==&mid=2651010996&idx=1&sn=f7ba207a991d595036a11fc3b6797bac)  kylin
6. [如何实现用户行为的动态采集与分析](https://www.infoq.cn/article/yGOh38XjpYdTKMJjzjoH)
7. [如何基于 Apache Doris 构建简易高效的用户行为分析平台？](https://www.infoq.cn/article/ecmRgdfrjFl1U3hAd59b)
   [如何基于 Apache Doris 构建简易高效的用户行为分析平台？](https://www.infoq.cn/article/SoCIclCLD8f4vSzLB4dX)
8. [用户行为分析模型实践（一）—— 路径分析模型](https://mp.weixin.qq.com/s?__biz=MzI4NjY4MTU5Nw==&mid=2247490504&idx=1&sn=9827b136fa5cfc81467cb1b795f7bc41) 
9. [用户行为分析模型实践（二）—— 漏斗分析模型](https://xie.infoq.cn/article/f305ea8be1935540432aca0d0)
10. [用户行为分析模型实践（三）——H5 通用分析模型](https://xie.infoq.cn/article/1163e5781f37b4e55a2c43c70)
11. [基于Spark的用户行为路径分析的产品化实践](https://mp.weixin.qq.com/s?__biz=MzU1NDA4NjU2MA==&mid=2247486360&idx=1&sn=85504543498dfc82e5e720b77faa602d)