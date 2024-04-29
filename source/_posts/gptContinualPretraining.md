---
title: (原理|实战)继续Pre-Training
date: 2023-02-03 11:31:44
tags:
  - train
categories:
  - AIGC
  - train
---

<p></p>
<!-- more -->

# 继续-预训练 continual pre-training [1]
+ 继续预训练的目的
  为了得到**适应不同行业/任务领域**的预训练模型，**提升下游任务的效果**

+ 什么时候需要继续预训练？
  **预训练(pre-train)的语料与下游任务(finetune)语料的【数据分布/领域差异】大时**


# 千帆Llama 2中文增强技术介绍-Postpretrain[2]
+ 中文词表构建 +Tokenizer
  中文词表扩增 29k -> 59k
+ Embedding
  在原有Embedding矩阵后追加中文embedding映射
+ 数据配比 
 中文：英文约1:1

+ pipeline
  -  原始数据集
  -  **异常清洗**
  -  **数据过滤**
  -  **去重**
  -  隐私匿名化

> 开源大模型预训练语料预处理流程总结： 基于基础规则处理为主 + 基于模型的质量过滤逐步成为趋势

# 参考
1. [浅谈一下「继续预训练」](https://zhuanlan.zhihu.com/p/545092184)
2. <<千帆增强版 Llama 2-提升大模型对话指令遵循能力>> 
1xx. [如何更好地继续预训练（Continue PreTraining）](https://zhuanlan.zhihu.com/p/654463331)
   warmup  +  学习率
1xx. [Don't stop pretraining，继续预训练！](https://blog.csdn.net/Kaiyuan_sjtu/article/details/120695507)

1xx. 《Investigating Continual Pretraining in Large Language Models: Insights and Implications》
    [值得一看的大模型预训练数据选择策略总结：兼读20240229大模型进展早报](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648409027&idx=1&sn=4083853fd0bfb1790d8df6b4414b6583&chksm=83839096b4f41980e8277f34650c2029a45e853adfc2b412ea386952751e44d29e75f0048d12&scene=178&cur_album_id=3343133676745932807#rd)




