---
title: 大模型 综述
date: 2022-10-30 19:10:21
tags:
  - 大模型
categories: 
  - AIGC
  - 大模型  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


# LLMs的背景[1]
### Scaling law of LLMs
+ KM scaling law
+ Chinchilla Scaling law

### LLMs的涌现能力
+ in-context learning
+ instruction following
+ step-by-step reasoning

### 大语言模型的关键技术 ***
+ Scaling
+ Training
+ Ability Eliciting
+ Alignment Tuning
+ Tool Manipulation

# Pre-training[1]
### 数据收集
### 架构
### 模型训练 ***
+ 优化设置
  - Batch Training
  - Learning Rate
  - Optimizer
  - Stabilizing the Training

+ 可扩展的训练技巧
  - 3D并行
    数据并行 +  流水线并行 + 张量并行
  - ZeRO
  - 混合精度训练
  - 总体训练建议

# Adaptation Tuning of LLMs[1]
### 指令调优 ***
本质上，指令微调是在**自然语言格式的实例（instance）集合上**微调预训练后的 LLM 的方法 [62]。

指令微调后，LLM 可以展现出**泛化到未见过任务**的卓越能力 [28, 62, 64]，即使在多语言场景下也能有不错表现 [98]。

#####  格式化实例的构建
+ 格式化已有数据集
+ 格式化人类需求
+ 构建实例的关键因素
  - **增加指令**
  - **设计格式**

总的来说，指令**多样性似乎比实例数量更重要**

##### 指令微调策略
+ **平衡数据分布**
一种广泛使用的方法是实例比例混合策略 [87]，即将所有数据集合并，然后从混合数据集中按比例采样每种实例。
此外，根据最近的研究发现 [64, 99]，**提高高质量数据集（例如 FLAN [62] 和 P3 [209]）的采样比例**通常可以带来**性能提升**。

+ 结合指令微调和预训练
为了使微调过程更加有效和稳定，OPT-IML [99] 在**指令微调期间加入了预训练数据**，这可以看作是对模型的正则化（regularization）。

具体而言，GLM-130B [97] 和 Galactica [34] 将**指令格式数据集作为预训练语料库的一小部分来预训练 LLM**，这有可能同时获得预训练和指令微调的优势。

#####  指令微调的效果
+ 性能改进
最近的研究在多个规模上（从 7700 百万到 5400 亿不等）对 LM 进行了实验，**表明不同规模的模型都可以从指令微调中受益 [64, 216]，随着参数规模的增加，性能也得到了提升 [98]**。 【普适性】

此外，**经过指令微调的较小模型甚至可以比未经微调的较大模型表现更好 [28, 64]**。

+ 任务泛化性
todo

### 对齐调优
### 高效调优


# 参考
1. [大语言模型综述](http://aibox.ruc.edu.cn/docs/2023-08/cb9badcb213f4c8b89d00d579eed4a4c.pdf) 中文  v10 
     [大语言模型综述](https://github.com/RUCAIBox/LLMSurvey/blob/main/assets/LLM_Survey_Chinese.pdf) 中文
     [A Survey of Large Language Models](https://arxiv.org/pdf/2303.18223.pdf) 英文
     [LLMSurvey](https://github.com/www6v/LLMSurvey)  github
     [[论文]大语言模型综述](https://zhuanlan.zhihu.com/p/630203554) 
     [详谈大模型训练中的数据收集、处理与模型影响：A Survey of Large Language Models工作中的数据总结](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648400817&idx=1&sn=c1ed1c9c87bf2526e02d21d84429c5cf)
     

