---
title: 大模型训练
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

# 分布式训练 [1]

 + 分布式训练框架
    + DeepSpeed
    + Magatron

+ 预训练 3D并行
   + 数据并行
   + 模型并行
   + 张量并行
   
+ 参数量和数据量之间的关系  


# 预训练

###  预训练 [4]
  + ⾃回归与⽣成式
    **⾃回归模型**是⼀种序列模型，它在预测下⼀个输出时，会将之前的所有输出作为输⼊，然后**根据统计规律、结合已经输⼊的样本**，预测下个位置各单词出现的概率，然后输出概率最⼤的单词，类似于完形填空；
    **⽣成式模型**的预测过程和⾃回归模型类似，都是根据统
    计规律预测下个单词的概率，所不同的是，**⽣成式模型可以根据之前的样本的
    概率分布⽣成下⼀个词，⽣成式模型预测时会存在⼀定的随机性；**
    
  + GPT来说，就是⼀个⾃回归⽣成式模型 [4]
    ⼀个⾃回归⽣成式模型在进⾏预测的时候，**会⾸先根据⾃回归模型，在参考到⽬前为⽌
    已经⽣成的词的情况下确定下⼀个词的概率分布，然后再根据⽣成式的⽅式来根据这个
    分布⽣成下⼀个词**


### Training Pipeline[0]
{% asset_img 'bigModelTrainingPipeline.jpg' %}

+ 预训练-->Base model
  + 预训练技术
    预训练本质上是⼀个⽆监督学习过程
    
+ 微调-->SFT model
  核⼼原因还是在于需要“赋予”⼤模型更加定制化的功能
  
+ 模型对齐-->RLHF model


# 参考
0. [LLM学习系列1：大模型架构要点总结](https://zhuanlan.zhihu.com/p/648050614)

1. [How to Train Really Large Models on Many GPUs? ](https://lilianweng.github.io/posts/2021-09-25-train-large/)

2. [大模型训练入门实战](https://techdiylife.github.io/big-model-training/deepspeed/LLM-state-of-GPT.html)  *** 

3. [主流大语言模型的技术原理细节](https://cloud.tencent.com/developer/article/2328541) *** 腾讯     架构 + 训练 + 微调

4. 大模型入门必看教程  九天Hector
