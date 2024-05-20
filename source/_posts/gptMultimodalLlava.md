---
title: (原理|实战)多模态  LLaVa
date: 2023-03-14 23:02:17
tags:
  - multimodal
categories:
  - AIGC  
  - multimodal
---

<p></p>
<!-- more -->

### GPT-assisted Visual Instruction Data Generation [1]
+ detail
  为了缓解这一问题，我们利用**纯语言 GPT-4 或 ChatGPT 作为强大的教师（两者都只接受文本作为输入），来创建涉及视觉内容的指令遵循数据**。具体来说，为了将图像编码为视觉特征以提示纯文本 GPT，我们使用了**两类符号**表示：

    i）**图像描述（Captions）**通常从不同角度描述视觉场景；
    ii）**边框（Bounding Boxes）**通常定位场景中的物体，每个框编码物体概念及其空间位置。表 14 顶部图块就是一个例子。


+ 158K   语言图像指令遵循样本
  + 58K  对话样本
  + 23K  详细描述样本 
  + 77K  复杂推理样本



# LLaVa [2][ELmo]

### 摘要
+ 微软 LLaVa 模型是一个在视觉 - 语言多模态领域的先进实现，它利用了预训练的大型语言模型（LLaMA）和视觉模型（CLIP）。

+ 模型的**训练数据集**包括预训练集 CC3M 和精调集 Instruct-150K。

+ LLaVa 的**模型结构**采用了简单的**线性层**将视觉特征转换为语言嵌入标记，并与文本特征拼接输入给语言模型。

+ 训练过程分为**两个阶段**
  特征对齐的预训练和端到端的微调，后者包括针对视觉聊天和 Science QA 两种使用场景的微调。
  
+ LLaVa 在测试数据集上的表现显示，它在 GPT-4 生成的数据集上达到了 85.1% 的相对分数，并在 ScienceQA 数据集上实现了最先进的效果。

+ 作者通过对比 miniGPT-4，强调了 LLaVa 在数据和实验量化、Chat Demo 质量以及数据中心项目方面的特点。此外，作者还提供了模型权重、代码和相关数据集的链接，以便社区可以利用这些资源来复现和扩展多模态 GPT-4 的能力。

### 观点
1. LLaVa 模型在多模态领域的实现被认为是优秀的，因为它提供了严格的量化结果，包括与 GPT-4 的接近程度和在 Science QA 上的最佳准确率。
2. 与 miniGPT-4 相比，LLaVa 在 Chat Demo 的质量上表现出色，具有较强的**视觉推理和 OCR 能力**，并且在数据质量和模型设计的 ablation study 上有更全面的展示。
3. LLaVa 项目强调的是**数据中心**的方法，而不是模型中心的方法，即在模型性能差异逐渐缩小的情况下，**数据质量对结果的影响至关重要**。作者鼓励社区利用提供的多模态指令跟随数据来复现和进一步扩展多模态 GPT-4 的能力。

# 参考
1. [【LMM 001】LLaVA：大型语言和视觉助手](https://datac.blog.csdn.net/article/details/135329498)

2. [miniGPT-4的同期工作: 微软LLaVa模型论文笔记](https://zhuanlan.zhihu.com/p/625723805)

1xx. [基于视觉指令调整的多模态聊天机器人 LLaVA｜AI新青年讲座·大型语言模型专场](https://apposcmf8kb5033.pc.xiaoe-tech.com/live_pc/l_64a7d4fde4b0d1e42e7fc7e6) V

1xx. [[LLaVA系列]📒CLIP/LLaVA/LLaVA1.5/VILA笔记](https://zhuanlan.zhihu.com/p/683137074)



### plus
1xx. [【LMM 002】LLaVA-1.5：大型语言和视觉助手](https://datac.blog.csdn.net/article/details/135329602)

1xx. [【LMM 006】LLaVA-Plus：可以学习如何使用工具的多模态Agent](https://datac.blog.csdn.net/article/details/135329898)

### 微调llava 实战
[XTuner 微调 LLM：1.8B、多模态、Agent (更新撰写中)](https://github.com/InternLM/Tutorial/blob/camp2/xtuner/readme.md)
[XTuner多模态训练与测试](https://github.com/InternLM/Tutorial/blob/camp2/xtuner/llava/xtuner_llava.md)

