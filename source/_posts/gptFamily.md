---
title: GPT1-2-3， InstructGPT
date: 2023-12-11 16:21:04
tags:
  - GPT
categories: 
  - AIGC
  - GPT  
---

<p></p>
<!-- more -->

# GPT1 [1]
1. 它是最早一批提出在 NLP 任务上使用 **pre-train + fine-tuning 范式**的工作。
2. GPT 的实验证明了模型的精度和泛化能力会随着解码器层数增加而不断提升，而且目前还有提升空间
3. **预训练模型具有 zero-shot 的能力**，并且能随着预训练的进行不断增强

# GPT2 [1]
### 核心思想
当模型的容量非常大且数据量足够丰富时，仅仅靠语言模型的学习便可以完成其他有监督学习的任务，**不需要在下游任务微调**。

### GPT-2 vs. GPT-1
1. **主推 zero-shot**，而 GPT-1 为 pre-train + fine-tuning；
2. 训练数据规模更大，GPT-2 为 800w 文档 40G，GPT-1 为 5GB；
3. 模型大小，GPT-2 最大 15 亿参数，GPT-1为 1 亿参数；
4. 模型结构调整，层归一化和参数初始化方式；
5. 训练参数，batch_size 从 64 增加到 512，上文窗口大小从 512 增加到 1024，等等；

# GPT3 [1]
### 下游任务评估方法
GPT-3 在下游任务的评估与预测时，提供了三种不同的方法：
**Zero-shot**：仅使用当前任务的自然语言描述，不进行任何梯度更新；
**One-shot**：当前任务的自然语言描述，加上一个简单的输入输出样例，不进行任何梯度更新；
**Few-shot**：当前任务的自然语言描述，加上几个简单的输入输出样例，不进行任何梯度更新；

+ Shot[2]
  - One-shot
  - Few-Shot
  - Zero-Shot

### Few-shot vs fine-tuning 
其中 **Few-shot** 也被称为 **in-context learning**，虽然它与 fine-tuning 一样都需要一些**有监督标注数据**，但是两者的区别是：
【本质区别】**fine-tuning** 基于标注数据**对模型参数进行更新**，而** in-context learning **使用标注数据时不做任何的梯度回传，**模型参数不更新**；

### GPT-3 vs. GPT-2
1. 效果上，超出 GPT-2 非常多，能生成人类难以区分的新闻文章；
2. **主推 few-shot**，相比于 GPT-2 的 zero-shot，具有很强的创新性；
3. 模型结构略微变化，采用 **sparse attention** 模块；
4. 海量训练语料 45TB（清洗后 570GB），相比于 GPT-2 的 40GB；
5. 海量模型参数，最大模型为 1750 亿，GPT-2 最大为 15 亿参数；

# InstructGPT [1]

# 参考
1. [GPT / GPT-2 / GPT-3 / InstructGPT 进化之路](https://zhuanlan.zhihu.com/p/609716668) ***

2. [Few-Shot, Zero-Shot & One-shot 的通俗理解](https://zhuanlan.zhihu.com/p/624793654)