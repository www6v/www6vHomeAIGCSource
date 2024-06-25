---
title: Agentic RAG
date: 2023-06-25 10:39:17
tags:
  - RAG
categories: 
  - AIGC
  - RAG  
---

<p></p>
<!-- more -->

# Agentic RAG [1]
Agentic RAG 和简单 RAG 的最大区别在于 **Agentic RAG 引入了 Agent 的动态编排机制，因此可以根据用户提问的不同意图，引入反馈和查询改写机制，并进行“多跳”式的知识推理，从而实现对复杂提问的回答**。

+ Self-RAG 是相对初级的 Agentic RAG，RAGFlow 中也已提供了相关实现。实践证明，Self-RAG 对于较复杂的多跳问答和多步推理可以明显提升性能。

+ Adaptive RAG
  - 开放域问答
  - 多跳问答
  - 自适应检索


# 参考
1. [Agentic RAG 与图任务编排](https://mp.weixin.qq.com/s/A8kfbH70sdU5Gd20K9Y0Lw) 
   Self-RAG     Adaptive RAG
   
1xx. [LlamaIndex团队技术报告：“RAG的尽头是Agent”](https://mp.weixin.qq.com/s/wuyMN7CLAT9HGYlmjLWUtA)

### 实战
1xx. [Building Agentic RAG with LlamaIndex - DeepLearning.AI](https://www.deeplearning.ai/short-courses/building-agentic-rag-with-llamaindex/)
    [Building Agentic RAG with LlamaIndex-Repo](https://github.com/www6v/deeplearningAI/tree/master/Building%20Agentic%20RAG%20with%20Llamaindex) git
    [Building a Custom Agent - LlamaIndex](https://docs.llamaindex.ai/en/stable/examples/agent/custom_agent/)
    [Llama Hub](https://llamahub.ai/?tab=agent)
    
   
    