---
title: Serverless 优化和挑战
date: 2022-06-03 22:24:51
tags:
  - serverless
categories: 
  - 云原生
  - serverless
---

<p></p>
<!-- more -->

##  挑战和优化

###  加快函数运行环境的创建
1. AWS Lambda 中使用的方法是维护一个热的 VM 实例池[5]


2. 阿里Cloud Service Engine(CSE) 内部产品， 应用容器启动加速[3]
+ L1: 容器提前启动，并且对容器进行冻结。
    应用实例 CPU 占用率为0，RAM 占用相当于之前的1/20。
+ L2: 磁盘快照： 容器持久化到磁盘
    时间消耗主要是数据的网络传输时间+内存拷贝时间。
+ L3: 完全冷启动
<div style="text-align: center; width: 80%; height: 80%"> 

   ![ali-serverless-optimiaze](https://user-images.githubusercontent.com/5608425/66549078-18b92a80-eb75-11e9-9c23-f86a1e711934.jpg)
</div>

3. 阿里云  函数计算的预留实例[11]
   预留实例的执行环境是长驻的，彻底消除冷启动对业务的影响
4. [9]
5. AWS Lamdba的延迟因素
+ 函数运行的并发限制： 1000
+ 冷启动时间
  预配置并发，预热Lambda执行环境
  预配置并发，使用环境来立即执行代码
+ 监控
  X-Ray APM

###  混合部署
更小的资源占用率， 更短的运行时间更易于混合部署。[3][5]


参考
+ 3. [研发运维效率提升100%，机器成本下降50%，阿里巴巴在 Serverless 计算领域的探索](https://mp.weixin.qq.com/s/Gj_qPPTn6KN065qUu6e-mw)  阿里 
   I. 提高启动时间 II. 混合部署  优化
      [CSE：阿里在线应用如何演进成Serverless架构](https://yq.aliyun.com/articles/702070)
+ 9. [分享 KubeCon 2019 （上海）关于 Serverless 及 Knative 相关演讲会议](https://yq.aliyun.com/articles/706537)
   加速：无服务器平台中的冷启动优化; Knative Serving 内部介绍      
+ 11. [预留实例简介](https://help.aliyun.com/document_detail/138103.html)  优化


##  Concern

<div style="text-align: center; width: 70%; height: 70%">

![concerns-serverless3](https://user-images.githubusercontent.com/5608425/66986650-de5e0900-f0f1-11e9-819a-911d21d9d0ba.jpg)
</div>


+ StartUp Latency[3][9][11]

+ Best Practice[14][1]         
  - 1.[让业务感知不到服务器的存在——基于弹性计算的无服务器化实践](https://cloud.tencent.com/developer/article/1158774)  腾讯 未 <br> 
  - 14.[Serverless下日志采集、存储、分析实践](https://yq.aliyun.com/articles/656329)   最佳实践 


+ Tool 开放工具[10] 监控[14]  
  - 10.[函数计算 2.0 重磅发布，Serverless Computing 开启新篇章](https://yq.aliyun.com/articles/719694)
    开发工具 fun，vscode插件  
      
      
+  knowledge[4][5][6][15]
   - 4.[云计算中的Xaas](../../../../2019/02/07/xaas/) self      
   - 5.[无服务计算的未来和挑战: A Berkeley View on Serverless Computing](https://mp.weixin.qq.com/s/7qJUzf8xrGihPPLsvwPEig) good
   - 6.[当我们在聊Serverless时你应该知道这些](https://yq.aliyun.com/articles/574222)  阿里 竹涧， 场景 产品 架构
   - 15.[阿里云函数计算 - 事件驱动的serverless计算平台](https://yq.aliyun.com/articles/60966) 
      
+  vender lock-in [12][13][17]  
   采用Serverless架构之后，代码都是各个平台的Lambda代码片段，没法迁移。从客户的角度来看，是不希望自己被某家云厂商所绑架的。所以云计算需要有一个标准，产品需要标准化，方便用户无缝在各种云之间迁移。
   knative试图解决这个问题。             
   - 12. [0基础快速入门运维-EDAS Serverless(FAAS) 产品评测](https://yq.aliyun.com/articles/683675)
   - 13. [大道至简 - 基于Docker的Serverless探索之旅](https://yq.aliyun.com/articles/59483) 产品 
   - 17. [对Serverless架构的一点体验和思考](https://yq.aliyun.com/articles/160370) aws的lambda; serverless的缺点和挑战 



## 参考
+ 5. [无服务计算的未来和挑战: A Berkeley View on Serverless Computing](https://mp.weixin.qq.com/s/7qJUzf8xrGihPPLsvwPEig) good



