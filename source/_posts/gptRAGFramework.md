---
title: RAG Framework
date: 2023-05-09 16:34:11
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


[1]: https://github.com/infiniflow/ragflow/tree/main
[2]: https://github.com/netease-youdao/QAnything/tree/master
[3]: https://github.com/chatchat-space/Langchain-Chatchat/releases/tag/v0.2.8
[4]: https://github.com/labring/FastGPT
[5]: https://github.com/langchain-ai/langchain/
[6]: https://github.com/run-llama/llama_index/
[7]: https://github.com/langchain4j/langchain4j
[8]: https://github.com/Azure/GPT-RAG
[9]: https://github.com/Unstructured-IO/unstructured
[10]: https://github.com/StanGirard/quivr
[11]: https://github.com/langgenius/dify
[12]: https://github.com/weaviate/Verba
[13]: https://github.com/danswer-ai/danswer

# 框架 [0]
+ [**ragflow**][1] 
+ [**QAnything**][2] 
+ [**langchainchat**][3]
+ [**FastGPT**][4]  
+ [**LangChain**][5] 
+ [**LlamaIndex**][6]


+ [langchain4j][7] 
+ [GPT-RAG][8] 
+ [**Unstructured**][9]
+ [Quivr][10] 
+ [**Dify**][11] 
+ [Verba][12] 
+ [danswer][13]

# RAGflow[1,2][ELmo]
RAGFlow 是一个端到端的 RAG 引擎，它解决数据的问题，因为如果不对用户数据加以区分和清晰，识别其中的语义，就容易导致 Garbage In Garbage Out。RAGFlow 包含了如下的完整 RAG 流程，确保数据从 Garbage In Garbage Out 变为 Quality In Quality Out。

RAGFlow 的最大特色，就是多样化的文档智能处理，因此它没有采用现成的 RAG 中间件，而是完全重新研发了一套智能文档理解系统，并以此为依托构建 RAG 任务编排体系。

这个系统的特点包含：
1. 它是一套基于 AI 模型的**智能文档处理系统**；
2. 它是一套包含**各种不同模板**的智能文档处理系统；
3. 智能文档处理的**可视化和可解释性**；
4. RAGFlow 是一个完整的 RAG 系统，而目前开源的 RAG，大都忽视了 RAG 本身的最大优势之一：可以让 LLM 以可控的方式回答问题，或者换种说法：有理有据、消除幻觉。

# QAnything 
### Bcembedding模型 [3,4]
### Rerank [3,4]

# 参考
0. [大模型RAG问答研发真实图鉴：一周出Demo，半年用不好，缝补之路漫漫 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648407281&idx=2&sn=f39b46cad1787123b485d76dff33bc93)

1. [RAGFlow：采用OCR和深度文档理解结合的新一代 RAG 引擎](https://www.bilibili.com/video/BV12T42117VT/) V
2. [检索增强生成引擎 RAGFlow 正式开源！](https://www.infoq.cn/article/hjJM3kV620iDoYYOBtPs)

3. [有道QAnything背后的故事：关于RAG的一点经验分享](https://www.bilibili.com/video/BV1HF4m1w7rY/) V
4. [有道QAnything背后的故事---关于RAG的一点经验分享](https://mp.weixin.qq.com/s/FUex1Q984-IhQ-FoLZTf5Q)
   
   [公众号有其他文章]


1xx. [LlamaHub](https://llamahub.ai/)   
      Mix and match our Data Loaders and Agent Tools to build custom RAG apps or use our LlamaPacks as a starting point for your retrieval use cases.
      
