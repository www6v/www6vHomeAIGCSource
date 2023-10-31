---
title: 大模型
date: 2022-10-30 19:10:21
tags:
  - 大模型
categories: 
  - AI  
  - 大模型  
---

<p></p>
<!-- more -->


# 应用
+ Prompt Template
+ RAG
+ Agents
+ 大模型微调

# 工具
+ langchain
+ Transformers
+ PEFT
+ LLaMa
+ ChatGLM
+ deepspeed

# 原理
+ 正向传播
  损失函数  
+ 反相传播
  梯度
+ embedding


+ Fine-tunning
  + PEFT(Parameter-Efficient Fine-Tuning)
    + P-Turning
    + Adapter-Tuning [ 外挂]
    + LoRA [ 外挂] [效果比较好]
  + RLHF

+ 预训练技术

+ Transformer
  + Attention



# Agent
+ 基础
  ReACT 范式
  
+ Agent = LLM + plan[规划能力] + memory[记忆能力] +Tools[工具使用能力]

+ 分类
  + Action agents
    Function Call， ReACT
  + Simulation agents 
    生成式智能体， CAMEL
  + Automomous Agent
    Auto-GPT， BabyAGI


# 计算并行
+ 数据并行
+ 模型并行
+ 张量并行

# 大模型架构


# 参考
[LLM学习系列1：大模型架构要点总结](https://zhuanlan.zhihu.com/p/648050614)