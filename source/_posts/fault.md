---
title: 故障模型
date: 2018-10-27 14:39:20
tags:
  - 故障模型
categories:
  - 稳定性
  - 故障模型
---

<p></p>
<!-- more -->

{% asset_img fault1.jpg 故障模型1 %}
{% asset_img fault2.jpg 故障模型2 %}


## 参考：

### 大纲
1. 超全总结 | 阿里如何应对电商故障？神秘演练细节曝光  阿里巴巴  周洋

### Application & Data
1. 不正当使用HashMap导致cpu 100%的问题追究 王宏江
2. [一个由正则表达式引发的血案](http://www.cnblogs.com/study-everyday/p/7426862.html)   CPU飚高
3. [垃圾收集GC总结](../../../../2014/07/16/gc/) self
4. [线程池最佳线程数](../../../../2014/07/02/threadNum/)  self
5. [如何检测 Web 服务请求丢失问题](https://mp.weixin.qq.com/s/QA_BTF1D3GJJ7_nYQ6oAzQ)  Nginx tracing + Tomcat tracing
6. [系统中的故障场景建模](https://www.infoq.cn/article/system_failure_modeling/)  应用层
7. 大方法 codecache  
8. [vjtools](https://github.com/vipshop/vjtools) 
9. [useful-scripts](https://github.com/oldratlee/useful-scripts) 
10. 如何排查Java内存泄露(内附各种排查工具介绍) 不闻
11. [生产环境下持久带满导致FullGC，如何跟踪](https://hllvm-group.iteye.com/group/topic/28379) 
12. [JVM性能调优](../../../../2017/11/27/optimize/) self
13. 听阿里巴巴JVM工程师为你分析常见Java故障案例  陆传胜
14. [从一个故障说说Java的三个BlockingQueue  阿里毕玄](http://hellojava.info/?p=464)
15. [Hystrix实现和容错模式](../../../../2016/10/07/Hystrix/)  self
16. [稳定性总结](../../../../2017/05/09/stability/)  self

### Runtime & Middleware & OS
1. [热点 Key 问题的发现与解决](https://help.aliyun.com/document_detail/67252.html) 阿里 文档

> 通常的解决方案主要集中在对**客户端**和**Server端**进行相应的改造。 
  I. 服务端本地缓存.
  II. 服务端分布式缓存。

> 阿里云方案 (整体看是用中间件 负载均衡 水平扩展)   
  I. 读写分离方案解决热读
     写 热备; 读 存储水平扩展
  II. 热点数据解决方案
     该方案通过主动**发现热点**并对其进行**存储**来解决热点Key的问题。

2. [UCloud高可用数据库UDB主从复制延时的解决](https://www.admin5.com/article/20190404/902952.shtml)

### Virtualization & Storage & Networking
1. [Kubernetes 网络疑难杂症排查分享](https://tencentcloudcontainerteam.github.io/2019/08/12/troubleshooting-with-kubernetes-network/)  腾讯云 good
2. [kubernetes 最佳实践：处理容器数据磁盘被写满](https://tencentcloudcontainerteam.github.io/2019/06/08/kubernetes-best-practice-handle-disk-full/) 腾讯云
3. [百度大规模战略性混部系统演进](https://www.infoq.cn/article/aEut*ZAIffp0q4MSKDSg)
