---
title: 数据处理
date: 2023-02-05 18:12:12
tags:
  - dataProcess
categories: 
  - AIGC
  - dataProcess   
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 数据处理[通用] [1]
{% asset_img  'data_process.png' %}

### 质量过滤
+ 基于分类器的方法
+ 基于启发 式的方法

### 冗余去除
可以在**句子级**、**文档级**和**数据集级**等不同粒度上去重
在实践中应该 共同使用这三个级别的去重

### 隐私消除

### 词元切分
+ BPE
+ WordPiece
+ Unigram 词元分析


# 案例
## 千帆Llama 2中文增强技术介绍-SFT[2]
### 数据增强
+ Self-instruct
+ wizard [3]

### 数据精简
+ 低质量过滤
+ 相似数据过滤

### 数据配比
+ 领域数据
+ 多语言数据


## 度小满轩辕金融大模型[4]
### 通用的数据清洗流水线
+ 文本抽取
  + 多来源数据收集
  + 正文提取
+ 数据清洗
  + 规则过滤
  + 模型过滤
+ 去重与校验
  + MinHashLSH
  + 质量校验

### 增量预训练 最佳数据配比
+ **英文数据  vs 中文数据**
  **1  :  3**

+ 中文数据中的  **通用数据 vs 金融数据**  
  从 9:1 变成  **4:1**
  + 通用领域指令数据
   8大类 50小类
  + 金融领域指令数据
   4大类 20小类

### 构造通用和金融指令数据
{%  asset_img  'data.jpeg'  %}
+ Self-Instruct[5]
+ Evol-Instruct[5]


# 微调指令的生成 [20][21]

# 参考
1. 《大规模语言模型》 
2. 《千帆增强版 Llama 2》 百度 有ppt
3. [如何构造复杂多样的微调指令数据：WizardLM复杂指令构造思想与实验分析工作总结 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401462&idx=1&sn=764f0302918174cea29ae22ac5760033) 
4. 《金融行业实战：度小满轩辕金融大模型应用探索与开发实践》 百度  有ppt
5. {% post_link 'gptInstructTuning' %}
### overview
1xx. [Data-centric Artificial Intelligence: A Survey](https://zhuanlan.zhihu.com/p/620890799)
   [机器学习数据工程的概述](https://cloud.tencent.com/developer/article/2359824)

1xx. [大模型时代下数据的重要性](https://zhuanlan.zhihu.com/p/639207933) 综述

1xx. [大模型研发核心：数据工程、自动化评估及与知识图谱的结合](https://hub.baai.ac.cn/view/28740)
   [大模型研发核心：数据工程、自动化评估及与知识图谱的结合 ](https://mp.weixin.qq.com/s/SvDnQD886E3DBtw8k9asgg)

### 
1xx. [数据为王: Textbooks Are All You Need ](https://finisky.github.io/textbooks-are-all-you-need-summary/)

1xx. [数据为王：大模型预训练中的数据处理及思考—The RefinedWeb Dataset for Falcon LLM论文解读](https://zhuanlan.zhihu.com/p/641013454)

1xx. [大模型微调究竟需要多少数据：从三个现有代表工作看几组结论及一点思考 ](https://mp.weixin.qq.com/s/c50HrOfKOqgqGPVRHf6EpA)
   <<LIMa：Less Is More for Alignment>>

1xx. [再谈大模型的预训数据清洗与微调数据生成：RedPajama数据处理框架与entity-centric指令生成方法解读 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648402104&idx=1&sn=7d4924b2a5a840e4ff3de43299248b1d)
    llama数据的复现项目SlimPajama

1xx. [“超越LLama 65B”的Falcon40B语言模型为什么好：再看精细化的数据清洗的重要性 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401484&idx=1&sn=c49b5ca5fc962ca757d3a082b74f037a) 

1xx. [面向大模型微调的instruction指令自动化生成技术：SELF-INSTRUCT指令自动化生成框架工作介绍](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648399792&idx=1&sn=c70e1d13b68399b0c19cfbf658f35d77)

###  指令数据
20. [大模型SFT微调指令数据的生成](https://zhuanlan.zhihu.com/p/650596719)

21. [让ChatGPT生成训练ChatGPT的训练数据](https://zhuanlan.zhihu.com/p/618334308)


1xx. [如何从数据集中自动识别高质量的指令数据-IFD指标的使用](https://zhuanlan.zhihu.com/p/658128530)

1xx. [大模型微调技巧 | 高质量指令数据筛选方法-MoDS](https://zhuanlan.zhihu.com/p/671183709)

### 其他
1xx. [哈工大｜15种NLP数据增强方法总结与对比](https://zhuanlan.zhihu.com/p/420295576)


1xx. [再看大模型预训数据质量如何评估：困惑度、错误L2范数和记忆化三种度量方法的效果对比分析研究](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403976&idx=1&sn=694db5e2b3085b1610e8d19daa93a474)

1xx. [InsTag：大语言模型监督微调数据标签标注工具](https://developer.aliyun.com/article/1311807)
   [InsTag指令打标工具](https://www.modelscope.cn/studios/lukeminglkm/instagger_demo/summary) demo



1xx. [开源大模型如何更好地适应中文场景：LLAMA扩充词表、BLOOM裁剪词表基本原理与开源实现](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648400849&idx=1&sn=58006756cccde4d06d273df59e2c8dd8)