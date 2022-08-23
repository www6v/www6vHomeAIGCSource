---
title: 存储
date: 2019-10-08 14:27:25
tags:
  - 存储
categories: 
  - 云计算
  - 存储
  - 总结  
---

<p></p>
<!-- more -->

/ | 块存储| 文件存储 |对象存储
:-:|:-:|:-:|:-:
概念|本地存储| 有目录树结构| 将数据和元数据当做一个对象
分布式| ×| √ | √
文件大小| 大小都可以| 适合大文件| 适合各种大小
接口| Diver，kernel module| POSIX<br> NFS/SMB协议 | 语义简单，基于HTTP协议访问，Restful API
典型技术 | 直连，FC SAN， IP SAN(iSCSI) | HDFS、GFS<br>  NAS存储: 以太网承载的NFS <br>   | Swift， Amazion S3， 阿里OSS
场景|  专用领域<br> 高性能，低延迟<br> 云主机本地存储 |  通用 <br> 高并发，共享<br> HPC高性能计算<br> 共享存储 | 海量，并发 <br>读多写少 <br> 音频，视频，图片。 <br> 网站资源动静分离; 网盘
数据结构（类比） | 数组| 二叉树 | hash表

## 存储设备[5]
+ DAS
  IDE, SATA, SCSI, SAS, USB
+ NAS
  NFS, CIFS
+ SAN
  SCSI, FC SAN, iSCSI(基于因特网及SCSI-3协议下的存储技术)

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
5. [马哥教育2021-Ceph分布式存储系统快速入门【涨薪30%+】](https://www.bilibili.com/video/BV17p4y1a7Em?p=2&spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036) P2

