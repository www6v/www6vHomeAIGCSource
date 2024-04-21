---
title: Query Transformation
date: 2023-04-20 22:51:05
tags:
  - RAG
categories: 
  - AIGC
  - RAG
---

<p></p>
<!-- more -->

# query rewrite [1][2]
[论文](https://arxiv.org/pdf/2305.14283.pdf)**使用LLM重写用户查询**，而不是直接使用原始用户查询进行检索。
因为对于LLM 而言，**原始查询不可能总是最佳检索结果**，可以让LLM重写查询。

[Repo](https://github.com/langchain-ai/langchain/blob/master/cookbook/rewrite.ipynb) git
【问题的多样化】

# Step-back Prompting [1][2]
[论文](https://arxiv.org/pdf/2310.06117.pdf)使用退一步提示，使用LLM生成**"后退"(Step back prompting)问题**。
使用检索时，"后退"问题和原始问题都会被用来进行检索，然后这两个结果都会被用来作为语言模型回复的基础。

[Repo](https://github.com/langchain-ai/langchain/blob/master/cookbook/stepback-qa.ipynb) git

【问题的抽象化】

# HyDE

# 参考

1. [知识图谱用于细粒度大模型幻觉评估：兼论Langchain-RAG问答中的问题改写范式 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648406156&idx=1&sn=d91a4df105c4fc4c9523f7141bc1c24d)
  RAG:  rewrite , Step back prompting, fusion 

2. [Query Transformations](https://blog.langchain.dev/query-transformations/)  

1xx. [业界总结｜搜索中的Query理解](https://zhuanlan.zhihu.com/p/393914267) ***

1xx. [智能扩充机器人的“标准问”库之Query生成](https://zhuanlan.zhihu.com/p/149429784)