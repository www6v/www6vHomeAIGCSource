---
title:  (原理|实战)多模态 RAG
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

# 多模态RAG [3][5]


# 多模态RAG-多向量检索器 [10][11]
### semi-structured (tables + text) RAG [12] 
 分析pdf中表格 

### multi-modal (text + tables + images) RAG [13] 
分析PDF中图片
+ **Option 1** [代码] [基于CLIP]
	* Use multimodal embeddings **(such as [CLIP](https://openai.com/research/clip))** to embed images and text
	* Retrieve both using similarity search
	* Pass **raw images and text chunks** to a multimodal LLM for answer synthesis 
   {选项1：对文本和表格生成summary，然后应用多模态embedding模型把文本/表格summary、原始图片转化成embedding存入多向量检索器。对话时，根据query召回原始文本/表格/图像。然后将其喂给多模态LLM生成应答结果。}[10]
  
+ **Option 2** [代码] 
	* Use a multimodal LLM (such as [GPT4-V](https://openai.com/research/gpt-4v-system-card), [LLaVA](https://llava.hliu.cc/), or [FUYU-8b](https://www.adept.ai/blog/fuyu-8b)) to produce **text summaries from images**
	* Embed and retrieve text 
	* Pass text chunks to an LLM for answer synthesis 
  【将图片转成摘要，和其他文本信息整合在文本粒度进行检索】[15]
   {选项2：首先应用多模态大模型（GPT4-V、LLaVA、FUYU-8b）生成图片summary。然后对文本/表格/图片summary进行向量化存入多向量检索器中。当生成应答的多模态大模型不具备时，可根据query召回原始文本/表格+图片summary。}[10]

+ Option 3 
	* Use a multimodal LLM (such as [GPT4-V](https://openai.com/research/gpt-4v-system-card), [LLaVA](https://llava.hliu.cc/), or [FUYU-8b](https://www.adept.ai/blog/fuyu-8b)) to produce text summaries from images
	* Embed and retrieve image summaries with a reference to the raw image 
	* Pass **raw images and text chunks** to a multimodal LLM for answer synthesis  
   【实际模型输入使用的是图片】
     【图片概要依然是用于检索（GPT-4V，LLaVA，FUYU-8b）】[15]
    {选项3：前置阶段同选项2相同。对话时，根据query召回原始文本/表格/图片。构造完整Prompt，访问多模态大模型生成应答结果。}[10]

###  private multi-modal (text + tables + images)  RAG [14]


### 组件
+ pdf解析
  unstructured
+ store
  MultiVectorRetriever - 元数据+数据

# 参考
### 原理
3. [NLP（廿一）：从 RAG 到 Self-RAG —— LLM 的知识增强](https://zhuanlan.zhihu.com/p/661465330?utm_id=0) *** 

5. 《Retrieving Multimodal Information for Augmented Generation: A Survey》
   [万字综述：2023年多模态检索增强生成技术(mRAG)最新进展与趋势-图片、代码、图谱、视频、声音、文本](https://zhuanlan.zhihu.com/p/665078079) 
   [多模态RAG综述](https://zhuanlan.zhihu.com/p/678812531)



### 实战
10. [检索增强生成（RAG）有什么好的优化方案？](https://www.zhihu.com/question/628651389/answer/3321989558) 

11. [Multi-Vector Retriever for RAG on tables, text, and images](https://blog.langchain.dev/semi-structured-multi-modal-rag/) *** 
    [基于多向量检索器的多模态RAG实现：用于表格、文本和图像](https://blog.csdn.net/lichunericli/article/details/135724777)

12. [Semi_Structured_RAG](https://github.com/langchain-ai/langchain/blob/master/cookbook/Semi_Structured_RAG.ipynb)
    [Advanced-RAG semi_structured_data](https://github.com/www6v/AIGC/blob/master/Advanced-RAG/01_semi_structured_data.ipynb)   git  {半结构化-解析pdf中的表格，  运行没问题，能问表格中的数据}
    
13. [Semi_structured_and_multi_modal_RAG](https://github.com/langchain-ai/langchain/blob/master/cookbook/Semi_structured_and_multi_modal_RAG.ipynb) git 

14. [Private Semi-structured and Multi-modal RAG w/ LLaMA2 and LLaVA](https://github.com/www6v/AIGC/blob/master/langchain-cookbook/Semi_structured_multi_modal_RAG_LLaMA2.ipynb)  git {多模态- 解析pdf中的图片  运行有问题} 
    [Private Semi-structured and Multi-modal RAG w/ LLaMA2 and LLaVA](https://github.com/langchain-ai/langchain/blob/master/cookbook/Semi_structured_multi_modal_RAG_LLaMA2.ipynb)
    
15. [langchain的multi model RAG-以多模态pdf文件为例子](https://zhuanlan.zhihu.com/p/665814914)