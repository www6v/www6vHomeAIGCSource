---
title:  Fine-Tuning 原理
date: 2022-11-18 23:31:46
tags:
  - AIGC
categories:
  - AIGC  
  - Fine-Tuning
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

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
    + **引入重参数化（R）**    
      + **LoRA**: Low-Rank Adaptation of LLMs    
        LoRA   【 并联方式的外挂】 [效果比较好]
      + QLoRA: Efficient Finetuning of Quantized LLMs
      + AdaLoRA: Adaptive Budget Allocation for PEFT      
      
    + 增加额外参数（A）
        + **软提示（Soft prompts）** 
          + **Prefix Tuning**
            增加一个可被训练的Embedding层
          + Prompt Tuning
          + **P-Turning**        
        + Adapter-Tuning   【 串联方式的外挂】       
        
    + 选取一部分参数更新（S）
      + BitFit
      
    + additive
      + IA3  
    
+ 统一微调框架
    UniPELT

{% asset_img 'overview.jpg' %}

# ChatGPT 训练  [1]
- 基于人类反馈的强化学习微调技术 RLHF
  - 使用有监督微调 Supervised Fine-tuning（SFT）预训练语言模型
    + Supervised fine-tuning (SFT)
      = Instruction Tuning
  - 训练奖励模型 Reward Model（RM）
  - 使用强化学习算法微调语言模型
    + RLHF
      [本质  基于强化学习, 强化学习算法]  
      
# 微调指令的生成 [5][6]

# 参考
### 原理
1. [AI 大模型微调训练营大纲](https://shimo.im/docs/KlkKv4XQDouwWRqd/read) 

2. xxx

3. [大模型干货教程看这一个就够了~2023年全网最硬核最全面的大模型公开课|大模型微调 | ChatGLM | LangChain](https://www.bilibili.com/video/BV1t8411D7v4?p=8) ***

4. [llm微调技术原理](https://github.com/www6v/llm-action#llm%E5%BE%AE%E8%B0%83%E6%8A%80%E6%9C%AF%E5%8E%9F%E7%90%86)  李国东  
   4.1 [大模型参数高效微调技术原理综述（一）-背景、参数高效微调简介](https://zhuanlan.zhihu.com/p/635152813)

   4.2  [大模型参数高效微调技术原理综述（七）-最佳实践、总结](https://zhuanlan.zhihu.com/p/649755252)

5. [大模型SFT微调指令数据的生成](https://zhuanlan.zhihu.com/p/650596719)

6. [让ChatGPT生成训练ChatGPT的训练数据](https://zhuanlan.zhihu.com/p/618334308)

1xx. [LLM高效参数微调方法：从Prefix Tuning、Prompt Tuning、P-Tuning V1/V2到LoRA、QLoRA(含对模型量化的解释)](https://blog.csdn.net/v_JULY_v/article/details/132116949) *** 未
1xx. [大模型参数高效微调技术原理及实践](https://aicarrier.feishu.cn/file/H1YvbRyacopEs6xzgZ8c9DDcnIh) pdf
   [如何高效微调大模型？技术原理与最佳实践揭秘！](https://www.bilibili.com/video/BV1qw411c7Hd/) V
1xx. [7月末关于大模型微调数据工程与评估的技术综述：从数据构造方案到模型评估范式的论文梳理指引 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648402136&idx=1&sn=554331e397015c4da95fb0d0929f5aa1) 对齐-论文集
   [AlignLLMHumanSurvey](https://github.com/GaryYufei/AlignLLMHumanSurvey) git



