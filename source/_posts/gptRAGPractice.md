---
title: (实战)RAG 
date: 2022-12-31 07:42:52
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

# 基于文本的RAG
### Langchain-Chatchat 架构
{% asset_img 'langchain+chatglm.jpg' %}

+ 组件
  + 本地知识库
  + Embedding 模型
  + 向量数据库
  + Prompt Template

### Langchain-Chatchat
+ 部署 
  - windows 10 [5] 
    部署本地， 没显存，卡
  - Linux [2]
    部署   32C125G ，没显存， 推理很慢 
  - Docker 


# Vector+KG RAG[15][16]

# Data processing[17]
长文本   变成   QA pair
+ 规则匹配
+ 利用LLM抽取
+ 人工处理

# 框架 [18]
1）**LangChain**： https://github.com/langchain-ai/langchain/
2）QAnything： https://github.com/netease-youdao/QAnything/tree/master
3）**LlamaIndex**： https://github.com/run-llama/llama_index/
4）**langchainchat**： https://github.com/chatchat-space/Langchain-Chatchat/releases/tag/v0.2.8
5) **FastGPT** ：https://github.com/labring/FastGPT
6）langchain4j ：https://github.com/langchain4j/langchain4j
7）**Unstructured** ：https://github.com/Unstructured-IO/unstructured
8）GPT-RAG ：https://github.com/Azure/GPT-RAG
9）Quivr ：https://github.com/StanGirard/quivr
10）**Dify** ：https://github.com/langgenius/dify
11）Verba ：https://github.com/weaviate/Verba
12）danswer：https://github.com/danswer-ai/danswer

# 参考
### 文本
1. [Langchain-Chatchat ](https://github.com/chatchat-space/Langchain-Chatchat) master
   Langchain 与 ChatGLM 等语言模型的本地知识库问答
   [Langchain-Chatchat](https://github.com/chatchat-space/Langchain-Chatchat/tree/v0.2.4)  v0.2.4 
   [langchain-ChatGLM](https://gitee.com/deepeye/langchain-ChatGLM)  gitee 
   
2. [Colab for Langchain-Chatchat](https://github.com/www6v/Langchain-Chatchat-Colab)   linux 可以部署  v0.2.6
3. [langChain-ChatGLM 尝试，踩坑记录](https://zhuanlan.zhihu.com/p/649055955)
4. [Langchain-Chatchat + 阿里通义千问Qwen 保姆级教程 | 次世代知识管理解决方案](https://zhuanlan.zhihu.com/p/651189680)    Langchain-Chatchat + 通义千问
5. [win10 安装 Langchain-Chatchat 避坑指南（2023年9月18日v0.2.4版本，包含全部下载内容！）](https://blog.csdn.net/weixin_43094965/article/details/133044128)  



### 知识图谱
15. [Enhanced QA Integrating Unstructured Knowledge Graph Using Neo4j and LangChain](https://neo4j.com/developer-blog/unstructured-knowledge-graph-neo4j-langchain/)  

16. [Using a Knowledge Graph to implement a DevOps RAG application](https://blog.langchain.dev/using-a-knowledge-graph-to-implement-a-devops-rag-application/)

### xxx
17. <<大模型结合 RAG 构建客服场景自动问答系统>>  NVIDIA大模型日系列活动  

18. [大模型RAG问答研发真实图鉴：一周出Demo，半年用不好，缝补之路漫漫 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648407281&idx=2&sn=f39b46cad1787123b485d76dff33bc93)

1xx. [LlamaHub](https://llamahub.ai/)   
      Mix and match our Data Loaders and Agent Tools to build custom RAG apps or use our LlamaPacks as a starting point for your retrieval use cases.

1xx. [再看业界大模型行业问答的困难及若干业界实践：兼看智能客服常用路线及多场景prompt ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404338&idx=1&sn=3c8f8c44ac7a1d925216b40833525b25)

1xx. [RAG探索之路的血泪史及曙光](https://zhuanlan.zhihu.com/p/664921095)  腾讯

1xx. [阿里面向企业数字化的文档智能技术与应用](https://mp.weixin.qq.com/s/d2Nns1qashMbcXPMG-4McQ)

1xx. [再看RAG在真实金融文档问答场景的实践方案：SMP2023 金融大模型挑战赛的两种代表实现思路](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404651&idx=2&sn=335db95e104a5b09e33ac2245bae4fd2)
