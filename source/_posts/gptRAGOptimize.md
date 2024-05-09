---
title: RAG 优化
date: 2023-05-09 18:28:50
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

# 朴素RAG Embedding
### Embedding 召回方案及局限性[1]
+ 召回**精度低**
+ **粒度过粗**
+ 不支持条件查询/统计
+ 不能替代信息提取

###  解决方案 
+ 问题理解——准确识别**用户意图**(传统NLP)  [2]

+ 基于**关键词Embedding**的入库和搜索 [2]
  - **关键词提取**
    - 实现信息抽取（Information Extraction，IE）
      - 实体关系三元组抽取(RE, Relation Extraction )
      - 命名实体识别(NER, Name-Entity Recognition)
      - 事件抽取(EE, Event Extraction)
  - 基于 LLM 提取 [不推荐]
    - 结果不准确、开销也大
  - **传统 NLP 方法提取**[推荐]
    - 名词短语提取与整合
    - 依存分析
    - 成分句法分析
  - 总结
    从**完整语句的 Embedding**，切换为**关键词 Embedding**：
  - 优势
    - 相比传统 Embedding，大幅提升**召回精准度**。
    - 使用传统 NLP 在专项问题处理上，相比 LLM 提供更好的精度和性能。
 
+  知识库存储选型
   - Vector Store
     - 分片:  区分**层级结构**
   - Relational Database
   - Graph Database   
     - **图数据检索**

# 行业问答[3]
### 挑战
+ 版面复杂多样
+ 文本分块
  **存在知识点被分割、不完整的情况**。
+ 多因素影响内容召回效果
  -  例如：文档内容相似度高(专业文档细分领域、版本迭代等)；
  -  通用的**向量相似度算法**效果不好(问题与问题匹配 VS问题与答案匹配)；
  -  召回率受文档库增大而降低

### 优化
+ 向量化上的优化
  - 训练目标优化为提升**Query与段落的相关性**，使得**问题和相关段落的语义向量表示更接近**，训练模型有**sbert**，**cosent**等

+ 关键信息上的优化
  - 在文档内容的信息压缩上，进行文本**关键词和摘要的提取**
    - 从完整语句的Embedding，切换为**关键词Embedding**

# 参考
1. [RAG探索之路的血泪史及曙光](https://zhuanlan.zhihu.com/p/664921095)  腾讯
    Embedding, Retrieval
2. [LLM+Embedding构建问答系统的局限性及优化方案](https://zhuanlan.zhihu.com/p/641132245)
   基于关键词Embedding的入库和搜索的流程图,  结合传统nlp任务    
1xx. [基于大语言模型构建知识问答系统](https://zhuanlan.zhihu.com/p/627655485)

3. [再看业界大模型行业问答的困难及若干业界实践：兼看智能客服常用路线及多场景prompt ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404338&idx=1&sn=3c8f8c44ac7a1d925216b40833525b25)
   问题 优化

1xx. [大模型RAG问答研发真实图鉴：一周出Demo，半年用不好，缝补之路漫漫 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648407281&idx=2&sn=f39b46cad1787123b485d76dff33bc93)



1xx. [温故而知新:大模型RAG问答研发的7个失分点及MOE专家组合模型的若干浅析 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648407056&idx=1&sn=0a0ce93a9199a2eae36493a515e42181)
   《Seven Failure Points When Engineering a Retrieval Augmented Generation System》





1xx. [大模型行业落地实践的一些总结和观点：大模型行业问答落地中的现实挑战以及潜在的缓解策略](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403693&idx=1&sn=e47f34cd58f103d37998dbbfd01c41ee)
   《DataFunCon2023深圳站-20231125-刘焕勇-大模型行业问答的现实挑战及潜在的缓解策略》 pdf



### xxx
1xx. [再看RAG在真实金融文档问答场景的实践方案：SMP2023 金融大模型挑战赛的两种代表实现思路](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404651&idx=2&sn=335db95e104a5b09e33ac2245bae4fd2)
