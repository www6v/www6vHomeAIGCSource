---
title: (原理)RAG 性能
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


#  索引方式  [1][2]
### Smaller chunks
Indexing by **small data chunks**
按子部分索引数据块：将文本块拆分为较小的部分，如句子，进行多次索引。这有助于
处理复杂文本块，减少噪音输出，确保更准确匹配用户查询。

### Hypothetical questions
Indexing by **the questions the document answers**
按文本块回答的问题索引数据块：让LLM生成与拆分的文本块相关的假设性问题，并用
于索引。这种方法保持用户查询与数据核心内容一致，降低模糊性。

### Summary
Indexing by **the summary of the document**

按文本块摘要索引数据块：类似于第二种方法，使用块摘要而不是回答的假设问题来创
建索引。特别适用于文本块中包含多余信息或与用户查询无关的情况。


# 分块[3]
### 分块参数
chuck_size, ,chunk overlap
top_k

> 最佳实践
  按**逻辑分块**可以明显提升**检索器的准确率**

# 检索器 Retriever
+ Ensemble Retriever
最常见的模式是将**稀疏检索器（如BM25）**与**密集检索器（如嵌入相似度）**结合起来，因为它们的优势是互补的。这也被称为“混合搜索”。**稀疏检索器**擅长基于**关键词查找**相关文档，而**密集检索器**擅长基于**语义相似性查找**相关文档。

> 最佳实践
**BM25+FAAIS   好于 FAAIS相似度搜索**
**FAAIS相似度搜索 好于 HyDE和上下文压缩**

# Embedding
+ HyDE
At a high level, HyDE is an embedding technique that takes queries, **generates a hypothetical answer**, and then embeds that generated document and uses that as the final example.

> 最佳实践
**BGE** 优于 OpenAI ADA02

# Reranker
### 什么是Reranker [6]
A reranking model — also known as a **cross-encoder** — is a type of model that,** given a query and document pair, will output a similarity score.** 

### BGE Ranker [4]
**交叉编码器**将对查询和答案实时计算相关性分数，这比**向量模型(即双编码器)**更准确，但比向量模型更耗时。 因此，它可以用来对嵌入模型返回的前k个文档重新排序。 我们在多语言数据上训练了交叉编码器，数据格式与向量模型相同，因此您可以根据我们的示例 轻松地对其进行微调。 

### 优秀的组合 [5]
OpenAI + CohereRerank
Voyage + big-reranker-large

# 参考
1. [3种高级索引方法，有效提升RAG性能](https://www.bilibili.com/video/BV1dH4y1C7Ck/) V
   [The Tech Buffet #12: Improve RAG Pipelines With These 3 Indexing Methods](https://thetechbuffet.substack.com/p/rag-indexing-methods)
   [How To Optimize Your RAG Pipelines](https://newsletter.theaiedge.io/p/how-to-optimize-your-rag-pipelines)

2.  [【RAG实战】 Multi-Vector-Retrieval实现三种高级索引方法](https://www.bilibili.com/video/BV1Vu4y1H72s/) V
    [MultiVectorRetriever](https://github.com/www6v/AIGC/blob/master/retriever%2Bindex/MultiVectorRetriever)   
   [MultiVector Retriever](https://python.langchain.com/docs/modules/data_connection/retrievers/multi_vector)


3. [大语言模型应用中的文本分块策略](https://hustai.gitee.io/zh/posts/rag/Chunking-Strategies.html)
   [LLM 应用中的分块策略 ](https://yangfei.me/tutorials/chunking-strategies)

4. [BGE Reranker](https://github.com/FlagOpen/FlagEmbedding/blob/master/README_zh.md)
   [transformers二次开发——bge-reranker模型微调流程](https://www.bilibili.com/video/BV1sQ4y137Ft/) V
   
5. [提升RAG——选择最佳Embedding和重新排名模型 ](https://luxiangdong.com/2023/11/06/rerank-ev/#) 
   [Boosting RAG: Picking the Best Embedding & Reranker models](https://blog.llamaindex.ai/boosting-rag-picking-the-best-embedding-reranker-models-42d079022e83)
   
6. [Rerankers and Two-Stage Retrieval](https://www.pinecone.io/learn/series/rag/rerankers/)   
   文中的第二阶段就是指Reranker

1xx. [A Survey of Techniques for Maximizing LLM Performance](https://www.youtube.com/watch?v=ahnGLM-RC1Y)  *** V
    [A Survey of Techniques for Maximizing LLM Performance梳理](https://zhuanlan.zhihu.com/p/670880685) 

1xx. [A Cheat Sheet and Some Recipes For Building Advanced RAG](https://blog.llamaindex.ai/a-cheat-sheet-and-some-recipes-for-building-advanced-rag-803a9d94c41b)
     [LlamaIndex官方年度巨献：高清大图纵览高级 RAG技术，强烈推荐收藏 ](https://mp.weixin.qq.com/s/KM8c3PUww1SOK1dbLjn1Tw) *** 看图
     [构建高级 RAG 的指南和技巧 [译]](https://baoyu.io/translations/rag/a-cheat-sheet-and-some-recipes-for-building-advanced-rag)

1xx. [Advanced RAG Techniques: an Illustrated Overview](https://pub.towardsai.net/advanced-rag-techniques-an-illustrated-overview-04d193d8fec6) 
     [最全的RAG技术概览 ](https://mp.weixin.qq.com/s/CO7hMv4RW7OE6zwUmVfp5A)
     
1xx. [文本分割的五个层次 [译]](https://baoyu.io/translations/rag/5-levels-of-text-splitting)

1xx. [大模型RAG问答技术架构及核心模块回顾：从Embedding、prompt-embedding到Reranker ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648406795&idx=1&sn=00ea4aab819eed3d622287fa1d32816f) ***

1xx. CON
   [引入COT缓解大模型RAG问答的上下文区分问题：兼看Langchain的表格检索思路及GPTBIAS评估框架 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648406194&idx=1&sn=aafe667fa5a73bd89a00272c5598c98e) CON
   [Chain-Of-Note (CoN) Retrieval For LLMs](https://cobusgreyling.medium.com/chain-of-note-con-retrieval-for-llms-763ead1ae5c5)
   [Cutting Through the Noise: Chain-of-Note’s (CoN) Robust Approach to super power your RAG pipelines](https://praveengovindaraj.com/cutting-through-the-noise-chain-of-notes-con-robust-approach-to-super-power-your-rag-pipelines-0df5f1ce7952)