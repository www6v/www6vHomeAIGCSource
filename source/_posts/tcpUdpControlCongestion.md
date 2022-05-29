---
title: TCP流控和拥塞控制
date: 2019-08-07 13:52:09
tags: 
  - 网络
categories: 
  - linux
  - 网络
  - TCP   
---

<p></p>
<!-- more -->

{% asset_img   tcp&udp.jpg  TCP流控和拥塞控制 %}


<div style="text-align: center;">

![TCP拥塞控制](https://user-images.githubusercontent.com/5608425/63579884-31ba4c00-c5c6-11e9-97d1-28defaa3286f.jpg)   TCP拥塞控制

![TCP拥塞控制-快速重传](https://user-images.githubusercontent.com/5608425/63579883-31ba4c00-c5c6-11e9-83ca-78a892b3243d.jpg)   TCP拥塞控制-快速重传

![快速重传](https://user-images.githubusercontent.com/5608425/63579882-3121b580-c5c6-11e9-8483-c53b4ec03fe6.jpg)  快速重传

</div>

> 拥塞窗口是为了怕把网络塞满，在出现丢包的时候减少发送速度.
  滑动窗口就是为了怕把接收方塞满，而控制发送速度.



## 参考:
1. [TCP 的那些事儿（下）](https://coolshell.cn/articles/11609.html)
2. [（四）：网络性能排查之TCP重传与重复ACK](https://www.kancloud.cn/digest/wireshark/62473)
3. [怎么让不可靠的UDP可靠？](http://www.dataguru.cn/article-12653-1.html)
4. [趣谈Linux操作系统 - 45-发送网络包（上）：如何表达我们想让合作伙伴做什么？]()