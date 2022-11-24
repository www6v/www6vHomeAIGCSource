---
title: AWS Account和Orgnization
date: 2022-06-23 13:33:11
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->

## Accounts
+ 企业使用多AWS账户时，常见的账户体系结构：
  + 身份账户体系结构（Identity Account Architecture）
    在单一的中心区域对所有用户进行集中管理，以取代在每个AWS账户单独管理用户的方式，并允许他们访问多个AWS账户下的不同的AWS资源。这种在单一的中心区域对所有用户进行管理可以通过跨账户IAM角色和身份联合（Federation）来达成。
  + 日志账户体系结构 (Logging Account Architecture)
  + 发布账户体系结构 (Publishing Account Structure)
  + 账单结构 (Billing Structure)


## 参考
[01-企业的多账户策略（Multi-Account Strategy for Enterprises）](https://www.iloveaws.cn/500.html)