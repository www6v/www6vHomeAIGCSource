---
title: RAG Rerank
date: 2023-05-14 18:23:41
tags:
  - RAG
categories: 
  - AIGC
  - RAG  
---

<p></p>
<!-- more -->





## Reranker
### 什么是Reranker [22]
A reranking model — also known as a **cross-encoder** — is a type of model that,**given a query and document pair, will output a similarity score.** 

### BGE Ranker [20]
**交叉编码器**将对查询和答案实时计算相关性分数，这比**向量模型(即双编码器)**更准确，但比向量模型更耗时。 因此，它可以用来对嵌入模型返回的前k个文档重新排序。 我们在多语言数据上训练了交叉编码器，数据格式与向量模型相同，因此您可以根据我们的示例 轻松地对其进行微调。 

### 优秀的组合 [21]
OpenAI + CohereRerank
Voyage + big-reranker-large

### BCE[24]
中文效果比BGE好[老刘说nlp]





# 参考

20. [BGE Reranker](https://github.com/FlagOpen/FlagEmbedding/blob/master/README_zh.md)
      [transformers二次开发——bge-reranker模型微调流程](https://www.bilibili.com/video/BV1sQ4y137Ft/) V
   
21. [提升RAG——选择最佳Embedding和重新排名模型 ](https://luxiangdong.com/2023/11/06/rerank-ev/#) 
      [Boosting RAG: Picking the Best Embedding & Reranker models](https://blog.llamaindex.ai/boosting-rag-picking-the-best-embedding-reranker-models-42d079022e83)

22. [Rerankers and Two-Stage Retrieval](https://www.pinecone.io/learn/series/rag/rerankers/)   
      文中的第二阶段就是指Reranker

24. [youdao RerankerModal](https://github.com/netease-youdao/BCEmbedding) BCE
