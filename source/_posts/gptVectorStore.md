---
title:   向量数据库
date: 2022-11-27 18:19:59
tags:
  - 向量数据库
categories: 
  - AIGC
  - 向量数据库  
---

<p></p>
<!-- more -->



## 目录
<!-- toc -->

# Embedding 
+ example [5]
  - **降维**:   t-SNE  
  - K-Means 聚类
  - 文本搜索  相似度搜索

+ Embedding 价值 [6]
  - **降维**
    将这些高维数据映射到一个低维空间，大大减少了模型的复杂度。
  - 捕捉语义信息 
    Embedding不仅仅是降维，更重要的是，它能够捕捉到数据的语义信息。
  - 泛化能力
    由于Embedding能够捕捉到数据的一些内在规律，因此对于这些未见过的数据，Embedding仍然能够给出合理的表示

+ 应用 [6]
  - 语义表示和语义相似度
  - 词语关系和类比推理
  - 上下文理解
  - 文本分类和情感分析
  - 机器翻译和生成模型

+ 天梯榜
  [mteb/leaderboard](https://huggingface.co/spaces/mteb/leaderboard)
  
# 向量数据库
+ 国产
  - Milvus
  - Tencent 
  - zilliz cloud

+ 国外
  - Pinecone
  - FAISS
    [ANN]
  - Chroma
  - Weaviate
  
# 向量的相对度算法[3]
+ Cosine Similarity * 
余弦
+ Dot Product *
+ Squared Euclidean (L2-Squared) *
欧式距离
+ Manhattan (L1 Norm or Taxicab Distance) *
+ Hamming *
+ ANN



### 比较[4]

| Similarity Metric      | Vector properties considered |
| ---------------------- | ---------------------------- |
| Euclidean distance     | Magnitudes and direction     |
| Cosine similarity      | Only direction               |
| Dot product similarity | Magnitudes and direction     |



# 参考

1. [云原生向量数据库Milvus扫盲，看完这篇就够了](https://zhuanlan.zhihu.com/p/476025527)

2. [云原生向量数据库Milvus（二）-数据与索引的处理流程、索引类型及Schema](https://zhuanlan.zhihu.com/p/477231485)

3. [Distance Metrics in Vector Search](https://weaviate.io/blog/distance-metrics-in-vector-search?ref=blog.langchain.dev)

4. [Vector Similarity Explained](https://www.pinecone.io/learn/vector-similarity/)

5. [embedding](https://github.com/www6v/openai-quickstart/blob/main/openai_api/embedding.ipynb) git

6. 《AI 大模型应用开发实战营》 03-大模型开发基础：Embedding  

100. [微信向量检索分析一体化数仓探索：OLAP For Embedding](https://cloud.tencent.com/developer/article/2352088) *** 未