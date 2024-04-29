---
title: GPT 系列
date: 2022-12-11 16:21:04
tags:
  - GPT
categories: 
  - AIGC
  - GPT  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 进化时间线
{% asset_img 'family.jpg' %}

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
【本质区别】
**fine-tuning** 基于标注数据**对模型参数进行更新**
而**in-context learning**使用标注数据时不做任何的梯度回传, **模型参数不更新**

### GPT-3 vs. GPT-2
1. 效果上，超出 GPT-2 非常多，能生成人类难以区分的新闻文章；
2. **主推 few-shot**，相比于 GPT-2 的 zero-shot，具有很强的创新性；
3. 模型结构略微变化，采用 **sparse attention** 模块；
4. 海量训练语料 **45TB**（清洗后 570GB），相比于 GPT-2 的 40GB；
5. 海量模型参数，最大模型为 **1750 亿**，GPT-2 最大为 15 亿参数；

# InstructGPT [1]
### 步骤
+ 有监督微调，
+ 奖励模型训练，
+ 强化学习训练

###  技术方案
+ 有监督微调（SFT）
  本质上来说，**SFT 可以理解为人工标注了一批数据，然后去微调 GPT-3**。但是值得一提的是，这里**标注的数据与 GPT-3 之前用来做下游任务使用的 few-shot 格式，有非常本质的区别**。
  InstructGPT 在 SFT 中标注的数据，正是为了**消除这种模型预测与用户表达习惯之间的 gap**。在标注过程中，他们**从 GPT-3 的用户真实请求中采样**大量下游任务的描述，然后让**标注人员对任务描述进行续写**，从而得到该问题的高质量回答。
  
+ 基于人类反馈的强化学习（RLHF）
{% asset_img 'instructGPT.jpg' %}

### 总结
1. 解决 GPT-3 的**输出与人类意图**之间的**Align问题**；
2. 让具备丰富世界知识的大模型，**学习“人类偏好”**；
3. 标注人员明显感觉 InstructGPT 的输出比 GPT-3 的输出更好，更可靠；
4. InstructGPT 在**真实性**，**丰富度**上表现更好；
5. InstructGPT 对有害结果的生成控制的更好，但是对于**“偏见”没有明显改善**；


# ChatGPT 训练  [3]
- 基于人类反馈的强化学习微调技术 RLHF
  - 使用有监督微调 Supervised Fine-tuning（SFT）预训练语言模型
    + Supervised fine-tuning (SFT)
      = Instruction Tuning
  - 训练奖励模型 Reward Model（RM）
  - 使用强化学习算法微调语言模型
    + RLHF
      [本质  基于强化学习, 强化学习算法]  

# 参考
1. [GPT / GPT-2 / GPT-3 / InstructGPT 进化之路](https://zhuanlan.zhihu.com/p/609716668) ***

2. [Few-Shot, Zero-Shot & One-shot 的通俗理解](https://zhuanlan.zhihu.com/p/624793654)

3. [AI 大模型微调训练营大纲](https://shimo.im/docs/KlkKv4XQDouwWRqd/read) 

1xx. [[Transformer 101系列] ChatGPT是怎么炼成的?](https://zhuanlan.zhihu.com/p/642282717) 未