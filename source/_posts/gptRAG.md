---
title: (综述)RAG
date: 2022-11-02 09:57:59
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

# RAG Overview[2]
{% asset_img 'rag-overview.jpg' %}


# RAG vs FT [2]
{% asset_img 'rag-vs-ft.jpg' %}


# Modular RAG[4]
{% asset_img 'moduleRAG.webp' %}

### indexing
  - **chunk优化**
    - small-to-big
      用小块做索引，但召回大块
    - sliding window
      滑动窗口，提高语义连贯性
    - summary摘要（解决跨文档）以及结构化的组织
      例如使用知识图谱进行文档内容的组织，根据文档结构进行层级组织

### pre-retrival阶段
  - **query-routing**
    - Metadata Router/ Filter  问题的分发
    - Semantic Router  意图分类 [10]
      [semantic-router](https://github.com/aurelio-labs/semantic-router/) git
  -  **query-expansion**  
     - Multi-Query 一变多
     - Sub-Query 拆分子query
     - CoVe
  -  **query transformer**
     - query rewrite改写
     - HyDE
     - Step-back Prompting
  -  **query construction**  
     - text-cypher  
     - text2sql 
     - 将结构化知识利用起来
     
### Retrieval
  - **Retriver Selection** 检索方式的选择
     - Sparse Retriever
       稀疏检索（es字符串匹配）
     - Dense Retriever
       稠密检索（向量化检索）
  - Retriever Fine-tuning  检索的微调
     -  SFT
     -  adapter

### post-retrieval 包括一些后处理的模块
  - **rerank重排**
    - Rule-base Rerank  基于规则的
    - Model-base Rerank 基于模型的
      基于大模型llm本身的
  -  compresion/selection 上下文压缩 
     - llmlingua 
     - recomp
     - selective context
     - 核心在于利用不同的手段，将上下文中不重要的信息进行剔除

### Generation阶段
  - Generator Selection
  - Generator Fine-tuning
  - 则包括对底层基础模型的一些事情，比如基于cloud-api，还是进行SFT微调。

### orchestraction阶段
  - Scheduling
  - Fusion
  - 则包括对各个模块之间的执行和通信进行管理

# 参考

### 综述
2. 《Retrieval-Augmented Generation for Large Language Models: A Survey》
   [面向大语言模型的检索增强生成技术：综述 [译]](https://baoyu.io/translations/ai-paper/2312.10997-retrieval-augmented-generation-for-large-language-models-a-survey)  翻译
   [LLM之RAG理论（二）| RAG综述论文详解](https://zhuanlan.zhihu.com/p/673910600)
   [同济大学发布最新检索增强(RAG)的LLM生成技术综述](https://cloud.tencent.com/developer/article/2373340)
   [面向大模型的检索增强生成（RAG）综述 ](https://mp.weixin.qq.com/s/JjcN6OoxNK7tddmIOpvr2g)     
   [大语言模型的检索增强生成 (RAG) 方法](https://www.promptingguide.ai/zh/research/rag)
   
3. [NLP（廿一）：从 RAG 到 Self-RAG —— LLM 的知识增强](https://zhuanlan.zhihu.com/p/661465330?utm_id=0) *** 


4. [值得一看的大模型RAG问答总括性梳理：模块化(Modular)RAG范式的定义、构成及机遇 ](https://mp.weixin.qq.com/s/j07PkTCoxBzAhkyON1puPg)
1xx. [大模型RAG问答行业最佳案例及微调、推理双阶段实现模式：基于模块化(Modular)RAG自定义RAG Flow ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648407638&idx=1&sn=5c167b4a11bc483f5790ef1e0340d670)

1xx. [北大最新综述精读：RAG在AIGC中的前世今生，覆盖300篇论文！](https://mp.weixin.qq.com/s/FKv9glaGZD0qbLmB2zg6bg)
   [最新RAG综述来了！北京大学发布AIGC的检索增强技术综述](https://mp.weixin.qq.com/s?__biz=MzkzODMxNTkzNg==&mid=2247484337&idx=1&sn=484db46f6a974cb26b7659096b31cdd8)

### Modular RAG
10. [Sematic router 让LLM更加快速做出决策](https://www.bilibili.com/video/BV1H64y1E75Y/)

11. [如何使用LLMs：Chain of Verification (CoVe)](https://zhuanlan.zhihu.com/p/669977863)
    [Chain of Verification (CoVe) — Understanding & Implementation](https://sourajit16-02-93.medium.com/chain-of-verification-cove-understanding-implementation-e7338c7f4cb5)

### 评估
1xx. [再看大模型RAG检索增强如何评估：RAGAS开源自动化评估框架](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404511&idx=2&sn=fefb78c1d920cb5b437f2e3da9935637)
1xx. [大模型RAG检索增强问答如何评估：噪声、拒答、反事实、信息整合四大能力评测任务探索 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404476&idx=2&sn=d07b27dc9162ab0aaec3108004e4cfbe)


XXX
1xx. [知识密集型自然语言处理任务的检索增强生成技术研究 [译]](https://baoyu.io/translations/ai-paper/2005.11401-retrieval-augmented-generation-for-knowledge-intensive-nlp-tasks)
1xx. [构建企业级 RAG 系统的高级指南 [译]](https://baoyu.io/translations/rag/mastering-rag-how-to-architect-an-enterprise-rag-system)
1xx. [在构建检索增强型生成系统时的七大挑战 [译]](https://baoyu.io/translations/ai-paper/2401.05856v1-seven-failure-points-when-engineering-a-retrieval-augmented-generation-system)





