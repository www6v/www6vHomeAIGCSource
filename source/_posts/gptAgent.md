---
title: (原理)Agent 
date: 2022-11-02 10:55:27
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


# 架构图  
{% asset_img 'agent-overview.jpg' %}

### 组件  [1]
Agent = LLM + plan[规划能力] + memory[记忆能力] +Tools[工具使用能力] 

###  Planning [1]
+ Task Decomposition
  - CoT 
  - ToT

+ Self-Reflection
  + ReAct 
  + Reflexion 
  + Chain of Hindsight 

### Memory [1]
+ Types of Memory
  - **Sensory memory** as learning **embedding representations for raw inputs, including text, image or other modalities**;
  - **Short-term memory** as **in-context learning**. It is short and finite, as it is restricted by the finite context window length of Transformer.
  - **Long-term memory** as the external **vector store** that the agent can attend to at query time, accessible via fast retrieval.

### Tool Use [1]
+ 让 agent 选择合适的工具 [2]
   - 可以 retrieve 相关示例来做 **few-shot prompt**。
   - 也可以进一步 **fine tune 特定模型**，例如之前的 Toolformer。

+ Research
  + **TALM** (Tool Augmented Language Models; Parisi et al. 2022) [1]
  + **Toolformer** (Schick et al. 2023)   [1]
  + **Gorilla** [2]

+ Production  [1]
  - ChatGPT **Plugins** 
  - OpenAI API **function calling**






# 参考
### Overview
1. [LLM Powered Autonomous Agents ](https://lilianweng.github.io/posts/2023-06-23-agent/) paper 

1xx. [《综述：全新大语言模型驱动的Agent》](https://zhuanlan.zhihu.com/p/656676717)  ***

1xx. [LLM-based Agents survey 基于大语言模型多智能代理简单综述及展望](https://zhuanlan.zhihu.com/p/648376562) ***

### xxx
2. [LLM 全栈开发指南补遗](https://zhuanlan.zhihu.com/p/633033220)  Agents  ***
   [Harrison Chase: Agents](https://fullstackdeeplearning.com/llm-bootcamp/spring-2023/chase-agents/)  ***

1xx. [智能体AI Agent的极速入门：从ReAct、AutoGPT到AutoGen、QwenAgent、XAgent、MetaGPT](https://blog.csdn.net/v_JULY_v/article/details/135868163?spm=1001.2014.3001.5502)   
1xx. [LLM Agent 现状和一些思考 （202401）](https://zhuanlan.zhihu.com/p/679032270)
   agent的三种视角

1xx. [AutoGPT与LLM Agent解析](https://zhuanlan.zhihu.com/p/622947810) *** 

### xxx
[吴恩达红杉美国 AI 峰会谈 Agent Workflow 以及 4 种主流设计模式，相比 LLM 更强调迭代与对话 ](https://mp.weixin.qq.com/s/4ky_OSLrHh2MxdT3AjqW1Q)
[深度｜盘点 3 种 OpenAI 等硅谷 AI 大厂在研 Agent 类型](https://mp.weixin.qq.com/s/DyXv9nxFQJYUrAFr22BCCA)
[Agent落地范式本质上是工程及产品设计上的花活：兼看文档图表理解的几个关键问题](https://mp.weixin.qq.com/s/8k2Qo5vIJ2Gvm9QLFtZA4Q)