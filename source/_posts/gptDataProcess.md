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

# 数据处理 pipeline
## 数据处理[通用] [1]
{% asset_img  'data_process.png' %}

### 质量过滤
+ 基于**分类器**的方法
+ 基于**启发 式**的方法

### 冗余去除
可以在**句子级**、**文档级**和**数据集级**等不同粒度上去重
在实践中应该 共同使用这三个级别的去重

### 词元切分
+ BPE
+ WordPiece
+ Unigram 词元分析

## 数据处理[2]
{% asset_img 'pipeline.webp' %}
### 数据标记
+ 包标签
+ 半监督标签
+ 主动学习
+ 数据编程
+ 远程监督

### 数据准备

### 数据增强

# 数据管理[3]
### Pretraining of LLM
+ Data Quantity
  - **Scaling Laws**
  - Data Repetition

+ Data Quality
  - Deduplication
    - N-gram和Hash技术
      **MinHash算法**
    - 神经网络方法
    - 语义去重
      SemDeDup
  - Quality Filtering   
    - **分类器**
    - **启发式规则**
    - 阈值过滤
      例如基于困惑度（Perplexity）
  - Diversity & Age
    - **数据多样性（Diversity）**
    - 数据时效性（Age）    

### SFT
+ Data Quantity

+ Data Quality
  - Instruction Quality
    Instruction Mining,  LIMA
  - **Instruction Diversity**
    **Self-Instruct**,  **#InsTag**， Alpaca
  - **Instruction Complexity** 
    **WizardLM**,  **#InsTag**, **Evol-Instruct**
  - Prompt Design
  
# 案例
## 千帆Llama 2中文增强技术介绍-SFT[30]
### 数据增强
+ Self-instruct
+ wizard [20]

### 数据精简
+ 低质量过滤
+ 相似数据过滤

### 数据配比
+ 领域数据
+ 多语言数据


## 度小满轩辕金融大模型[31]
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
+ Self-Instruct
+ Evol-Instruct


# 参考
1. 《大规模语言模型》 
2. 《Data-centric Artificial Intelligence: A Survey》
   [Data-centric Artificial Intelligence: A Survey](https://zhuanlan.zhihu.com/p/620890799)
    [机器学习数据工程的概述](https://cloud.tencent.com/developer/article/2359824)
3. 《Data Management For Large Language Models: A Survey》
    [大模型的数据管理——论文精读](https://blog.csdn.net/weixin_60760661/article/details/136058893)   
    [Data Management for LLM](https://github.com/www6v/data_management_LLM)

1xx. [大模型时代下数据的重要性](https://zhuanlan.zhihu.com/p/639207933) 综述

1xx. [大模型研发核心：数据工程、自动化评估及与知识图谱的结合](https://hub.baai.ac.cn/view/28740)
   [大模型研发核心：数据工程、自动化评估及与知识图谱的结合 ](https://mp.weixin.qq.com/s/SvDnQD886E3DBtw8k9asgg)

50. {% post_link 'gptInstructTuning' %} self

### 案例
30. 《千帆增强版 Llama 2》 百度 有ppt
31. 《金融行业实战：度小满轩辕金融大模型应用探索与开发实践》 百度  有ppt

1xx. [也看大模型训练语料如何清洗：Common Crawl概述、代表性清洗方案及代码实现          ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648399885&idx=1&sn=4f49c5148715c38aa4eaee3080435f17) 代码
   [GPT-3 训练语料 Common Crawl 处理流程](https://zhuanlan.zhihu.com/p/610659484?utm_id=0)

###    质量->多样性, 复杂度
20. [如何构造复杂多样的微调指令数据：WizardLM复杂指令构造思想与实验分析工作总结 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401462&idx=1&sn=764f0302918174cea29ae22ac5760033) 

1xx. [大模型微调究竟需要多少数据：从三个现有代表工作看几组结论及一点思考 ](https://mp.weixin.qq.com/s/c50HrOfKOqgqGPVRHf6EpA)
     **指令格式的多样性**

### 数量->scaling law  
1xx. [数据为王: Textbooks Are All You Need ](https://finisky.github.io/textbooks-are-all-you-need-summary/)   以小博大  打破传统语言模型缩放定律 


###  指令数据
1xx. [如何从数据集中自动识别高质量的指令数据-IFD指标的使用](https://zhuanlan.zhihu.com/p/658128530)

1xx. [大模型微调技巧 | 高质量指令数据筛选方法-MoDS](https://zhuanlan.zhihu.com/p/671183709)

###  数据标签
1xx. [InsTag：大语言模型监督微调数据标签标注工具](https://developer.aliyun.com/article/1311807)
   [InsTag指令打标工具](https://www.modelscope.cn/studios/lukeminglkm/instagger_demo/summary) demo

### 数据增强
1xx. [哈工大｜15种NLP数据增强方法总结与对比](https://zhuanlan.zhihu.com/p/420295576)

### 数据质量
1xx. [再看大模型预训数据质量如何评估：困惑度、错误L2范数和记忆化三种度量方法的效果对比分析研究](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403976&idx=1&sn=694db5e2b3085b1610e8d19daa93a474)

