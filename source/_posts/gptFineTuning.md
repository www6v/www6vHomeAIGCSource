---
title:  (原理)PEFT
date: 2022-11-18 23:31:46
tags:
  - PEFT
categories:
  - AIGC  
  - PEFT
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 分类
+ 全量微调

+ 局部微调
  + PEFT(Parameter-Efficient Fine-Tuning)  PEFT

# PEFT 分类 [1.1]
{% asset_img 'category.png' %}

高效微调技术可以粗略分为以下三大类：增加额外参数（A）、选取一部分参数更新（S）、引入重参数化（R）。而在增加额外参数这类方法中，又主要分为类适配器（Adapter-like）方法和软提示（Soft prompts）两个小类。


+ PEFT
  + [本质   基于有监督学习]

+ PEFT(Parameter-Efficient Fine-Tuning)  PEFT
    + **引入重参数化（R）**    
      + **LoRA** [2021 Microsoft]
        Low-Rank Adaptation of LLMs    
        LoRA   【 并联方式的外挂】 [效果比较好]
      + QLoRA [2023 University of Washington]
         Efficient Finetuning of Quantized LLMs
      + AdaLoRA [2023 Microsoft]
       Adaptive Budget Allocation for PEFT      
      
    + 增加额外参数（A）
        + **软提示（Soft prompts）** 
          + Prefix Tuning[2021 Stanford]
            增加一个可被训练的Embedding层
            【难实现】
          + **Prompt Tuning** [2021 Google]
            【简化版本的Prefix Tuning】
          + **P-Turning v1** [2021 Tsinghua]
          + **P-Turning v2** [2022 Tsinghua]    
        + Adapter-Tuning[2019 Google]   
          【 串联方式的外挂】       
        
    + 选取一部分参数更新（S）
      + BitFit
      
    + additive
      + IA3  
    
+ 统一微调框架
    UniPELT

+ 总结[3]
{% asset_img 'overview.jpg' %}


# 参考
### 原理
1. [llm微调技术原理](https://github.com/www6v/llm-action#llm%E5%BE%AE%E8%B0%83%E6%8A%80%E6%9C%AF%E5%8E%9F%E7%90%86)  李国东 
   1.1 [大模型参数高效微调技术原理综述（一）-背景、参数高效微调简介](https://zhuanlan.zhihu.com/p/635152813)
   1.2  [大模型参数高效微调技术原理综述（七）-最佳实践、总结](https://zhuanlan.zhihu.com/p/649755252)

2. [大模型干货教程看这一个就够了~2023年全网最硬核最全面的大模型公开课|大模型微调 | ChatGLM | LangChain](https://www.bilibili.com/video/BV1t8411D7v4?p=8) V ***

3. [大模型参数高效微调技术原理及实践](https://aicarrier.feishu.cn/file/H1YvbRyacopEs6xzgZ8c9DDcnIh) pdf
   [如何高效微调大模型？技术原理与最佳实践揭秘！](https://www.bilibili.com/video/BV1qw411c7Hd/) V *** 


1xx. [LLM高效参数微调方法：从Prefix Tuning、Prompt Tuning、P-Tuning V1/V2到LoRA、QLoRA(含对模型量化的解释)](https://blog.csdn.net/v_JULY_v/article/details/132116949) **

1xx. [7月末关于大模型微调数据工程与评估的技术综述：从数据构造方案到模型评估范式的论文梳理指引 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648402136&idx=1&sn=554331e397015c4da95fb0d0929f5aa1) 对齐-论文集
   [AlignLLMHumanSurvey](https://github.com/GaryYufei/AlignLLMHumanSurvey) git



