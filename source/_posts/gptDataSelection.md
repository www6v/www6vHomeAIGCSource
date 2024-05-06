---
title: (原理)Data Selection
date: 2023-05-05 19:14:41
tags:
  - Data Selection
categories: 
  - AIGC
  - Data Selection  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# IFD[1]
+ 三个步骤
  - Learning from Brief Experience
    利用少量进行进行**模型初学** 
  - Evaluating Based on Experience 
    利用初学模型计算原始数据中所有**IFD指标**
    - 算法
      - 条件回答分数（ Conditioned Answer Score，CAS）
      - 直接答案分数（Direct Answer Score，DAS）
      - 指令跟随难度（Instruction-Following Difficulty，IFD）分数
  - Retraining from Self-Guided Experience
    利用**樱桃数据**进行模型**重训练**


# MoDS[2]
+ 质量筛选
  采用OpenAssistant的**reward-model**-debertav3-large-v2模型（一个基于**DeBERTa架构**设计的奖励模型）对数据进行**质量打分**。

+ 多样性筛选
  为了避免所选质量数据高度相似，通过**K-Center-Greedy算法**进行数据筛选，在最大化多样性的情况下，使指令数据集最小。
  在该步骤中，采用**BERT模型**为指令数据生成句向量来计算不同数据之间的距离。

+ 必要性筛选
  
# DEITA [3]
### 复杂性评分
+ 复杂性评估的方法  
  - Random Selection：随机选择样本。
  - Instruction Length：按照指令的长度计算复杂性。
  - **Perplexity**：通过预训练模型计算回复的困惑度作为复杂性指标，困惑值越大意味着数据样本越难。
  - **Direct Scoring**：利用ChaGPT给指令的复杂性打分。
  - Instruction Node：利用ChatGPT将指令转换成语义树，通过树的节点数作为复杂性指标。
  - **Instag Complexity**：利用ChatGPT对部分数据进行打标签，再训练一个Llama模型，再利用训练后的Llama模型对全量数据预测，标签越多说明数据约复杂。
  - **IFD**：指令跟随难度作为复杂性指标。  

DEITA评估复杂性的方法，主要先对一个小规模种子数据集（2k）进行数据复杂性**扩展**，再利**用ChatGPT对扩展数据进行打分**，并**训练一个Llama1-7B的模型**，最后利用训练后的模型对数据的打分作为复杂性评估指标。

### 质量评分
+ 质量评估的方法有
  - Random Selection：随机选择样本。
  - Response Length：采用输出长度作为质量评估指标。
  - Direct Scoring：利用ChatGPT直接评估对特定指令输出结果的准确性。

DEITA评估质量的方法，**与评估复杂性方法一致**。先对一个小规模种子数据集（2k，与复杂性数据一致）进行数据质量扩展，再利用ChatGPT对扩展数据进行打分并训练一个Llama1-7B的模型，最后利用训练后的模型对数据的打分作为质量评估指标。

**数据质量扩展**，通过特殊的提示词利用ChatGPT对数据的回复部分进行改写，主要是增强回复的有用性、相关性、丰富深度、创造力和提供额外的细节描述。

### 多样性筛选
多样性筛选方法，首先将数据池中的数据按照复杂性和质量的综合得分（复杂性分数*质量分数）进行降序**排序**；
然后按顺序逐个取出样本数据x ，**计算x 与筛选池中相邻最近的样本之间距离值**，其中，数据利用Llama1-13B模型进行向量表征，距离计算采用**余弦相似度**。
如果**距离值小于 r时**，认为该样本与筛选池中数据相似程度不高，可以**纳入筛选池**；否则**不纳入筛选池**。当筛选池中样本数达到规定样本个数，完成多样性筛选。

# 参考
1. [如何从数据集中自动识别高质量的指令数据-IFD指标的使用](https://zhuanlan.zhihu.com/p/658128530)
   《From Quantity to Quality: Boosting LLM Performance with Self-Guided Data Selection for Instruction Tuning》
   ChatLaw就这么训的
   
2. [大模型微调技巧 | 高质量指令数据筛选方法-MoDS](https://zhuanlan.zhihu.com/p/671183709)
   《MoDS: Model-oriented Data Selection for Instruction Tuning》
    质量筛选， 多样性筛选，必要性筛选   

3. [DEITA-大模型指令微调的数据高效筛选方法](https://zhuanlan.zhihu.com/p/675928711)

1xx. [DEITA：融合复杂度、质量、多样性的高效数据筛选](https://zhuanlan.zhihu.com/p/687339776)
   复杂度、质量、多样性

1xx. [值得一看的大模型预训练数据选择策略总结：兼读20240229大模型进展早报 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648409027&idx=1&sn=4083853fd0bfb1790d8df6b4414b6583)
《A Survey on Data Selection for Language Models》



