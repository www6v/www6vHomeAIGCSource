---
title: 多轮对话
date: 2023-05-28 19:01:52
tags:
  - 对话
categories: 
  - AIGC
  - 对话 
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 传统的多轮对话
### 多轮对话[1][2]
+ NLU
    - 意图(intent)分类 [3]   
    - 槽位抽取
+ DM
  DST + DP(Policy)
+ NLG

> 多轮-上下文

### 难点[3]
+ 上下文信息丢失
+ 指代词识别


### 基础能力 [2]
+ 意图识别
+ 情绪识别

# 基于LLM的多轮对话[4]
### Types
+ Task-oriented dialogue system
   NLU -> DST -> DPL-> NLG

+ open-domain dialogue system

### evolution of LM-based dialogue system
+ Fusion within Task-oriented dialogue system(task)
  - task
    - NLU  DST  DPL【可有可无】
    - NLG【保留】
  - **end2end Task-oriented DS的出现**

+ fusion between TOD and ODD(data)
  - TOD -> ODD
    Q-TOD
  - ODD -> TOD
    UniDS
    
+ fusion between dialogue modal and language model(model)
  **LLM as DM**
  【LLM本身有对话的能力，需要被激发出来】【instruction tuning】
  【chat模型是做价值观对齐】

# 参考
1. [自然语言处理：多轮对话在工业中的应用-贪心学院](https://www.bilibili.com/video/BV1dt4y1S7kn/) *** V
2. [1-人-人对话数据驱动的多轮对话技术探索与实践-孙超博](https://www.bilibili.com/video/BV1vZ4y147Qv/) V 美团
3. [人工智能如何在多轮对话中进行意图理解——祝凯华](https://www.bilibili.com/video/BV1Yt4y1S75w/) V
4. [基于大模型对话系统的前世今生](https://www.bilibili.com/video/BV1Mb4y137yB/)  V
   《An Survey of the Evolution of Language Model-Based Dialogue Systems》