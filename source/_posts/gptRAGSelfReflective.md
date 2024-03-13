---
title:  Self-Reflective RAG
date: 2023-03-02 17:12:22
tags:
  - RAG
categories: 
  - AIGC
  - RAG  
---

<p></p>
<!-- more -->


# Cognitive Architecture [2]
+ Cognitive architectures for RAG [1]

# Corrective RAG


#  Self-RAG [3]  # SELF-RAG
Self-RAG 则是更加主动和智能的实现方式，主要步骤概括如下：
1. 判断是否需要额外检索事实性信息（retrieve on demand），仅当有需要时才召回
2. 平行处理每个片段：生产prompt+一个片段的生成结果
3. 使用**反思字段(Reflection tokens)**，检查输出是否相关，选择最符合需要的片段；
4. 再重复检索
5. 生成结果会引用相关片段，以及输出结果是否符合该片段，便于查证事实。

# 参考

1. [Self-Reflective RAG with LangGraph](https://blog.langchain.dev/agentic-rag-with-langgraph/)

2. [OpenAI's Bet on a Cognitive Architecture](https://blog.langchain.dev/openais-bet-on-a-cognitive-architecture/)

3. [NLP（廿一）：从 RAG 到 Self-RAG —— LLM 的知识增强](https://zhuanlan.zhihu.com/p/661465330?utm_id=0) *** 

### Corrective RAG
1xx. [Corrective Retrieval Augmented Generation](https://arxiv.org/pdf/2401.15884.pdf) Figure 2
1xx. [Corrective RAG (CRAG)](https://github.com/langchain-ai/langgraph/blob/main/examples/rag/langgraph_crag.ipynb) git

### SELF-RAG
1xx. [SELF-RAG: LEARNING TO RETRIEVE, GENERATE, AND
CRITIQUE THROUGH SELF-REFLECTION](https://arxiv.org/pdf/2310.11511.pdf) Figure 1
1xx. [Self-RAG](https://github.com/langchain-ai/langgraph/blob/main/examples/rag/langgraph_self_rag.ipynb) git



### Self-RAG
1xx. [original implementation of SELF-RAG](https://github.com/www6v/self-rag)