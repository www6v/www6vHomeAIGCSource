---
title:  Fine-Tuning
date: 2022-11-18 23:31:46
tags:
  - AIGC
categories:
  - AIGC  
  - Fine-Tuning
---

<p></p>
<!-- more -->

# 分类
+ 全量微调

+ 局部微调
  + PEFT(Parameter-Efficient Fine-Tuning)  PEFT

# PEFT 分类 

{% asset_img 'category.png' %}

高效微调技术可以粗略分为以下三大类：增加额外参数（A）、选取一部分参数更新（S）、引入重参数化（R）。而在增加额外参数这类方法中，又主要分为类适配器（Adapter-like）方法和软提示（Soft prompts）两个小类。


+ PEFT
  + [本质   基于有监督学习]

+ PEFT(Parameter-Efficient Fine-Tuning)  PEFT
    + 引入重参数化（R）    
      + LoRA: Low-Rank Adaptation of LLMs    
        LoRA [ 外挂] [效果比较好]
      + QLoRA: Efficient Finetuning of Quantized LLMs
      + AdaLoRA: Adaptive Budget Allocation for PEFT      
    + 增加额外参数（A）
        + 软提示（Soft prompts） 
          + Prefix Tuning
            增加一个可被训练的Embedding层
          + Prompt Tuning
          + P-Turning
        + Adapter-Tuning [ 外挂]
    + 选取一部分参数更新（S）
      + BitFit
    + additive
      + IA3  
    
+ 统一微调框架
    UniPELT

{% asset_img 'overview.jpg' %}


#  Instruction Tuning[5]
+ Prompt vs. Instruction Tuning
Prompt是去激发语言模型的**补全能力**，比如给出上半句生成下半句、或者做完形填空，都还是像在做language model任务.

而Instruction Tuning则是激发语言模型的**理解能力**，通过给出更明显的指令/指示，让模型去理解并做出正确的action

**Prompt tuning**都是针对**一个任务**的，比如做个情感分析任务的prompt tuning，精调完的模型只能用于情感分析任务，而经过**Instruction Tuning多任务**精调后，可以用于其他任务的zero-shot

+  Instruction Tuning 指令微调
  - Self Instruction


## ChatGPT 训练  [1]

- 基于人类反馈的强化学习微调技术 RLHF
  - 使用有监督微调 Supervised Fine-tuning（SFT）预训练语言模型
    + Supervised fine-tuning (SFT)
      = Instruction Tuning
  - 训练奖励模型 Reward Model（RM）
  - 使用强化学习算法微调语言模型
    + RLHF
      [本质  基于强化学习, 强化学习算法]  
      
## 工具 [1]
+ Hugging Face Transformers
+ Hugging Face PEFT
+ DeepSpeed


# 参考
### 原理
1. [AI 大模型微调训练营大纲](https://shimo.im/docs/KlkKv4XQDouwWRqd/read) 

2. xxx

3. [大模型干货教程看这一个就够了~2023年全网最硬核最全面的大模型公开课|大模型微调 | ChatGLM | LangChain](https://www.bilibili.com/video/BV1t8411D7v4?p=8) ***

4. [llm微调技术原理](https://github.com/www6v/llm-action#llm%E5%BE%AE%E8%B0%83%E6%8A%80%E6%9C%AF%E5%8E%9F%E7%90%86)  李国东  
   4.1 [大模型参数高效微调技术原理综述（一）-背景、参数高效微调简介](https://zhuanlan.zhihu.com/p/635152813)

   4.2  [大模型参数高效微调技术原理综述（七）-最佳实践、总结](https://zhuanlan.zhihu.com/p/649755252)

5. [Instruction Tuning｜谷歌Quoc V.Le团队提出又一精调范式](https://zhuanlan.zhihu.com/p/408166011)



