---
title: Agent 多模态
date: 2023-02-21 10:10:51
tags:
  - AIGC
categories: 
  - AIGC
  - Agent  
---

<p></p>
<!-- more -->

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
+ HuggingGPT, Chameleon

+ Visual ChatGPT

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


### App Agent 
1xx. [AppAgent源码分析&思考](https://zhuanlan.zhihu.com/p/677071947)
https://github.com/mnotgod96/AppAgent
https://icoz69.github.io/

1xx. [【LLM-agent】MOBILE-AGENT: 具有视觉感知能力的自治多模移动设备agent](https://zhuanlan.zhihu.com/p/681424409)
   https://github.com/X-PLUG/MobileAgent



