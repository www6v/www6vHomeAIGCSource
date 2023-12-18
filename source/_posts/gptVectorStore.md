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