---
title: (原理|实战)Query Transformation
date: 2023-04-20 22:51:05
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



# Transformation-多样性
### Multi Query多查询策略[3]
该方法**从多个角度重写用户问题**，为每个重写的问题检索文档，返回所有查询的唯一文档。

### RAG-Fusion多查询结果融合策略[3]
将多个召回查询的结果进行**合并**

### Decomposition问题分解策略[3]
+ Answer recursively迭代式回答
  在问题分解的基础上，逐步迭代出答案，**将上一步问题的答案，与下一步骤的答案进行拼接**，送入大模型进行问答

+ Answer individually
  也可以**让每个subquery分别进行处理**，然后得到答案，然后再拼接成一个QA pairspprompt最终形成答案。

### query rewrite [1][2]
+ [论文](https://arxiv.org/pdf/2305.14283.pdf)**使用LLM重写用户查询**，而不是直接使用原始用户查询进行检索。
因为对于LLM 而言，**原始查询不可能总是最佳检索结果**，可以让LLM重写查询。
+ [Repo](https://github.com/langchain-ai/langchain/blob/master/cookbook/rewrite.ipynb) git
【问题的多样化】


# Transformation-抽象化
### Step Back问答回退策略 [3]
Step Back问答回退，首先提示LLM提出一个**关于高级概念或原则的通用后退问题**，并检索有关它们的相关事实，使用此基础来帮助回答用户问题。

### Step-back Prompting [1][2]
+ [论文](https://arxiv.org/pdf/2310.06117.pdf)使用退一步提示，**使用LLM生成"后退"(Step back prompting)问题**。
使用检索时，"后退"问题和原始问题都会被用来进行检索，然后这两个结果都会被用来作为语言模型回复的基础。
+ [Repo](https://github.com/langchain-ai/langchain/blob/master/cookbook/stepback-qa.ipynb) git
【问题的抽象化】

# Transformation-具体化
### HyDE混合策略[3]
LLM将**问题**转换为回答问题的**假设文档**。**使用嵌入的假设文档检索真实文档**，前提是doc-doc相似性搜索可以产生更多相关匹配。

+ HyDE
At a high level, HyDE is an embedding technique that takes queries, **generates a hypothetical answer**, and then embeds that generated document and uses that as the final example.

# 参考
1. [知识图谱用于细粒度大模型幻觉评估：兼论Langchain-RAG问答中的问题改写范式 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648406156&idx=1&sn=d91a4df105c4fc4c9523f7141bc1c24d)
    RAG:  rewrite , Step back, fusion 

2. [Query Transformations](https://blog.langchain.dev/query-transformations/)  

3. [一文详看Langchain框架中的RAG多阶段优化策略：从问题转换到查询路由再到生成优化](https://mp.weixin.qq.com/s/pK2BRLrWpEKKIPFhUtGvcg) ***   原理paper，代码示例
   Multi Query多查询策略， Decomposition问题，RAG-Fusion， Step Back， HyDE混合
   [rag-from-scratch Repo](https://github.com/langchain-ai/rag-from-scratch) git
   [RAG(检索增强） 从入门到精通 虚拟文档嵌入（Hyde)](https://www.bilibili.com/video/BV1Vx421U7a4/) V
   

1xx. [业界总结｜搜索中的Query理解](https://zhuanlan.zhihu.com/p/393914267) ***

1xx. [智能扩充机器人的“标准问”库之Query生成](https://zhuanlan.zhihu.com/p/149429784)

1xx. [前沿重器[38] | 微软新文query2doc：用大模型做query检索拓展](https://mp.weixin.qq.com/s?__biz=MzIzMzYwNzY2NQ==&mid=2247489295&idx=1&sn=fcb269e47dc27fcaf31201aa1c75dafb)
