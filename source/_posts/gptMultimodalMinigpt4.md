---
title: MiniGPT4
date: 2023-03-15 15:56:48
tags:
  - multimodal
categories:
  - AIGC  
  - multimodal
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

#  INTRODUCTION[1]
MiniGPT-4 增加了一个**投影层**，将**编码的视觉特征与 Vicuna 语言模型对齐**，并**冻结了所有其他视觉和语言组件**

# METHOD[1]
+ 图 1

+ MiniGPT-4 的目标是将来自预训练视觉编码器的视觉信息与先进的大型语言模型（LLM）对齐（Alignment）。具体来说，
    - 使用 **Vicuna作为语言解码器**，该解码器基于 LLaMA构建，可以执行各种复杂的语言任务。
    - 视觉感知方：采用与 **BLIP-2** 相同的**视觉编码器**，**ViT Backbone**及其预先训练好的 **Q-Former**。
  语言和视觉模型都是开源的。我们的目标是利用线性投影层弥合视觉编码器与 LLM 之间的差距，图 1 显示了模型概览。

###  FIRST **PRETRAINING** STAGE
+ 第一阶段：在大量对齐的图像-文本对上对模型进行预训练，以获取视觉语言知识。

+ Traditional alignment method [2]
  - Input: Image
  - Output: Caption
  - Training Objective: Maximize the likelihood of GT captions
  - Training Dataset 组合数据集 [postprocessed by BLIP] 
  	- Conceptual Caption
  	- SBU 
  	- LAION   

### CURATING A **HIGH-QUALITY ALIGNMENT DATASET** FOR VISION-LANGUAGE DOMAIN.
+ Create a dataset with detailed, human-perfered descriptions[2]
  + model  generates descriptions
  + polishing and filtering by chatgpt
  + further polishing and filtering by rules & human

### SECOND-STAGE **FINETUNING**
+ 第二阶段：使用一个较小但高质量的图像-文本数据集对预训练模型进行微调，并设计了对话模板，以提高生成的可靠性和可用性。

# 参考
### 原理
1. [【LMM 009】MiniGPT-4：使用 Vicuna 增强视觉语言理解能力的多模态大模型](https://datac.blog.csdn.net/article/details/135399033) *** 
2. [MiniGPT-4、表格推理、代码生成、生成式推理-来自斯坦福、北大、阿卜杜拉、达摩院的四位论文一作思辨大模型](https://www.bilibili.com/video/BV1n24y1F7kv/) V
1xx. [miniGPT4：多模态图文理解训练](https://www.bilibili.com/video/BV12Q4y1b7nY/) V

### 实战
1xx. [大杀器，多模态大模型MiniGPT-4入坑指南](https://zhuanlan.zhihu.com/p/627671257)
