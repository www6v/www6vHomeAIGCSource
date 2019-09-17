---
title: Feed
date: 2019-09-13 19:35:02
tags:
  - feed
categories:
  - 分布式
  - 架构
  - feed 
---

<p hideen></p>
<!-- more -->

{% asset_img   feed.jpg  Feed总结  %}

<div style="text-align: center;">
![Timeline读扩散/写扩散混合](https://user-images.githubusercontent.com/5608425/65009396-16312f80-d93f-11e9-9f1f-5beb374034d2.png)
基于用户类型的Timeline推拉结合(读扩散/写扩散混合) - 上面是发布流程，下面是阅读流程
</div>


| |拉模式(读扩散)	| +推模式(写扩散)|
|:---:|:---:|:---:|
|发布	| 个人页Timeline（发件箱）	| 粉丝的关注页（收件箱）| 
|阅读	|所有关注者的个人页Timeline	|自己的关注页Timeline| 
|网络最大开销	  | 用户刷新时	| 发布Feed时 |
|读写放大	  | 放大读：读写比例到1万:1	| 放大写减少读：读写比例到50:50 |
|副作用| 响应时间长 |数据会极大膨胀|
|针对副作用的优化-推拉结合||1.大V采用拉模式，普通用户使用推模式<br>2.对活跃粉丝采用推模式，非活跃粉丝采用拉模式|

<div style="text-align: center;">
![Rank](https://user-images.githubusercontent.com/5608425/65016689-792ec080-d957-11e9-9834-6a3d5c93e647.png)
Rank
</div>

## 参考:

1. [feed流拉取，读扩散，究竟是啥？](https://mp.weixin.qq.com/s/HC9Ucdfih24jXY6lCAv40g)
2. [如何打造千万级Feed流系统](https://yq.aliyun.com/articles/224132?spm=a2c4e.11153940.0.0.280655b2Qo0T2I)
3. [TableStore Timeline：轻松构建千万级IM和Feed流系统](https://yq.aliyun.com/articles/319138?spm=a2c4e.11153940.0.0.206d1844pmn4zn)
4. [现代IM系统中消息推送和存储架构的实现](https://yq.aliyun.com/articles/253242)

