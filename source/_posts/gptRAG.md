---
title: RAG 原理
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

# Advanced RAG
### 架构 [1]
  - 离线 index
  - 在线 查询

{% asset_img 'rag.jpg' %}

###  RAG Fusion
# RAG vs FT [2]
{% asset_img 'rag-vs-ft.jpg' %}

#  Self-RAG [3]
Self-RAG 则是更加主动和智能的实现方式，主要步骤概括如下：
1. 判断是否需要额外检索事实性信息（retrieve on demand），仅当有需要时才召回
2. 平行处理每个片段：生产prompt+一个片段的生成结果
3. 使用**反思字段(Reflection tokens)**，检查输出是否相关，选择最符合需要的片段；
4. 再重复检索
5. 生成结果会引用相关片段，以及输出结果是否符合该片段，便于查证事实。

# 多模态+RAG[3][5]

# 参考
1. [Deconstructing RAG](https://blog.langchain.dev/deconstructing-rag/) ***

### 综述
2. [LLM之RAG理论（二）| RAG综述论文详解](https://zhuanlan.zhihu.com/p/673910600)
3. [NLP（廿一）：从 RAG 到 Self-RAG —— LLM 的知识增强](https://zhuanlan.zhihu.com/p/661465330?utm_id=0) *** 

### Self-RAG
4. [original implementation of SELF-RAG](https://github.com/www6v/self-rag)

### 多模态
5. [万字综述：2023年多模态检索增强生成技术(mRAG)最新进展与趋势-图片、代码、图谱、视频、声音、文本](https://zhuanlan.zhihu.com/p/665078079) 


100. [高级检索增强生成技术(RAG)全面指南：原理、分块、编码、索引、微调、Agent、展望](https://zhuanlan.zhihu.com/p/673922981) 未




