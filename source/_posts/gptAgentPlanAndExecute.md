---
title:  (原理|实战)Plan-And-Execute Agent
date: 2023-03-02 09:31:47
tags:
  - Agent
categories: 
  - AIGC
  - Agent  
---

<p></p>
<!-- more -->

# Plan-and-execute [0]
+ 原理
  - Figure 2 - 基于prompt [1]

+ 代码
  - plan [2]
    + Planning Step
    + Re-Plan Step
  
+ 问题
  - 冗余的提示和重复的执行 -> ReWOO
  
# ReWOO [0] 
+ 原理
  - Abstract [10]
  增强语言模型（ALM）将大型语言模型（LLM）的推理能力与允许知识检索和执行操作的工具相结合。现有的ALM系统以交错的方式触发LLM的思考过程，同时从这些工具中获取观察结果。**具体而言，LLM推理过程中会调用外部工具，然后在获取工具响应后停止，基于之前的响应令牌来决定下一步的操作。这种范式虽然直观且易于实现，但常常由于冗余的提示和重复的执行而导致计算复杂度极高**。本研究首次解决了这些挑战，提出了一种模块化的范式ReWOO（无观察推理），**将推理过程与外部观察结果分离，从而显著减少了令牌的消耗**。
  - Figure 1 [10]
    Planner里有格式化的#E
  - Figure 2  [10]

+ 代码 [11]
  - Executor-tool_execution() -> 状态机

+ 问题
  - 是否可以并行？-> LLMCompiler
  
# LLMCompiler 
+ 原理
  - Abstract [20]
  LLM的多函数调用能力催生了基于LLM的软件开发，使其能够解决更复杂的问题。然而，当前的多函数调用方法通常需要**针对每个函数进行顺序推理和执行，这可能导致较高的延迟、成本以及不准确的行为**。为了解决这个问题，我们引入了LLMCompiler，它可以**并行执行函数，以高效地编排多函数调用**。LLMCompiler**借鉴了经典编译器的原理**，在LLM中使用**三个组件**来简化并行函数调用：（i）LLM规划器，制定执行策略和依赖关系；（ii）任务获取单元，分派和更新函数调用任务；（iii）执行器，以并行方式执行这些任务。通过LLMCompiler，用户可以指定工具以及可选的上下文示例，LLMCompiler会自动计算函数调用的优化编排。重要的是，LLMCompiler可以与LLaMA-2等开源模型以及OpenAI的GPT模型一起使用。
  - Figure 2  [20]

+ 代码 [21]
  + Planner
  + Task Fetching Unit 
  + Joiner
  
# 参考
### Plan-and-execute
0. [LangGraph：Plan-Execute Agents 实战](https://www.bilibili.com/video/BV1vJ4m1s7Zn/) V
[Plan-and-Execute Agents](https://blog.langchain.dev/planning-agents/) ***
1. [Plan-and-Solve Prompting: Improving Zero-Shot Chain-of-Thought
Reasoning by Large Language Models](https://arxiv.org/pdf/2305.04091.pdf)  Figure 2
2. [plan-and-execute](https://github.com/langchain-ai/langgraph/blob/main/examples/plan-and-execute/plan-and-execute.ipynb)    git


### ReWOO
10. [ReWOO: Decoupling Reasoning from Observations
for Efficient Augmented Language Models](https://arxiv.org/pdf/2305.18323.pdf)
11. [Reasoning without Observation](https://github.com/langchain-ai/langgraph/blob/main/examples/rewoo/rewoo.ipynb)
1xx.  [ReWOO: 高效增强语言模型中解偶观测和推理](https://zhuanlan.zhihu.com/p/671491031)

### LLMCompiler
20. [An LLM Compiler for Parallel Function Calling](https://arxiv.org/pdf/2312.04511v1.pdf)
21. [LLMCompiler](https://github.com/langchain-ai/langgraph/blob/main/examples/llm-compiler/LLMCompiler.ipynb)
