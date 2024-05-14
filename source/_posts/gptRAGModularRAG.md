---
title: (原理)Modular RAG
date: 2023-04-21 19:22:24
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

# Modular RAG[1]
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
  - **query-routing** [2]
    - Metadata Router/ Filter  问题的分发
    - Semantic Router  意图分类 
  -  **query-expansion**  
     - Multi-Query 一变多
     - Sub-Query 拆分子query
     - CoVe[3]
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
  - Retriever Fine-tuning  检索的微调  [4] #
     -  SFT
        【embedding tuning】
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
    - Cloud API-base Generator
    - On-Premises 
  - Generator Fine-tuning  [4] #
    - SFT 
    - Distillation
    - Dual FT
      Fine-tuning both Generator and Retriever to align their preferences
      RA-DIT
  - 则包括对底层基础模型的一些事情，比如基于cloud-api，还是进行SFT微调。
    【Generator 指的就是LLM】
    
### orchestraction阶段
  - Scheduling
  - Fusion
    - Possibility Ensemble
    - RRF (Reciprocal Rank Fusion )
  - 则包括对各个模块之间的执行和通信进行管理


>  #符号   Modular RAG 相对 advanced RAG 的特殊阶段

# 参考
### Modular RAG
1. [值得一看的大模型RAG问答总括性梳理：模块化(Modular)RAG范式的定义、构成及机遇 ](https://mp.weixin.qq.com/s/j07PkTCoxBzAhkyON1puPg)
1xx. [大模型RAG问答行业最佳案例及微调、推理双阶段实现模式：基于模块化(Modular)RAG自定义RAG Flow ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648407638&idx=1&sn=5c167b4a11bc483f5790ef1e0340d670)

2. {% post_link 'gptRAGRouting' %}  self
    
3. [如何使用LLMs：Chain of Verification (CoVe)](https://zhuanlan.zhihu.com/p/669977863)
    [Chain of Verification (CoVe) — Understanding & Implementation](https://sourajit16-02-93.medium.com/chain-of-verification-cove-understanding-implementation-e7338c7f4cb5)
    
4.  {% post_link 'gptRAGPerformance' %}  self 