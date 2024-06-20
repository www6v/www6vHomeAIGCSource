---
title: (原理|实战)RAG Index
date: 2023-05-21 17:09:42
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


# 分块[20]
### 分块方法
+ 固定大小分块
+ 内容感知分块
  - 句子分块
  	- 直接分割
    	按句点（“.”）和换行符分割句子
  	- NLTK 
    	<code>from langchain.text_splitter import NLTKTextSplitter</code>
  	- spaCy
    	<code>from langchain.text_splitter import SpacyTextSplitter</code>
  - 递归分块
    使用一组分隔符以分层和迭代的方式将输入文本划分为更小的块
    <code>from langchain.text_splitter import RecursiveCharacterTextSplitter</code>
  - 专门分块
    - Markdown
    - LaTex

### 分块优化
+ 预处理数据
+ 选择块大小范围
+ 评估每个块大小的性能

### 分块参数
chuck_size, ,chunk overlap
top_k

> 最佳实践
  按**逻辑分块**可以明显提升**检索器的准确率**



#  索引-Langchain[13]
### Smaller chunks [11][12] 
Indexing by **small data chunks**
按子部分索引数据块：将文本块拆分为较小的部分，如句子，进行多次索引。这有助于
处理复杂文本块，减少噪音输出，确保更准确匹配用户查询。

### Hypothetical questions [11][12]
Indexing by **the questions the document answers**
按文本块回答的问题索引数据块：让LLM生成与拆分的文本块相关的假设性问题，并用
于索引。这种方法保持用户查询与数据核心内容一致，降低模糊性。

### Summary [11][12]
Indexing by **the summary of the document**

按文本块摘要索引数据块：类似于第二种方法，使用块摘要而不是回答的假设问题来创
建索引。特别适用于文本块中包含多余信息或与用户查询无关的情况。

# 索引 [1]
### Multi-representation Indexing
使用**LLM生成**针对检索进行优化的**文档摘要**（“命题”）。**嵌入这些摘要以进行相似性搜索**，但将完整文档返回给LLM进行生成。

【多模态的例子】

> 相关的: 父级documents的索引

### 层级性索引-RAPTOR[2]
【raptor 效果也很好，就是需要总结，看总结的咋样了】
【raptor 原文是对 chunk 聚类，然后每个聚类做总结】

【ragflow 使用了RAPTOR】

### 做token到text级-ColBERT

### spRAG [3]
【这个 spRAG 的 rse 比子母 chunk 要灵活一点,   试了一下 】
AutoContext在嵌入各个文本块之前，先自动将文档级别的上下文信息注入到每个块中。RSE对检索到的相关文本块进行聚类，将内容相似或语义相关的块归为一组。然后，它会根据查询的需求，智能地选择和组合这些块，形成长度适当、信息相关的文本段。

# 参考

1. [一文详看Langchain框架中的RAG多阶段优化策略：从问题转换到查询路由再到生成优化](https://mp.weixin.qq.com/s/pK2BRLrWpEKKIPFhUtGvcg)
   [rag-from-scratch Repo](https://github.com/langchain-ai/rag-from-scratch) git   
   
2. [基于RAPTOR实现高质量长上下文的RAG ](https://mp.weixin.qq.com/s/SeOG15Z2RJmiJ5sAP91B4w)   未

3. [20240520大模型&KG&RAG进展回顾：spRAG优化策略、电信领域大模型及手语生成大模型](https://mp.weixin.qq.com/s/1a-h9CBZtRARG7_sOK9g8Q) 未
   RAPTOR  spRAG 

1xx. [20240205大模型进展早报：兼看引入chunk层级结构的大模型RAG的思路：RAPTOR ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648407870&idx=1&sn=8073f0fc8edc0897e3627f26478063c3) RAPTOR



### 
11. [3种高级索引方法，有效提升RAG性能](https://www.bilibili.com/video/BV1dH4y1C7Ck/) V
      [The Tech Buffet #12: Improve RAG Pipelines With These 3 Indexing Methods](https://thetechbuffet.substack.com/p/rag-indexing-methods)
      [How To Optimize Your RAG Pipelines](https://newsletter.theaiedge.io/p/how-to-optimize-your-rag-pipelines)

12.  [【RAG实战】 Multi-Vector-Retrieval实现三种高级索引方法](https://www.bilibili.com/video/BV1Vu4y1H72s/) V
    [MultiVectorRetriever](https://github.com/www6v/AIGC/blob/master/retriever%2Bindex/MultiVectorRetriever)  git 
      [MultiVector Retriever](https://python.langchain.com/docs/modules/data_connection/retrievers/multi_vector)
    
13. {% post_link 'gptRetrievers' %} self       

## 分块
20. [大语言模型应用中的文本分块策略](https://hustai.gitee.io/zh/posts/rag/Chunking-Strategies.html)
      [LLM 应用中的分块策略 ](https://yangfei.me/tutorials/chunking-strategies)

1xx. [文本分割的五个层次 [译]](https://baoyu.io/translations/rag/5-levels-of-text-splitting)

1xx. [ChunkViz v0.1](https://chunkviz.up.railway.app/)  可视化

1xx. [大模型文档理解前沿动向-细粒度多页文档理解：兼看文本切分组件semchunk ](https://mp.weixin.qq.com/s/Ytu6B0Me7BDwueud9djFHg)
    问题2:关于一个快速文档语义切分组件semchunk
