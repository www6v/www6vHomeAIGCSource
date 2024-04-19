---
title:  (实战)多模态 RAG
date: 2023-03-14 13:55:59
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


# 多模态RAG-多向量检索器 [10][11]
### semi-structured (tables + text) RAG [20] 
 分析pdf中表格 

### multi-modal (text + tables + images) RAG  [13]
分析PDF中图片
+ **Option 1**  [基于CLIP] [23][30][32][33]
	* Use multimodal embeddings **(such as [CLIP](https://openai.com/research/clip))** to embed images and text
	* Retrieve both using similarity search
	* Pass **raw images and text chunks** to a multimodal LLM for answer synthesis 
   {选项1：对文本和表格生成summary，然后应用多模态embedding模型把文本/表格summary、原始图片转化成embedding存入多向量检索器。对话时，根据query召回原始文本/表格/图像。然后将其喂给多模态LLM生成应答结果。}[10]
  
+ **Option 2**   [21] 
	* Use a multimodal LLM (such as [GPT4-V](https://openai.com/research/gpt-4v-system-card), [LLaVA](https://llava.hliu.cc/), or [FUYU-8b](https://www.adept.ai/blog/fuyu-8b)) to produce **text summaries from images**
	* Embed and retrieve text 
	* Pass text chunks to an LLM for answer synthesis 
  【将图片转成摘要，和其他文本信息整合在文本粒度进行检索】[12]
   {选项2：首先应用多模态大模型（GPT4-V、LLaVA、FUYU-8b）生成图片summary。然后对文本/表格/图片summary进行向量化存入多向量检索器中。当生成应答的多模态大模型不具备时，可根据query召回原始文本/表格+图片summary。}[10]

+ Option 3 [24] [31][34]
	* Use a multimodal LLM (such as [GPT4-V](https://openai.com/research/gpt-4v-system-card), [LLaVA](https://llava.hliu.cc/), or [FUYU-8b](https://www.adept.ai/blog/fuyu-8b)) to produce text summaries from images
	* Embed and retrieve image summaries with a reference to the raw image 
	* Pass **raw images and text chunks** to a multimodal LLM for answer synthesis  
   【实际模型输入使用的是图片】
     【图片概要依然是用于检索（GPT-4V，LLaVA，FUYU-8b）】[12]
    {选项3：前置阶段同选项2相同。对话时，根据query召回原始文本/表格/图片。构造完整Prompt，访问多模态大模型生成应答结果。}[10]

###  private multi-modal (text + tables + images)  RAG [22]


### 组件
+ pdf解析
  unstructured
+ store
  MultiVectorRetriever - 元数据+数据

# 参考
### 实战
10. [检索增强生成（RAG）有什么好的优化方案？](https://www.zhihu.com/question/628651389/answer/3321989558) 

11. [Multi-Vector Retriever for RAG on tables, text, and images](https://blog.langchain.dev/semi-structured-multi-modal-rag/) *** 
    [基于多向量检索器的多模态RAG实现：用于表格、文本和图像](https://blog.csdn.net/lichunericli/article/details/135724777)
   
12. [langchain的multi model RAG-以多模态pdf文件为例子](https://zhuanlan.zhihu.com/p/665814914)

13. [Multi-modal RAG on slide decks](https://blog.langchain.dev/multi-modal-rag-template/)

1xx. [Using Multi-Modal LLMs](https://docs.google.com/presentation/d/19x0dvHGhbJOOUWqvPKrECPi1yI3makcoc-8tFLj9Sos/edit?ref=blog.langchain.dev&pli=1#slide=id.g2642e7050fc_0_370)  page21

### notebook
20. [Semi_Structured_RAG](https://github.com/langchain-ai/langchain/blob/master/cookbook/Semi_Structured_RAG.ipynb)  notebook
    [Advanced-RAG semi_structured_data](https://github.com/www6v/AIGC/blob/master/Advanced-RAG/01_semi_structured_data.ipynb)   notebook  {半结构化-解析pdf中的表格，  运行没问题，能问表格中的数据}
    
21. [Semi_structured_and_multi_modal_RAG](https://github.com/langchain-ai/langchain/blob/master/cookbook/Semi_structured_and_multi_modal_RAG.ipynb) notebook 

22. [Private Semi-structured and Multi-modal RAG w/ LLaMA2 and LLaVA](https://github.com/www6v/AIGC/blob/master/langchain-cookbook/Semi_structured_multi_modal_RAG_LLaMA2.ipynb)  notebook {多模态- 解析pdf中的图片  运行有问题} 
    [Private Semi-structured and Multi-modal RAG w/ LLaMA2 and LLaVA](https://github.com/langchain-ai/langchain/blob/master/cookbook/Semi_structured_multi_modal_RAG_LLaMA2.ipynb) notebook
    
23. [Chroma multi-modal RAG](https://github.com/langchain-ai/langchain/blob/master/cookbook/multi_modal_RAG_chroma.ipynb) notebook

24. [Multi-modal RAG](https://github.com/langchain-ai/langchain/blob/master/cookbook/Multi_modal_RAG.ipynb) notebook

### template    
30. [rag-multi-modal-local](https://github.com/langchain-ai/langchain/tree/master/templates/rag-multi-modal-local)  
    OpenCLIP(image embedding)  + bakllava(answer synthesis)
31. [rag-multi-modal-mv-local](https://github.com/langchain-ai/langchain/tree/master/templates/rag-multi-modal-mv-local)   
    bakllava(image summaries embedding) +  bakllava (answer synthesis)
32. [rag-chroma-multi-modal](https://github.com/langchain-ai/langchain/tree/master/templates/rag-chroma-multi-modal)  
    OpenCLIP(image embedding) + GPT-4V (answer synthesis)
33. [rag-gemini-multi-modal](https://github.com/langchain-ai/langchain/tree/master/templates/rag-gemini-multi-modal) 
    OpenCLIP(image embedding) + Gemini(answer synthesis)
34. [rag-chroma-multi-modal-multi-vector](https://github.com/langchain-ai/langchain/tree/master/templates/rag-chroma-multi-modal-multi-vector) 
    GPT-4V(image summaries embedding) + GPT-4V (answer synthesis)
    
### llamaindex
1xx. [朴素多模态RAG如何实现？兼看RAG上下文过滤方案FILCO及202402大模型早报 ](https://mp.weixin.qq.com/s/93CdvD8FLZjaA7E724bf7g)
1xx. [Advanced Multi-Modal Retrieval using GPT4V and Multi-Modal Index/Retriever](https://docs.llamaindex.ai/en/stable/examples/multi_modal/gpt4v_multi_modal_retrieval/)
1xx. [Multimodal RAG pipeline with LlamaIndex and Neo4j](https://www.llamaindex.ai/blog/multimodal-rag-pipeline-with-llamaindex-and-neo4j-a2c542eb0206)
1xx. [neo4j_llama_multimodal.ipynb](https://github.com/tomasonjo/blogs/blob/master/llm/neo4j_llama_multimodal.ipynb) git