---
title: (原理)Agent 多模态
date: 2023-02-21 10:10:51
tags:
  - AIGC
categories: 
  - AIGC
  - Agent  
---

<p></p>
<!-- more -->



## 目录
<!-- toc -->



# 论文
+ 论文地址
 [《Large Multimodal Agents: A Survey》](https://arxiv.org/abs/2402.15116) 

+ 开源地址
 [Repo](https://github.com/jun0wanan/awesome-large-multimodal-agents) git

# Survey
### 类型 I：无长期记忆的闭源 LLMs 作为规划器。

[**Visual ChatGPT**](https://arxiv.org/pdf/2303.04671.pdf)  ***

[**MM-REACT**](https://arxiv.org/pdf/2303.11381.pdf)  ***

[**ViperGPT**](https://arxiv.org/pdf/2303.08128.pdf) 

[**HuggingGPT**](https://arxiv.org/pdf/2303.17580.pdf)  ***

[**Chameleon**](https://arxiv.org/pdf/2304.09842.pdf) ***

[**LLaVA-Interactive**](https://arxiv.org/pdf/2311.00571.pdf) ***

[**SeeAct**](https://arxiv.org/pdf/2401.01614) 

[**GPT-Driver**](https://arxiv.org/pdf/2310.01415.pdf) 

[**Mobile-Agent**](https://arxiv.org/pdf/2401.16158.pdf) 

### 类型 II：无长期记忆的微调 LLMs 作为规划器。

[**LLaVA-Plus**](https://arxiv.org/pdf/2306.08640.pdf) 

[**GPT4Tools**](https://arxiv.org/pdf/2305.18752.pdf) 

### 类型 IV：具有本地长期记忆的规划器。

[**JARV IS-1**](https://arxiv.org/pdf/2311.05997.pdf) 

[**AppAgent**](https://arxiv.org/pdf/2312.13771.pdf) 

[**DLAH**](https://arxiv.org/pdf/2307.07162.pdf) 

# 多模态 Agent[1]

+ 核心组件
  - **感知**组件关注处理多模态信息
  - **规划器**负责推理和制定计划
  - **行动**组件执行计划
  - **记忆**组件则涉及长期和短期记忆

+ 四种类型
    - 无长期记忆的闭源 LLMs 作为规划器
    - 无长期记忆的微调 LLMs 作为规划器
    - 具有间接长期记忆的规划器 
    - 具有本地长期记忆的规划器

+ 多智能体协作
  - 讨论了 LMAs 如何通过协作框架共同实现共同目标。

# 多模态 Agent[10]
### 范式 
{% asset_img  'tasks.JPG' %}

+ MM-ReAct 
+ HuggingGPT[21, 22] 
+ Chameleon

+ Visual ChatGPT [20]

### works
{% asset_img  'works.jpg' %}


# 参考
### 综述
1. [2024年大型多模态智能体(Large Multimodal Agents)综述：组件, 分类，协作，评估，应用，展望](https://mp.weixin.qq.com/s?__biz=Mzg5NTc2OTcyOQ==&mid=2247488499&idx=1&sn=ac8c5092ddc8fd724965d12aff3f9392) ***


1xx. [个人LLM智体的综述](https://zhuanlan.zhihu.com/p/678238642)  
1xx. [智体AI在多模态交互领域的综述（上）](https://zhuanlan.zhihu.com/p/678203245)
1xx. [智体AI在多模态交互领域的综述（下）](https://zhuanlan.zhihu.com/p/678222381)


### xxx
10. [多模态 Agents：用大模型语言模型串联多模态专家](https://www.bilibili.com/video/BV1mM411X7Zn/) V

### 多模态Agent
1xx. {% post_link 'gptMultimodal' %} self
1xx. {% post_link 'gptMultimodalSurvey' %} self

### xxx
20. 《Visual ChatGPT: Talking, Drawing and Editing with Visual Foundation Models》
[Visual ChatGPT](https://github.com/chenfei-wu/TaskMatrix) git


21.  [LLMs的自动化工具系统（HuggingGPT、AutoGPT、WebGPT、WebCPM）](https://nakaizura.blog.csdn.net/article/details/130856470)  

22. [HuggingGPT](https://github.com/microsoft/JARVIS) git
    [hugginggpt in langchain](https://github.com/langchain-ai/langchain/blob/master/cookbook/hugginggpt.ipynb) git
    [langchain-huggingGPT](https://github.com/camille-vanhoffelen/langchain-huggingGPT) git
    
1xx. [Visual Programming——实现通用人工智能的另一种方式 ](https://mp.weixin.qq.com/s/VXe6CHI_29Rw8xaOjfbqOQ) 2022  best paper