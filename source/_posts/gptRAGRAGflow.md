---
title: RAG RAGflow
date: 2023-06-19 10:25:33
tags:
  - RAG
categories: 
  - AIGC
  - RAG  
---

<p></p>
<!-- more -->


# RAGflow[1,2][ELmo]
RAGFlow 是一个端到端的 RAG 引擎，它解决数据的问题，因为如果不对用户数据加以区分和清晰，识别其中的语义，就容易导致 Garbage In Garbage Out。RAGFlow 包含了如下的完整 RAG 流程，确保数据从 Garbage In Garbage Out 变为 Quality In Quality Out。

RAGFlow 的最大特色，就是多样化的文档智能处理，因此它没有采用现成的 RAG 中间件，而是完全重新研发了一套智能文档理解系统，并以此为依托构建 RAG 任务编排体系。

这个系统的特点包含：
1. 它是一套基于 AI 模型的**智能文档处理系统**；
2. 它是一套包含**各种不同模板**的智能文档处理系统；
3. 智能文档处理的**可视化和可解释性**；
4. RAGFlow 是一个完整的 RAG 系统，而目前开源的 RAG，大都忽视了 RAG 本身的最大优势之一：可以让 LLM 以可控的方式回答问题，或者换种说法：有理有据、消除幻觉。

# 参考
### RAGFlow
1. [RAGFlow：采用OCR和深度文档理解结合的新一代 RAG 引擎](https://www.bilibili.com/video/BV12T42117VT/) V
2. [检索增强生成引擎 RAGFlow 正式开源！](https://www.infoq.cn/article/hjJM3kV620iDoYYOBtPs)
1xx. [7.8K Star RAG 引擎：基于深度文档理解，最大程度降低幻觉、无限上下文快速完成 “大海捞针” 测试！](https://mp.weixin.qq.com/s/8qms4nxVsX43WSWolXgx7w)

1xx.  [RAGFlow Demo](http://demo.ragflow.io/)
    [ragflow Repo](https://github.com/infiniflow/ragflow) git