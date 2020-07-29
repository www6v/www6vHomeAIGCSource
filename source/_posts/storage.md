---
title: 非结构化存储
date: 2019-10-08 14:27:25
tags:
  - 存储
categories: 
  - 分布式
  - 存储
  - 总结  
---

<p></p>
<!-- more -->

| 块存储| 文件存储 |对象存储
:-:|:-:|:-:|:-:
概念|本地存储| 有目录树结构| 将数据和元数据当做一个对象
分布式| ×| √ | √
文件大小| 大小都可以| 适合大文件| 适合各种大小
接口| Diver，kernel module| POSIX<br> NFS/SMB协议 | Restful API
典型技术 | SAN | HDFS、GFS<br>  NAS存储  | Swift， Amazion S3， 阿里OSS
场景|  云主机本地存储 | 共享存储 | 音频，视频，图片。 <br> 网站资源动静分离; 网盘


## 块存储
必须连接到相关的虚拟机，才能访问它里面的数据。

## 对象存储
+ 通过高层的 API 和 SDK 来和它进行交互
+ 更接近一个键值（Key-Value）形式的存储服务
  （url，对象的二进制）
+ 存储分层
{% asset_img  object-storage.JPG   存储分层 %}
+ 对象的版本管理（Versioning）

## 参考:
1. [块存储、文件存储、对象存储意义及差异](https://www.cnblogs.com/hukey/p/8323853.html)
2. [块存储、文件存储、对象存储这三者的本质差别是什么？](https://www.zhihu.com/question/21536660)
3. [【云吞铺子】阿里云三种存储产品该怎么选择](https://help.aliyun.com/video_detail/71173.html?spm=5176.13394938.0.0.4f436b24YVoclI)
4. [深入浅出云计算 - 10 | 对象存储：看似简单的存储服务都有哪些玄机？]() 何恺铎


