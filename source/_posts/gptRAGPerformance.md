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



# 分块

### 分块策略  [1]
1. Indexing by **small data chunks**
2. Indexing by **the questions the document answers**
3. Indexing by **the summary of the document**

### 分块参数
chuck_size, ,chunk overlap
top_k
+ 按**逻辑分块**可以明显提升**检索器的准确率**

# 检索器 Retriever
+ Ensemble Retriever
最常见的模式是将**稀疏检索器（如BM25）**与**密集检索器（如嵌入相似度）**结合起来，因为它们的优势是互补的。这也被称为“混合搜索”。**稀疏检索器**擅长基于**关键词查找**相关文档，而**密集检索器**擅长基于**语义相似性查找**相关文档。

**BM25+FAAIS   好于 FAAIS相似度搜索**
**FAAIS相似度搜索 好于 HyDE和上下文压缩**

# embeding
**BGE** 优于 OpenAI ADA02

+ HyDE
At a high level, HyDE is an embedding technique that takes queries, generates a hypothetical answer, and then embeds that generated document and uses that as the final example.

# OpenAI RAG 成功案例[3]
{% asset_img 'openai-rag.jpg' %}

1. retrieval with consine similarity
2. **HyDE retrieval** [5]
   Fine-tune Embeddings
   **Chunk/embedding experiments**
3. **Reranking** [6]
   Classification step
4. Prompt engineering
   **Tool use**
   **Query expansion**[5]

### Query Transformations[5]
+ **Query expansion**
  Multi-query retriever 
+ **HyDE**
+ Step back prompting
 [抽象prompting]
+ Rewrite-Retrieve-Read

### Query Construction [4]
{% asset_img 'structured_data_stacks.jpg' %}

| **Examples**                | **Data source** | **References**                                               |
| --------------------------- | --------------- | ------------------------------------------------------------ |
| **Text-to-metadata-filter** | Vectorstores    | [**Docs**](https://python.langchain.com/docs/modules/data_connection/retrievers/self_query/?ref=blog.langchain.dev#constructing-from-scratch-with-lcel) |
| **Text-to-SQL**             | SQL DB          | [**Docs**](https://python.langchain.com/docs/use_cases/qa_structured/sql?ref=blog.langchain.dev)**,** [**blog**](https://blog.langchain.dev/llms-and-sql/)**,** [**blog**](https://blog.langchain.dev/incorporating-domain-specific-knowledge-in-sql-llm-solutions/) |



+ Text-to-metadata-filter [7]

A **self-querying** retriever is one that, as the name suggests, has the  ability to query itself. Specifically, given any natural language query, the retriever uses a query-constructing LLM chain to write a **structured query** and then applies that structured query to its underlying  VectorStore. This allows the retriever to not only use the user-input  query for semantic similarity comparison with the contents of stored  documents but to also **extract filters from the user query on the  metadata of stored documents and to execute those filters**.

# 参考

1. [The Tech Buffet #12: Improve RAG Pipelines With These 3 Indexing Methods](https://thetechbuffet.substack.com/p/rag-indexing-methods)
   [How To Optimize Your RAG Pipelines](https://newsletter.theaiedge.io/p/how-to-optimize-your-rag-pipelines)

2. [大语言模型应用中的文本分块策略](https://hustai.gitee.io/zh/posts/rag/Chunking-Strategies.html)
   [LLM 应用中的分块策略 ](https://yangfei.me/tutorials/chunking-strategies)

3. [Applying OpenAI's RAG Strategies](https://blog.langchain.dev/applying-openai-rag/)   *** 

4. [Query Construction](https://blog.langchain.dev/query-construction/) ***

5. [Query Transformations](https://blog.langchain.dev/query-transformations/)

6. [Say Goodbye to Irrelevant Search Results: Cohere Rerank Is Here](https://txt.cohere.com/rerank/)
   [Rerank](https://github.com/langchain-ai/langchain/tree/master/templates/rag-pinecone-rerank)
   
7. [self_query](https://github.com/langchain-ai/langchain/blob/master/docs/docs/modules/data_connection/retrievers/self_query.ipynb)

100. [A Survey of Techniques for Maximizing LLM Performance](https://www.youtube.com/watch?v=ahnGLM-RC1Y)  *** V

   [A Survey of Techniques for Maximizing LLM Performance梳理](https://zhuanlan.zhihu.com/p/670880685) 
