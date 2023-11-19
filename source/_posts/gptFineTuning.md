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

# Fine-Tuning 分类
+ Fine-tunning
  全量微调

+ 局部微调
  + PEFT(Parameter-Efficient Fine-Tuning)  PEFT
    + [本质   基于有监督学习]
    + LoRA [ 外挂] [效果比较好]
    + Prompt
      + Prefix Tuning
        增加一个可被训练的Embedding层
      + Prompt Tuning
      + P-Turning
    + Adapter-Tuning [ 外挂]
    
  + RLHF
    [本质  基于强化学习]
    
    
# 参考
1. https://github.com/huggingface/peft
2. https://github.com/microsoft/LoRA
3. [大模型干货教程看这一个就够了~2023年全网最硬核最全面的大模型公开课|大模型微调 | ChatGLM | LangChain](https://www.bilibili.com/video/BV1t8411D7v4?p=8) ***
