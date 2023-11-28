---
title: 大模型
date: 2022-10-30 19:10:21
tags:
  - 大模型
categories: 
  - AIGC
  - 大模型  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


# 原理
+ 正向传播
  损失函数  
+ 反相传播
  梯度
+ embedding



# Training Pipeline[1]
{% asset_img 'bigModelTrainingPipeline.jpg' %}

+ 预训练-->Base model
  + 预训练技术
    预训练本质上是⼀个⽆监督学习过程
    
    
+ 微调-->SFT model
  核⼼原因还是在于需要“赋予”⼤模型更加定制化的功能
  
+ 模型对齐-->RLHF model

# 大模型架构 [1][2]

{% asset_img 'bigModelArch.jpg' %}

{% asset_img 'bigModelArch1.jpg' %}

+ Transformer
  + Attention

+ 预训练
  + ⾃回归与⽣成式
    **⾃回归模型**是⼀种序列模型，它在预测下⼀个输出时，会将之前的所有输出作为输⼊，然后**根据统计规律、结合已经输⼊的样本**，预测下个位置各单词出现的概率，然后输出概率最⼤的单词，类似于完形填空；
    **⽣成式模型**的预测过程和⾃回归模型类似，都是根据统
计规律预测下个单词的概率，所不同的是，**⽣成式模型可以根据之前的样本的
概率分布⽣成下⼀个词，⽣成式模型预测时会存在⼀定的随机性；**
    
  + GPT来说，就是⼀个⾃回归⽣成式模型
    ⼀个⾃回归⽣成式模型在进⾏预测的时候，**会⾸先根据⾃回归模型，在参考到⽬前为⽌
已经⽣成的词的情况下确定下⼀个词的概率分布，然后再根据⽣成式的⽅式来根据这个
分布⽣成下⼀个词**

#  分词
### 单词分词法
### 单字分词法
### 子词分词法
BPE - GPT系列


# 大模型
###  排行榜 [4]

### 非开源
  Chatgpt
  文心一言

### 开源
  LLaMA
  Baichuan2
  通义千问（Qwen-7B） 
  ChatGLM

# Shot[3]
+ One-shot 
+ Few-Shot
+ Zero-Shot 


# 参考
1. [LLM学习系列1：大模型架构要点总结](https://zhuanlan.zhihu.com/p/648050614)

2. [主流大语言模型的技术原理细节](https://cloud.tencent.com/developer/article/2328541) *** 腾讯     架构 + 训练 + 微调

3. [Few-Shot, Zero-Shot & One-shot 的通俗理解](https://zhuanlan.zhihu.com/p/624793654) 

4. [HuggingFaceH 大模型排行榜](https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard)