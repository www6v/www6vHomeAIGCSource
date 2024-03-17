---
title: 多模态-InstructTuning
date: 2023-03-15 16:09:00
tags:
  - multimodal
categories:
  - AIGC  
  - multimodal
---

<p></p>
<!-- more -->

# Datasets for Visual Instruction Tuning[1]
### Single-turn
+ MiniGPT-4
**MiniGPT-4** [37] curates an image description dataset that contains 3439 image-text pairs for instruction fine-tuning. MiniGPT-4 **randomly selects 5000 images from the Conceptual Caption dataset** [38], [39] and prompts its **pre-trained VLM model** to generate detailed descriptions for each image. The generated descriptions are then** refined and filtered** both manually and by using ChatGPT, resulting in 3439 highquality image-text pairs.

+ MultiInstruct
MultiInstruct [43] build a comprehensive instruction dataset that covers 62 diverse multimodal tasks from 10 broad categories, such VQA, Image-text matching, grounded generation, and so on. These tasks include 34 existing tasks derived from 21 public dataset and 28 new tasks extended from them. Each task is equipped with 5 instruction templates to prompt the model to perform the specific task.

### Multi-turn
**LLaVA-Instruct-158k** [9] contains 158 image-text instruction data, including **58k conversation data** asking about the visual content of the image,**23k description data**, and **77k complex reasoning data** where the question may involve multi-step reasoning process.

# VLIT Data Construction Strategy[2]
### Annotation Adaption
+ MiniGPT-4

### Self-Instruct
+ LLaVA

# High-Quality VLIT Data[2]
### Correctness
### Diversity
### Complexity

# Method [1][3]
+ MiniGPT-4
+ MultiInstruct + 
+ LLaVa + 
+ LLaVA-1.5
+ Otter + 
+ LAMM + 
+ Qwen-VL
+ CogVLM

+ StableLLaVA

# 参考
1. 《Visual Instruction Tuning towards General-Purpose Multimodal Model: A Survey》 ***  第4 5章  南洋大学 

2. 《Vision-Language Instruction Tuning: A Review and Analysis》 ***  第3 4 5章   腾讯

3. 《Instruction Tuning for Large Language Models: A Survey》 第5章

1xx. [【LMM 015】LAMM：多模态指令微调数据集，框架和基准](https://datac.blog.csdn.net/article/details/135434897)

1xx. [Talk | ACL'23 杰出论文，MultiIntruct：通过多模态指令集微调提升VLM的零样本学习](https://www.bilibili.com/video/BV12p4y1M7RV/)

1xx. [【ACL2023】MultiInstruct: Improving Multi-Modal Zero-Shot Learning via Instruction Tuning](https://blog.csdn.net/qq_45978862/article/details/132008907)




