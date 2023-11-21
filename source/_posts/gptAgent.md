---
title: GPT-Agent
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


# 架构图 [8] [1][2]
{% asset_img 'agent-overview.jpg' %}

Agent = LLM + plan[规划能力] + memory[记忆能力] +Tools[工具使用能力]

###  Planning
+ Task Decomposition
  - CoT 
  - ToT

+ Self-Reflection
  + ReAct 
  + Reflexion 
  + Chain of Hindsight 

### Memory
+ Types of Memory
  - **Sensory memory** as learning **embedding representations for raw inputs, including text, image or other modalities**;
  - **Short-term memory** as **in-context learning**. It is short and finite, as it is restricted by the finite context window length of Transformer.
  - **Long-term memory** as the external **vector store** that the agent can attend to at query time, accessible via fast retrieval.

### Tool Use


# 类型  [3]
+ ReACT 范式
  把**融合了Reasoning和Acting**的一种范式，推理过程是浅显易懂，仅仅**包含thought-action-observation步骤**，很容易判断推理的过程的正确性，使用ReAct做决策甚至超过了强化学习.
  - chain-of-thought推理-问题
   事实幻想（fact hallucination）和错误传递（error propagation）
+ Self-ask
+ Plan-and-execute agents
  本质上是先计划再执行，即先把用户的问题分解成一个个的子任务，然后再执行各个子任务，最后合并输出得到结果 
  
# 分类 [1][2][3]
+ Action agents
    
    - Function Call，
    
    - ReACT
    
      Thought: xxx
      Action: xxx
      Observation: xxx
    
+ Simulation agents 
    生成式智能体， CAMEL，  Generative Agents
    
+ Automomous Agent
    **AutoGPT**， BabyAGI
    
+ 跨模态Agents
  HuggingGPT


# Langchain Agent
+ Conversational
+ OpenAI assistants
+ OpenAI functions
+ OpenAI Multi Functions Agent
+ OpenAI tools
   OpenAI parallel function calling (a.k.a. tool calling)
+ ReAct
  ZeroShotReactAgent
+ Self-ask with search
+ Structured tool chat


# Example

### HuggingGPT 

### BabyAGI

### AutoGPT[3][6]

AutoGPT 的核心逻辑是一个 Prompt Loop，步骤如下

1. AutoGPT 会基于一定策略自动组装 Command Prompt，这些首次会包含用户输入的 Name, Role和Goals 
2. Command Prompt 的目标不是为了拿到最终结果，而是通过 GPT Chat API(Thinking 的过程)返回下一步的 Command (包含name和arguments, 如`browser_website(url = "www.baidu.com")` )
3. 这些 Command 都是可扩展的，每一种命令代表一种外部能力(比如爬虫、Google搜索，也包括GPT的能力)，通过这些 Command 调用返回的 Result 又会成为到 Command Prompt 的组成元素，
4. 回到第 1 步往复循环，直到拿到最终结果结果（状态为“compelete”）

[本质上是prompt enginering]


# 问题和局限性 [4]
+ 记忆召回问题
  只是做简单的 embedding 相似性召回，很容易发现召回的结果不是很好
  
+ 错误累积问题

+ 探索效率问题
  中途引入人工的判断干预和反馈输入

+ 任务终止与结果验证
  模型 agent 的工作如何终止也是一个挑战
  

### Assistant API功能介绍 [7]
从功能实现层面来说，Assistant API是截至目前最完整、性能最强大的AI应用开发API，具体功能如下：
- 首先，Assistant API前所未有的能够**调用OpenAI各模型的各项能力**，包括可以调用Chat系列模型（即GPT系列模型）完成文本对话、调用DALL·E 3进行绘图、调用GPT-4-vision进行图像识别、以及调用Text-to-Speech模型进行语音转文字等，并且支持在一轮对话中调用不同模型；
- 其次，Assistant API还**内置了代码解释器功能（Code interpreter）和海量文本信息提取功能（Knowledge retrieval）**同时也一如既往支持借助**Function calling**进行模型功能层面拓展，此外，非常重要的是，Assistant API还支持在一轮对话中调用多个工具；
- 其三，此外对于开发者非常友好的一点是，Assistant API最小运行单元为持久化的线程对象（persistent Threads），因此在实际运行Assistant API时，不仅能可以精确控制每一步的执行过程，同时persistent Threads也会保留每轮对话的核心信息，并且当超出模型接收信息最大上下文限制时能够自动删除早期信息，从而实现对模型短期记忆的合理管理；
- 其四，Assistant API还能够直**接连接OpenAI在线文档库**，即如果用户将外部文档保存在OpenAI云空间内，则可以在调用Assistant API时实时访问文档库中的任意文件，甚至可以在不同线程中调用不同的文档。而在借助Assistant API的Knowledge retrieval功能，则可以让大模型实时获取这些文件信息，并且合理管理短期记忆；


# 参考

1. 公开课
2. 公开课
3. [2023年新生代大模型Agents技术,ReAct,Self-Ask,Plan-and-execute,以及AutoGPT, HuggingGPT等应用](https://zhuanlan.zhihu.com/p/642357544) ***  论文+代码
4. [AutoGPT与LLM Agent解析](https://zhuanlan.zhihu.com/p/622947810) *** 
5. [AutoGPT](https://github.com/Significant-Gravitas/AutoGPT) git
6. [带界面的 AutoGPT 产品](https://link.zhihu.com/?target=https%3A//godmode.space/)
7. [Assistant API详解与Agent开发实战-九天Hector](https://github.com/www6v/AIGC/tree/master/%E4%B9%9D%E5%A4%A9Hector/Assistant%20API%E8%AF%A6%E8%A7%A3%E4%B8%8EAgent%E5%BC%80%E5%8F%91%E5%AE%9E%E6%88%98-%E4%B9%9D%E5%A4%A9Hector)
8. [LLM Powered Autonomous Agents ](https://lilianweng.github.io/posts/2023-06-23-agent/) paper 

