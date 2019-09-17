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
![消息同步模型](https://user-images.githubusercontent.com/5608425/65018148-fa3b8700-d95a-11e9-865d-040c86263ef5.png)
消息同步模型- 左:BCDEF的发件箱，右:A的收件箱

![基于Timeline的消息库设计](https://user-images.githubusercontent.com/5608425/65019405-b6964c80-d95d-11e9-88a6-395dc2c888e7.png)
基于Timeline的消息库设计 - 上：用于写扩散消息同步，下：全量历史消息，读扩散消息同步


![Timeline读扩散/写扩散混合](https://user-images.githubusercontent.com/5608425/65009396-16312f80-d93f-11e9-9f1f-5beb374034d2.png)
基于用户类型的Timeline推拉结合(读扩散/写扩散混合) - 上面是发布流程，下面是阅读流程
</div>


| |拉模式(读扩散)	| 推模式(写扩散)[推荐使用]|
|:---:|:---:|:---:|
|发布	| 个人页Timeline（发件箱）	| 粉丝的关注页（收件箱）| 
|阅读	|所有关注者的个人页Timeline	|自己的关注页Timeline| 
|网络最大开销	  | 用户刷新时	| 发布Feed时 |
|读写放大	  | 放大读：读写比例到1万:1	| 放大写减少读：读写比例到50:50 |
|优点| 只要写一次 |接收端消息同步逻辑会非常简单|
|缺点、副作用| 1.读被大大的放大<br> 2.响应时间长 | 消息写入会被放大， 数据会极大膨胀，|
|针对副作用的优化-推拉结合||1.大V采用拉模式，普通用户使用推模式<br>2.对活跃粉丝采用推模式，非活跃粉丝采用拉模式|


|场景 | Timeline | 
|:---:|:---:|
|IM单聊	|三个Timeline 	|  
|IM群聊	|1 + N个Timeline	| 
|朋友圈	|1 + N个Timeline 	| 
|微博	|大V发一条微博就是 1 + M个Timeline（M << N，N是粉丝数） 	| 
 

<div style="text-align: center;">
![Rank](https://user-images.githubusercontent.com/5608425/65016689-792ec080-d957-11e9-9834-6a3d5c93e647.png)
Rank
</div>

## 参考:

1. [feed流拉取，读扩散，究竟是啥？](https://mp.weixin.qq.com/s/HC9Ucdfih24jXY6lCAv40g)
2. [如何打造千万级Feed流系统](https://yq.aliyun.com/articles/224132?spm=a2c4e.11153940.0.0.280655b2Qo0T2I)
3. [TableStore Timeline：轻松构建千万级IM和Feed流系统](https://yq.aliyun.com/articles/319138?spm=a2c4e.11153940.0.0.206d1844pmn4zn)
4. [现代IM系统中消息推送和存储架构的实现](https://yq.aliyun.com/articles/253242)

