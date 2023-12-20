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

# NPL范式[3]
{% asset_img 'npl4Paragiam.jpg'  4种范式 %}

# Scaling Law[4]
### Scaling Law
{% asset_img 'scalingLaw.jpg' %}

### 参数量 vs 数据量
{% asset_img 'paramVSdataSize.jpg' %}

### 参数量 vs 数据量
{% asset_img 'computeVSDatasize.jpg' %}

# 原理
+ 正向传播
  损失函数  
  
+ 反相传播
  梯度
  
+ Embedding

+ Layer Normalization
  - Post-LN
  - Pre-LN
  - Sandwich-LN
  layerNorm是针对序列数据提出的一种归一化方法，主要在layer维度进行归一化，即对整个序列进行归一化。
  
# 大模型架构 [1][2]

{% asset_img 'bigModelArch.jpg' %}

{% asset_img 'bigModelArch1.jpg' %}


# 大模型
###  排行榜 
[HuggingFaceH 大模型排行榜](https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard)

# 显卡 
+ 显卡天梯榜
 [显卡天梯榜](https://topic.expreview.com/GPU)

+ 显卡
显卡 = GPU +  显存

# 参考

1. [LLM学习系列1：大模型架构要点总结](https://zhuanlan.zhihu.com/p/648050614)
2. [主流大语言模型的技术原理细节](https://cloud.tencent.com/developer/article/2328541) *** 腾讯     架构 + 训练 + 微调
3. [[综述]鹏飞大神的Pre-train, Prompt, and Predict [1]](https://zhuanlan.zhihu.com/p/396098543)
4.  [解析大模型中的Scaling Law](https://zhuanlan.zhihu.com/p/667489780)

100. [[译][论文] 大语言模型（LLM）综述与实用指南（Amazon，2023）](http://arthurchiao.art/blog/llm-practical-guide-zh/) 未
101. [通向AGI之路：大型语言模型（LLM）技术精要](https://zhuanlan.zhihu.com/p/597586623) *** 未