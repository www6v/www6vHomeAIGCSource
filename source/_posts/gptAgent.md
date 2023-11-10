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


# Agent

### 概念 [1][2]
  Agent = LLM + plan[规划能力] + memory[记忆能力] +Tools[工具使用能力]

### 类型  [3]
+ ReACT 范式
  把**融合了Reasoning和Acting**的一种范式，推理过程是浅显易懂，仅仅**包含thought-action-observation步骤**，很容易判断推理的过程的正确性，使用ReAct做决策甚至超过了强化学习.
  - chain-of-thought推理-问题
   事实幻想（fact hallucination）和错误传递（error propagation）
+ Self-ask
+ Plan-and-execute agents
  本质上是先计划再执行，即先把用户的问题分解成一个个的子任务，然后再执行各个子任务，最后合并输出得到结果 
  
### 分类 [1][2][3]
+ Action agents
    Function Call， ReACT
+ Simulation agents 
    生成式智能体， CAMEL
+ Automomous Agent
    **AutoGPT**， BabyAGI
+ 跨模态Agents
  HuggingGPT
  
# 参考
1. 公开课
2. 公开课
3. [2023年新生代大模型Agents技术,ReAct,Self-Ask,Plan-and-execute,以及AutoGPT, HuggingGPT等应用](https://zhuanlan.zhihu.com/p/642357544) *** 未

100. [AutoGPT与LLM Agent解析](https://zhuanlan.zhihu.com/p/622947810) *** 未
101. [AutoGPT](https://github.com/Significant-Gravitas/AutoGPT) git

