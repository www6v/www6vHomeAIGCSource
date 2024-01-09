---
title: RAG 性能
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
+ 按**逻辑分块**可以明显提升**检索器的准确率**

# 检索器 Retriever
+ Ensemble Retriever
最常见的模式是将**稀疏检索器（如BM25）**与**密集检索器（如嵌入相似度）**结合起来，因为它们的优势是互补的。这也被称为“混合搜索”。**稀疏检索器**擅长基于**关键词查找**相关文档，而**密集检索器**擅长基于**语义相似性查找**相关文档。

+ 最佳实践
**BM25+FAAIS   好于 FAAIS相似度搜索**
**FAAIS相似度搜索 好于 HyDE和上下文压缩**

# Embedding
+ HyDE
At a high level, HyDE is an embedding technique that takes queries, **generates a hypothetical answer**, and then embeds that generated document and uses that as the final example.

+ 最佳实践
**BGE** 优于 OpenAI ADA02

# 参考
1. [3种高级索引方法，有效提升RAG性能](https://www.bilibili.com/video/BV1dH4y1C7Ck/) V
   [The Tech Buffet #12: Improve RAG Pipelines With These 3 Indexing Methods](https://thetechbuffet.substack.com/p/rag-indexing-methods)
   [How To Optimize Your RAG Pipelines](https://newsletter.theaiedge.io/p/how-to-optimize-your-rag-pipelines)

   
2.  [【RAG实战】 Multi-Vector-Retrieval实现三种高级索引方法](https://www.bilibili.com/video/BV1Vu4y1H72s/) V
    [MultiVectorRetriever](https://github.com/www6v/AIGC/blob/master/retriever%2Bindex/MultiVectorRetriever)   
   [MultiVector Retriever](https://python.langchain.com/docs/modules/data_connection/retrievers/multi_vector)
  

3. [大语言模型应用中的文本分块策略](https://hustai.gitee.io/zh/posts/rag/Chunking-Strategies.html)
   [LLM 应用中的分块策略 ](https://yangfei.me/tutorials/chunking-strategies)

100. [A Survey of Techniques for Maximizing LLM Performance](https://www.youtube.com/watch?v=ahnGLM-RC1Y)  *** V
    [A Survey of Techniques for Maximizing LLM Performance梳理](https://zhuanlan.zhihu.com/p/670880685) 
