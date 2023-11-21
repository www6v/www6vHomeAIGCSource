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

# RAG
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

# Langchain-Chatchat
+ 部署 
  - windows 10 [5] 
    部署本地， 没显存，卡
  - Linux [2]
    部署   32C125G ，没显存， 推理很慢 
  - Docker 

# 参考

1. [Langchain-Chatchat ](https://github.com/chatchat-space/Langchain-Chatchat) master
   Langchain 与 ChatGLM 等语言模型的本地知识库问答
   [Langchain-Chatchat](https://github.com/chatchat-space/Langchain-Chatchat/tree/v0.2.4)  v0.2.4 
   [langchain-ChatGLM](https://gitee.com/deepeye/langchain-ChatGLM)  gitee 
   
2. [Colab for Langchain-Chatchat](https://github.com/www6v/Langchain-Chatchat-Colab)   linux 可以部署  v0.2.6
3. [langChain-ChatGLM 尝试，踩坑记录](https://zhuanlan.zhihu.com/p/649055955)
4. [Langchain-Chatchat + 阿里通义千问Qwen 保姆级教程 | 次世代知识管理解决方案](https://zhuanlan.zhihu.com/p/651189680)    Langchain-Chatchat + 通义千问
5. [win10 安装 Langchain-Chatchat 避坑指南（2023年9月18日v0.2.4版本，包含全部下载内容！）](https://blog.csdn.net/weixin_43094965/article/details/133044128)  

3. langchain

   cookbook RAG