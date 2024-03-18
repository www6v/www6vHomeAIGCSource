---
title: RefinedWeb
date: 2024-02-27 17:19:38
tags:
  - dataProcess
categories: 
  - AIGC
  - dataProcess   
---

<p></p>
<!-- more -->

# 动机[1]
+ 作者执着证明网页数据好于专有数据
  - 网页数据的量级比公开数据大的多，仅用专有数据模型模型训练不到最佳效果
  - 专有数据处理起来很麻烦
  - 大部分专有数据其实在网页数据中也能找到

作者认为要想模型训练的大、耗费的人力少就不得不重新**将网页数据精细化**利用起来。

# 结论[1]
+ 作者证明了仅用**web数据**如果经过恰当的**清洗和过滤**，可以获得超过使用了专有数据模型的效果。


# 文本处理Pipeline[1]
### 目标语言识别
### 规则过滤
### 通过机器学习方法过滤出高质量语料库
### 去重（Deduplication）

# 参考
1. [数据为王：大模型预训练中的数据处理及思考—The RefinedWeb Dataset for Falcon LLM论文解读](https://zhuanlan.zhihu.com/p/641013454)

1xx. [“超越LLama 65B”的Falcon40B语言模型为什么好：再看精细化的数据清洗的重要性 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401484&idx=1&sn=c49b5ca5fc962ca757d3a082b74f037a) 
   RefinedWeb Dataset for Falcon,   Falcon采用bloom架构

1xx. [再谈大模型的预训数据清洗与微调数据生成：RedPajama数据处理框架与entity-centric指令生成方法解读 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648402104&idx=1&sn=7d4924b2a5a840e4ff3de43299248b1d)
    llama数据的复现项目SlimPajama
