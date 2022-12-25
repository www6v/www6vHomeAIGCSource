---
title: Serverless  关注点
date: 2022-06-25 22:09:48
tags:
  - serverless
categories: 
  - 云原生
  - serverless
---

<p></p>
<!-- more -->

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

