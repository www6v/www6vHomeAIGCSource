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
  
# AutoGPT[3]

AutoGPT 的核心逻辑是一个 Prompt Loop，步骤如下

1. AutoGPT 会基于一定策略自动组装 Command Prompt，这些首次会包含用户输入的 Name, Role和Goals 
2. Command Prompt 的目标不是为了拿到最终结果，而是通过 GPT Chat API(Thinking 的过程)返回下一步的 Command (包含name和arguments, 如`browser_website(url = "www.baidu.com")` )
3. 这些 Command 都是可扩展的，每一种命令代表一种外部能力(比如爬虫、Google搜索，也包括GPT的能力)，通过这些 Command 调用返回的 Result 又会成为到 Command Prompt 的组成元素，
4. 回到第 1 步往复循环，直到拿到最终结果结果（状态为“compelete”）

[本质上是prompt enginering]

# 参考

1. 公开课
2. 公开课
3. [2023年新生代大模型Agents技术,ReAct,Self-Ask,Plan-and-execute,以及AutoGPT, HuggingGPT等应用](https://zhuanlan.zhihu.com/p/642357544) *** 论文

100. [AutoGPT与LLM Agent解析](https://zhuanlan.zhihu.com/p/622947810) *** 未
101. [AutoGPT](https://github.com/Significant-Gravitas/AutoGPT) git

