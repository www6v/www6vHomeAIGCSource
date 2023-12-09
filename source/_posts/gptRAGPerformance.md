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

# 分块
### 分块策略  [1]
1. Indexing by small data chunks
2. Indexing by the questions the document answers
3. Indexing by the summary of the document

### 分块参数

### openai RAG 成功案例
{% asset_img 'openai-rag.jpg' %}

1. retrieval with consine similarity
2. **HyDE retrieval**
   FT Embeddings
   **Chunk/embedding experiments**
3. Reranking
   Classification step
4. Prompt engineering
   **Tool use**
   **Query expansion**

# 参考

1. [The Tech Buffet #12: Improve RAG Pipelines With These 3 Indexing Methods](https://thetechbuffet.substack.com/p/rag-indexing-methods)
   [How To Optimize Your RAG Pipelines](https://newsletter.theaiedge.io/p/how-to-optimize-your-rag-pipelines)

2. [大语言模型应用中的文本分块策略](https://hustai.gitee.io/zh/posts/rag/Chunking-Strategies.html)
   [LLM 应用中的分块策略 ](https://yangfei.me/tutorials/chunking-strategies)
   
3. [Applying OpenAI's RAG Strategies](https://blog.langchain.dev/applying-openai-rag/)   
