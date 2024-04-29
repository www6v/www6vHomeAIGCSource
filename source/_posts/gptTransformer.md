---
title: (原理)Transformer
date: 2022-11-30 16:44:11
tags:
  - Transformer
categories: 
  - AIGC
  - Transformer  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 神经网络
+ 正向传播
  损失函数  
  
+ 反相传播
  梯度
  
# Attention [3]
{% asset_img 'self-attention.jpg' %}

### 优化[4]
{% asset_img 'attentions.jpg' %}

# Transformer [2]
### Encoder-Decoder架构 [1]
{% asset_img 'Transformer_decoder.jpg' %}
{% asset_img 'transformer_resideual_layer_norm_3.jpg' %}

transfomer 架构在GPU上的并行

### Self-attention
Q=K=V  
aligment

### Multi-Head Attention(MHA)

###  Positional Encoding  [30][31]

### Normalization [20]
+ batch normalization

+ Layer Normalization
  - Post-LN
  - Pre-LN
  - Sandwich-LN
    layerNorm是针对序列数据提出的一种归一化方法，主要在layer维度进行归一化，即对整个序列进行归一化。

+ RMS Norm

# 大模型
### 架构 [6][7]
{% asset_img 'bigModelArch.jpg' %}

{% asset_img 'bigModelArch1.jpg' %}

###  优化点
{% asset_img 'transformers.jpg' %}

### 关注点[5]
+ **Mask attention 的策略不同**
  - bert  [双向都能看到]
  - chatgpt  [只能看到单项的]
  - chatglm  [左边像bert, 右边像gpt]
  
+ **训练任务目标不同**
  - bert [mask掉一个次, 在原位置把它预测出来]
  - gpt [预测下一个词]
  - chatglm [用gpt的方式来做bert的任务] 


# 参考
1. [illustrated-transformer](http://jalammar.github.io/illustrated-transformer/) *** 
   [图解 Transformer [译]](https://baoyu.io/translations/llm/illustrated-transformer)
2. [Transformer - Attention is all you need](https://zhuanlan.zhihu.com/p/311156298)
3. [超详细图解Self-Attention](https://zhuanlan.zhihu.com/p/410776234) ***
4. [主流大语言模型的技术原理细节](https://cloud.tencent.com/developer/article/2328541)  *** [架构]+训练+微调
5. [基于ChatGLM对话系统实战](https://www.bilibili.com/video/BV1gY4y1d7nk/)


6. [LLM学习系列1：大模型架构要点总结](https://zhuanlan.zhihu.com/p/648050614)
7. [主流大语言模型的技术原理细节](https://cloud.tencent.com/developer/article/2328541) *** 腾讯     架构 + 训练 + 微调

1xx. [第一课：Transformer](https://www.bilibili.com/video/BV16h4y1W7us/) ***  华为 
1xx. [LLM Visualization](https://bbycroft.net/llm) ***  可视化 
1xx. [Transformer通俗笔记：从Word2Vec、Seq2Seq逐步理解到GPT、BERT](https://blog.csdn.net/v_JULY_v/article/details/127411638) *** 
1xx. [深入解析随机 Transformer [译]](https://baoyu.io/translations/llm/the-random-transformer) *** 

### Normalization
20. [Normalization归一化：batch normalization vs layer nomalization](https://www.bilibili.com/video/BV1tk4y1F7b6/)

### 位置编码
30.  [一文通透位置编码：从标准位置编码、旋转位置编码RoPE到ALiBi、LLaMA 2 Long](https://blog.csdn.net/v_JULY_v/article/details/134085503)
31.   [【NLP入门】Transformer基本结构：Embedding与位置编码](https://www.bilibili.com/video/BV1Xa4y1d7YY/)  V

### Attention
1xx. [李宏毅《深度学习》- Self-attention 自注意力机制](https://blog.csdn.net/kkm09/article/details/120855658)
1xx. [一文通透各种注意力：从多头注意力MHA到分组查询注意力GQA、多查询注意力MQA](https://blog.csdn.net/v_JULY_v/article/details/134228287)


### 其他
1xx. [[Transformer 101系列] 初探LLM基座模型](https://zhuanlan.zhihu.com/p/640784855)   
1xx. [LLM从0开始预训练系列：2、大模型技术报告总结（GPT/PaLM/GLM/LLaMA/Skywork）](https://zhuanlan.zhihu.com/p/664046612) 





