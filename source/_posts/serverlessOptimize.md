---
title: Serverless 优化
date: 2022-06-03 22:24:51
tags:
  - serverless
categories: 
  - 云原生
  - serverless
---

<p></p>
<!-- more -->

##  优化

### 平台侧优化 [1]
+ 冷启动（Cold Start）的耗时大部分和以下 4 个方面有关。
  + 1.资源调度和容器创建过程： 一般在秒级别时间完成；
    - 按需加载
    - P2P 加速
  + 2.代码和依赖层的下载过程：取决于代码大小以及是否有加速，一般从毫秒到秒级别不等；
    - 常用依赖的内置化
  + 3.VPC 网络的打通过程：主要是弹性网卡和路由下发耗时，通常在秒级别；
    - 在集群 VPC 内部创建代理
  + 4.运行时与用户代码初始化过程：和用户比较贴近，依据不同的语言，启动时间会有所影响，大概在毫秒到秒之间不等。 -加快函数运行环境的创建
    - 自动扩缩容
      - 基于函数互相调用的场景进行提前预测
      - 基于函数的版本进行预测
    - 根据提前加载镜像的方式，部署到 Node 中

+ 4.1  阿里Cloud Service Engine(CSE) 内部产品， 应用容器启动加速[3]
  + L1: 容器提前启动，并且对容器进行冻结。
     应用实例 CPU 占用率为0，RAM 占用相当于之前的1/20。
  + L2: 磁盘快照： 容器持久化到磁盘
    时间消耗主要是数据的网络传输时间+内存拷贝时间。
  + L3: 完全冷启动
<div style="text-align: center; width: 80%; height: 80%"> 

   ![ali-serverless-optimiaze](https://user-images.githubusercontent.com/5608425/66549078-18b92a80-eb75-11e9-9c23-f86a1e711934.jpg)
</div>
CSE 则通过将一个应用的多个实例启动后，共享相同的指令数据，抽取出不同的指令数据，每次启动实例只需要加载多实例的**差异部分**

+ 4.2 AWS Lambda 中使用的方法是维护一个热的 VM 实例池[5]

+ 4.3 AWS Lamdba的延迟因素
  + 函数运行的并发限制： 1000
  + 冷启动时间
    预配置并发，预热Lambda执行环境
    预配置并发，使用环境来立即执行代码

###  5 用户侧的优化手段 [1]
  - 合理控制代码包的大小；
  - 选择性能较高的运行时；
  - 成本可控范围内合理使用**预留实例**；
    阿里云  函数计算的预留实例[11]
    预留实例的执行环境是长驻的，彻底消除冷启动对业务的影响
  - **定时任务激活**延时敏感较高的函数实例；
  - 本地缓存的的合理利用。


#####  混合部署
更小的资源占用率， 更短的运行时间更易于混合部署。[3][5]


## 参考
1.《04｜冷启动：如何加快函数的第一次调用过程？》 《Serverless进阶实战课》
3. [研发运维效率提升100%，机器成本下降50%，阿里巴巴在 Serverless 计算领域的探索](https://mp.weixin.qq.com/s/Gj_qPPTn6KN065qUu6e-mw)  阿里 
   I. 提高启动时间 II. 混合部署  优化
      [CSE：阿里在线应用如何演进成Serverless架构](https://yq.aliyun.com/articles/702070)
5. [无服务计算的未来和挑战: A Berkeley View on Serverless Computing](https://mp.weixin.qq.com/s/7qJUzf8xrGihPPLsvwPEig) ***      
9. [分享 KubeCon 2019 （上海）关于 Serverless 及 Knative 相关演讲会议](https://yq.aliyun.com/articles/706537)
   《加速：无服务器平台中的冷启动优化》- [腾讯云函数计算冷启动优化实践](https://cloud.tencent.com/developer/article/1461709)
    《Knative Serving 内部介绍》      
11. [预留实例简介](https://help.aliyun.com/document_detail/138103.html)  优化





