---
title: Function Call
date: 2022-11-16 15:32:04
tags:
  - Function Call
categories: 
  - AIGC
  - Function Call  
---

<p></p>
<!-- more -->

# Function Call
### 调用顺序  [0] [1][2]

+ Function Calling 整个功能的调用顺序大致如下
  - 声明函数：定义当前函数的名称，描述，以及对应的参数信息，并请求对应的接口；
  - 解析函数参数：接受对应的接口返回，并解析对应的函数参数信息；
  - 执行函数：根据对应的参数信息调用本地函数；
  - 上报结果：将本地函数执行的结果上报给 Chat 接口；

{% asset_img 'functioncall1.png' %}

### 代码 [2]



### goal

 The goal of the OpenAI Function APIs is to more reliably return valid and useful function calls than a generic text completion or chat API.



# 参考
0. [大模型开发(十一)：Chat Completions模型的Function calling功能详解](http://lihuaxi.xjx100.cn/news/1382737.html) 

1. [如何使用Chat Completions接口的函数调用功能](https://www.duidaima.com/Group/Topic/OtherTools/13709)

2. [OpenAI开发系列（十一）：Function calling功能的实际应用流程与案例解析](https://blog.csdn.net/Lvbaby_/article/details/131892482)   代码  流程图
   [代码](https://github.com/www6v/AIGC/tree/master/Function%20calling%E5%8A%9F%E8%83%BD%E7%9A%84%E5%AE%9E%E9%99%85%E5%BA%94%E7%94%A8%E6%B5%81%E7%A8%8B%E4%B8%8E%E6%A1%88%E4%BE%8B%E8%A7%A3%E6%9E%90)

101. [OpenAI开发系列（十三）：利用Function calling功能开发基于大模型的实时天气查询助手](https://blog.csdn.net/Lvbaby_/article/details/131933871) 未

102. [OpenAI开发系列（十二）：Function calling功能的流程优化与多轮对话实现](https://blog.csdn.net/Lvbaby_/article/details/131912170) 未

