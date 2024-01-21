---
title: 训练
date: 2022-11-19 22:32:11
tags:
  - train
categories:
  - AIGC  
  - train
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# Training Pipeline[0]
{% asset_img 'bigModelTrainingPipeline.jpg' %}

**模型训练分为四个阶段** [2]
+ 预训练（Pretraining） -->Base model  
  + 预训练技术
    预训练本质上是⼀个⽆监督学习过程    
+ 监督微调（Supervised Finetuning） --> SFT model 
  核⼼原因还是在于需要“赋予”⼤模型更加定制化的功能
+ 奖励建模（Reward Modeling）
+ 强化学习（Reinforcement Learning）

**三个角度解析** [2]
+ 数据量：**预训练**阶段所需的**数据量很大**，但**质量要求不高**；而**后面的三个阶段**恰恰相反，需要的**数据质量较高**。
+ 训练方法：**预训练和监督微调**的训练方法相同，都是**预测下一个单词**。奖励模型和强化学习的训练方法则不同。**奖励模型**是**二元分类学习**，而**强化学习**则鼓励模型生成奖励模型评分较高的回答。
+ 训练所需资源：预训练阶段的资源消耗巨大，使用数千颗GPU，花费**数月**时间，占总训练时间的99%。后面的三个阶段只需使用数十颗GPU，训练时间约**数天**。


### 设置训练参数 [2]
设置训练参数，如batch-size、learning rate等
+ 预训练阶段的**Batch Size非常大**，范围在0.5M到4M之间。
+ **Learning rate设定较小**，且随着网络规模的增大，Learning rate越来越小。

###  参数量 vs 训练数据量 [2]
**参数量并不是衡量模型能力的唯一标准，训练数据量也是一个非常重要的因素。** 
LLaMA模型，尽管它的参数量只有650亿，但其性能与参数量为1750亿的GPT-3模型相比也非常优秀。主要原因在于，LLaMA模型的训练数据量达到了1.4万亿，而GPT-3只有3000亿。

# Pre-training 
###  Pre-training [4]
  + ⾃回归与⽣成式
    - **⾃回归模型**是⼀种序列模型，它在预测下⼀个输出时，会将之前的所有输出作为输⼊，然后**根据统计规律、结合已经输⼊的样本**，预测下个位置各单词出现的概率，然后输出概率最⼤的单词，类似于完形填空；
    - **⽣成式模型**的预测过程和⾃回归模型类似，都是根据统
    计规律预测下个单词的概率，所不同的是，**⽣成式模型可以根据之前的样本的
    概率分布⽣成下⼀个词，⽣成式模型预测时会存在⼀定的随机性；**
    
  + GPT来说，就是⼀个⾃回归⽣成式模型 [4]
    ⼀个⾃回归⽣成式模型在进⾏预测的时候，**会⾸先根据⾃回归模型，在参考到⽬前为⽌
    已经⽣成的词的情况下确定下⼀个词的概率分布，然后再根据⽣成式的⽅式来根据这个
    分布⽣成下⼀个词**

###  tokenizer 分词  
+ 单词分词法
+ 单字分词法
+ 子词分词法
  BPE [GPT系列], WordPiece

# 参考
0. [LLM学习系列1：大模型架构要点总结](https://zhuanlan.zhihu.com/p/648050614)  from ppt

1. xxx

2. [大模型训练入门实战](https://techdiylife.github.io/big-model-training/deepspeed/LLM-state-of-GPT.html)  *** 
   [State of GPT](https://karpathy.ai/stateofgpt.pdf) 
   [State of GPT：大神Andrej揭秘OpenAI大模型原理和训练过程 ](https://mp.weixin.qq.com/s/zmEGzm1cdXupNoqZ65h7yg)

3. [主流大语言模型的技术原理细节](https://cloud.tencent.com/developer/article/2328541) *** 腾讯     架构 + 训练 + 微调

4. 大模型入门必看教程  九天Hector

100. [NLP（二）：浅谈分词](https://zhuanlan.zhihu.com/p/458452872)

