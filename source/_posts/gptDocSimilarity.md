---
title: 短文本相似度
date: 2023-02-18 10:21:44
tags:
  - 短文本相似度
categories: 
  - AIGC
  - 短文本相似度  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


# 论文
+ 论文地址
  [Sentence Bert](https://arxiv.org/pdf/1908.10084.pdf)  


# Introduction
而作者提出了Sentence-BERT网络结构来解决bert模型的不足。简单通俗地讲，就是借鉴孪生网络模型的框架，将不同的句子输入到两个bert模型中（但这两个bert模型是参数共享的，也可以理解为是同一个bert模型），获取到每个句子的句子表征向量；而最终获得的句子表征向量，可以用于语义相似度计算，也可以用于无监督的聚类任务。对于同样的10000个句子，我们想要找出最相似的句子对，只需要计算10000次，需要大约5秒就可计算完全。

# Model
### Classification Objective Function
{% asset_img  'sbert1.jpg' %}


### Regression Objective Function
{% asset_img  'sbert2.jpg' %}


### Triplet Objective Function

# 参考
1. [Sentence-Bert论文笔记](https://zhuanlan.zhihu.com/p/113133510)

1xx. [短文本相似度算法研究](https://zhuanlan.zhihu.com/p/111414376)
1xx. [SentenceBert模型：文本语义去重](https://www.bilibili.com/video/BV13h4y1a7z6/) v
1xx. [Sentence-BERT（SBERT）模型介绍及Sentence Transformers库的使用](https://zhuanlan.zhihu.com/p/659682364)
1xx. [大型语言模型：SBERT — 句子BERT](https://cloud.tencent.com/developer/article/2330969)

1xx. [传统方法TF-IDF解决短文本相似度问题](https://zhuanlan.zhihu.com/p/113017752)
1xx. [传统方法BM25解决短文本相似度问题](https://zhuanlan.zhihu.com/p/113224707)
