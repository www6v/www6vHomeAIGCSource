---
title: (原理)Advanced RAG
date: 2022-12-07 09:44:24
tags:
  - RAG
categories: 
  - AIGC
  - RAG  
---

<p></p>
<!-- more -->



## 目录
<!-- toc -->

# Overview

### Advanced RAG [2]
{% asset_img 'advanced-rag.JPG' %}

### Advanced RAG [1]
{% asset_img 'advaced.png' %}


# Embedding
> 最佳实践
**BGE** 优于 OpenAI ADA02

# 索引
##  索引方式  
### 向量存储索引[1]
+ 近似最近邻实现（如聚类、树或HNSW算法）
  Faiss、nmslib、annoy
+ LlamaIndex

### 层次索引[1]
+ 创建**两个索引**—一个由摘要组成，另一个由文档块组成，并分两步检索，首先通过摘要过滤掉相关文档，然后只在这个相关组内检索。

### 假设问题和HyDE[1]

### 上下文丰富[1]
+ 句子窗口检索
  为了在获取最相关的单个句子后更好地对找到的上下文进行推理，我们**将上下文窗口在检索到的句子之前和之后扩展了k个句子，然后将此扩展的上下文发送给LLM**。
+ 自动合并检索器（又名**父文档检索器**）
  
### 融合检索或混合搜索[1]
基于关键字的老式搜索—稀疏检索算法（如tf-idf或搜索行业标准BM25）和现代语义或向量搜索，并将其组合到一个检索结果中。

+ Reciprocal Rank Fusion (RRF)算法
  对检索到的结果进行重新排序以获得最终输出
+ 实现
  LangChain  - Ensemble Retriever类
  
## 分块 [1]


# pre-retrival阶段
### query transformer 查询转换 [30][1]

### query-routing 查询路由  [31][1]
LlamaIndex和LangChain都支持查询路由器

# Retrieval
### 检索器 Retriever
+ Ensemble Retriever
最常见的模式是将**稀疏检索器（如BM25）**与**密集检索器（如嵌入相似度）**结合起来，因为它们的优势是互补的。这也被称为“混合搜索”。**稀疏检索器**擅长基于**关键词查找**相关文档，而**密集检索器**擅长基于**语义相似性查找**相关文档。

> 最佳实践
**BM25+FAAIS   好于 FAAIS相似度搜索**
**FAAIS相似度搜索 好于 HyDE和上下文压缩**


# Post-Retrieval
## Reranker[20]


## Fusion[23]
其思想在于通过生成多个用户查询和重新排序结果来解决RAG固有的约束；利用倒数排序融合（RRF）和自定义向量评分加权，生成全面准确的结果。


# Encoder and LLM fine-tuning
### Encoder fine-tuning[40]

### Ranker fine-tuning[41]

它的工作方式如下：将查询和检索到的前k个文本块传递给交叉编码器，并用SEP令牌分隔，并将其微调为输出1表示相关块，输出0表示不相关。

### LLM fine-tuning[42]


# 参考
### Overview
1. [Advanced RAG Techniques: an Illustrated Overview](https://pub.towardsai.net/advanced-rag-techniques-an-illustrated-overview-04d193d8fec6)  ***
   [最全的RAG技术概览 ](https://mp.weixin.qq.com/s/CO7hMv4RW7OE6zwUmVfp5A)
   [高级检索增强生成技术(RAG)全面指南：原理、分块、编码、索引、微调、Agent、展望](https://zhuanlan.zhihu.com/p/673922981) 

2. 《Retrieval-Augmented Generation for Large Language Models: A Survey》

1xx. [A Cheat Sheet and Some Recipes For Building Advanced RAG](https://blog.llamaindex.ai/a-cheat-sheet-and-some-recipes-for-building-advanced-rag-803a9d94c41b)
     [LlamaIndex官方年度巨献：高清大图纵览高级 RAG技术，强烈推荐收藏 ](https://mp.weixin.qq.com/s/KM8c3PUww1SOK1dbLjn1Tw) *** 看图
     [构建高级 RAG 的指南和技巧 [译]](https://baoyu.io/translations/rag/a-cheat-sheet-and-some-recipes-for-building-advanced-rag)
     
### Post-Retrieval
20. {% post_link 'gptRAGRerank' %} self
23. [RAG Fusion](https://github.com/langchain-ai/langchain/blob/master/cookbook/rag_fusion.ipynb) git
      [Forget RAG, the Future is RAG-Fusion](https://towardsdatascience.com/forget-rag-the-future-is-rag-fusion-1147298d8ad1)
      [忘记RAG，未来是RAG-Fusion](https://blog.csdn.net/lichunericli/article/details/135451681)
      [再谈大模型RAG问答中的三个现实问题：兼看RAG-Fusion多query融合策略、回答引文生成策略及相关数据集概述](https://mp.weixin.qq.com/s/NFjn8pUsQaSx85nhBphORA)

1xx. [传统RAG破局者：混合检索助力新纪元](https://mp.weixin.qq.com/s/xu6z0zRQxQF2iOEvG-Sysg)
     四、混合检索的原理   六、何时使用混合检索？
# pre-retrival
30. {% post_link 'gptQueryTransformation' %}  self
31. {% post_link 'gptRAGRouting' %}  self


### fine-tuning
40. [Finetune Embeddings](https://docs.llamaindex.ai/en/stable/examples/finetuning/embeddings/finetune_embedding/) notebook

41. [How to Finetune a cross-encoder using LLamaIndex](https://docs.llamaindex.ai/en/stable/examples/finetuning/cross_encoder_finetuning/cross_encoder_finetuning/) notebook

42. [Fine Tuning GPT-3.5-Turbo](https://docs.llamaindex.ai/en/stable/examples/finetuning/openai_fine_tuning/) notebook


1xx. [A Survey of Techniques for Maximizing LLM Performance](https://www.youtube.com/watch?v=ahnGLM-RC1Y)  *** V
    [A Survey of Techniques for Maximizing LLM Performance梳理](https://zhuanlan.zhihu.com/p/670880685) 


1xx. [大模型RAG问答技术架构及核心模块回顾：从Embedding、prompt-embedding到Reranker ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648406795&idx=1&sn=00ea4aab819eed3d622287fa1d32816f) ***

