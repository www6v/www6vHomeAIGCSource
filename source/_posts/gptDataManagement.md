---
title: (Survey)Data Management  
date: 2023-04-27 16:44:48
tags:
  - DataManagement
categories: 
  - AIGC
  - DataManagement   
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

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
3. 《Data Management For Large Language Models: A Survey》huawei
    [大模型的数据管理——论文精读](https://blog.csdn.net/weixin_60760661/article/details/136058893)   
    [Data Management for LLM](https://github.com/www6v/data_management_LLM)
    
###  指令数据-高质量
1xx. [如何从数据集中自动识别高质量的指令数据-IFD指标的使用](https://zhuanlan.zhihu.com/p/658128530)
1xx. [大模型微调技巧 | 高质量指令数据筛选方法-MoDS](https://zhuanlan.zhihu.com/p/671183709)