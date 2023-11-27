---
title:  GPT-RAG
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






# RAG架构
{% asset_img 'langchain+chatglm.jpg' %}

+ 架构
  - 离线 index
    LLamaIndex 构建和查询本地文档索引  
  - 在线 查询
  
+ 组件
  + 本地知识库
  + Embedding 模型
  + 向量数据库
  + Prompt Template

# RAG on Text data
### Langchain-Chatchat
+ 部署 
  - windows 10 [5] 
    部署本地， 没显存，卡
  - Linux [2]
    部署   32C125G ，没显存， 推理很慢 
  - Docker 


# RAG on Semi-structured data
### 分析PDF中图片 [6]
**Option 1** 
* Use multimodal embeddings **(such as [CLIP](https://openai.com/research/clip))** to embed images and text
* Retrieve both using similarity search
* Pass **raw images and text chunks** to a multimodal LLM for answer synthesis 

**Option 2** 
* Use a multimodal LLM (such as [GPT4-V](https://openai.com/research/gpt-4v-system-card), [LLaVA](https://llava.hliu.cc/), or [FUYU-8b](https://www.adept.ai/blog/fuyu-8b)) to produce **text summaries from images**
* Embed and retrieve text 
* Pass text chunks to an LLM for answer synthesis 

**Option 3** 
* Use a multimodal LLM (such as [GPT4-V](https://openai.com/research/gpt-4v-system-card), [LLaVA](https://llava.hliu.cc/), or [FUYU-8b](https://www.adept.ai/blog/fuyu-8b)) to produce text summaries from images
* Embed and retrieve image summaries with a reference to the raw image 
* Pass **raw images and text chunks** to a multimodal LLM for answer synthesis   

### 分析pdf中表格 [7]

### 组件
+ pdf解析
  unstructured
+ store
 MultiVector Retriever- 元数据+数据

# 向量数据库
+ 国产
  - Milvus
  - Tencent 
  - zilliz cloud

+ 国外
  - Pinecone
  - FAISS
    [ANN]
  

【向量的相对度算法
1. 欧式距离
2. 余弦
3. ANN】



#  Self-RAG




# 参考
### RAG on Text data
1. [Langchain-Chatchat ](https://github.com/chatchat-space/Langchain-Chatchat) master
   Langchain 与 ChatGLM 等语言模型的本地知识库问答
   [Langchain-Chatchat](https://github.com/chatchat-space/Langchain-Chatchat/tree/v0.2.4)  v0.2.4 
   [langchain-ChatGLM](https://gitee.com/deepeye/langchain-ChatGLM)  gitee 
   
2. [Colab for Langchain-Chatchat](https://github.com/www6v/Langchain-Chatchat-Colab)   linux 可以部署  v0.2.6
3. [langChain-ChatGLM 尝试，踩坑记录](https://zhuanlan.zhihu.com/p/649055955)
4. [Langchain-Chatchat + 阿里通义千问Qwen 保姆级教程 | 次世代知识管理解决方案](https://zhuanlan.zhihu.com/p/651189680)    Langchain-Chatchat + 通义千问
5. [win10 安装 Langchain-Chatchat 避坑指南（2023年9月18日v0.2.4版本，包含全部下载内容！）](https://blog.csdn.net/weixin_43094965/article/details/133044128)  

### RAG on Semi-structured data
6. [langchain-cookbook RAG](https://github.com/www6v/AIGC/blob/master/langchain-cookbook/Semi_structured_multi_modal_RAG_LLaMA2.ipynb)   解析pdf中的图片  运行有问题
7. [Advanced-RAG semi_structured_data](https://github.com/www6v/AIGC/blob/master/Advanced-RAG/01_semi_structured_data.ipynb)   解析pdf中的表格，  运行没问题，能问表格中的数据


### Self-RAG
8. [NLP（廿一）：从 RAG 到 Self-RAG —— LLM 的知识增强](https://zhuanlan.zhihu.com/p/661465330?utm_id=0) *** 
9. [original implementation of SELF-RAG](https://github.com/www6v/self-rag)