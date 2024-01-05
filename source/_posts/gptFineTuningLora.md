---
title: Fine-tuning Lora
date: 2023-01-05 12:04:14
tags:
  - AIGC
categories:
  - AIGC  
  - Fine-Tuning
---

<p></p>
<!-- more -->


## 基于bloom的微调
+ 简单基础  [2]
  - 基座模型  
    Langboat/bloom-1b4-zh 
  - 数据集
    shibing624/alpaca-zh
    
+ 稍复杂[1]
  - 基座模型 
    bloomz-560m 
  - 数据集
    ought/raft
    
# 参考
1. [大模型参数高效微调技术实战（五）-LoRA](https://zhuanlan.zhihu.com/p/649315197)
   [bloom Lora](https://github.com/www6v/llm-action/blob/main/train/peft/clm/peft_lora_clm.ipynb) git
   
2. [【手把手带你实战HuggingFace Transformers-高效微调篇】LoRA 原理与实战](https://www.bilibili.com/video/BV13w411y7fq/) V
    [bloom Lora](https://github.com/www6v/transformers-code/blob/master/03-PEFT/21-lora/chatbot_lora.ipynb)   git 

100. [Finetuning LLMs with LoRA and QLoRA: Insights from Hundreds of Experiments](https://lightning.ai/pages/community/lora-insights/) ***
