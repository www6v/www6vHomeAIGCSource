---
title: (Survey)数据处理
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
  

# 参考
1. 《大规模语言模型》 
2. 《Data-centric Artificial Intelligence: A Survey》 大学
   [Data-centric Artificial Intelligence: A Survey](https://zhuanlan.zhihu.com/p/620890799)
    [机器学习数据工程的概述](https://cloud.tencent.com/developer/article/2359824)
3. 《Data Management For Large Language Models: A Survey》huawei
    [大模型的数据管理——论文精读](https://blog.csdn.net/weixin_60760661/article/details/136058893)   
    [Data Management for LLM](https://github.com/www6v/data_management_LLM)

1xx. [大模型时代下数据的重要性](https://zhuanlan.zhihu.com/p/639207933) 综述

1xx. [大模型研发核心：数据工程、自动化评估及与知识图谱的结合](https://hub.baai.ac.cn/view/28740)
   [大模型研发核心：数据工程、自动化评估及与知识图谱的结合 ](https://mp.weixin.qq.com/s/SvDnQD886E3DBtw8k9asgg)

1xx. [符尧：别卷大模型训练了，来卷数据吧！【干货十足】](https://blog.csdn.net/qq_16949707/article/details/133875958) 看最后的5个结论 

1xx. [值得一看的大模型预训练数据选择策略总结：兼读20240229大模型进展早报 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648409027&idx=1&sn=4083853fd0bfb1790d8df6b4414b6583)
《A Survey on Data Selectionfor Language Models》

50. {% post_link 'gptInstructTuning' %} self

###    质量->多样性, 复杂度
20. {% post_link 'gptDataWizard' %}   self 

###  指令数据-高质量
1xx. [如何从数据集中自动识别高质量的指令数据-IFD指标的使用](https://zhuanlan.zhihu.com/p/658128530)

1xx. [大模型微调技巧 | 高质量指令数据筛选方法-MoDS](https://zhuanlan.zhihu.com/p/671183709)


### 数据增强
1xx. [哈工大｜15种NLP数据增强方法总结与对比](https://zhuanlan.zhihu.com/p/420295576)
    

### 数据质量
1xx. [再看大模型预训数据质量如何评估：困惑度、错误L2范数和记忆化三种度量方法的效果对比分析研究](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403976&idx=1&sn=694db5e2b3085b1610e8d19daa93a474)

