---
title: Prompt Engineering
date: 2022-11-10 15:48:39
tags:
  - Prompt
categories: 
  - AIGC
  - prompt  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# Basic Prompting [2]
### Zero-Shot Prompting [3]
### Few-Shot Prompting [3]

# CoT [2]
### Chain-of-Thought Prompting(CoT) [3]
+ Few-shot CoT
+ Zero-shot COT  
  **"Let's think step by step"**

### Self-Consistency(CoT-SC) [3]
The idea is to sample multiple, diverse reasoning paths through few-shot CoT, and use the generations to **select** the most consistent answer.  
### Tree of Thoughts (ToT)

### CoT vs. CoT-SC vs. ToT  [3]
{% asset_img 'TOT.jpg' %}

### Tips and Extensions   [2]
Self-Ask 

# Automatic Prompt Design [2]
+ Automatic Chain-of-Thought (Auto-CoT) [3]

# CoT[4]
+ CoT(Chain of Thought)
  - CoT-SC(Self Consistency)
  
+ ToT(Tree of Thoughts)
  分为了Thought Decomposition，Thought Generator，State Evaluator，Search algorithms

+ GoT(Graph of Thoughts)

+ AoT(Algorithm of Thoughts)

# Six strategies for getting better results[1]
### Write clear instructions
   清晰的指令
### Provide reference text

### Split complex tasks into simpler subtasks
    复杂任务简单化
### Give the model time to "think"
   给模型时间去思考
### Use external tools
   使用外部工具
### Test changes systematically

# 参考
1. [Prompt engineering](https://platform.openai.com/docs/guides/prompt-engineering)  openai
2. [Prompt Engineering ](https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/) paper
3. [Prompt Engineering Guide](https://www.promptingguide.ai/techniques) guide
   [Prompt-Engineering-Guide ](https://github.com/www6v/Prompt-Engineering-Guide) *** git
4. [2023年能够解决复杂问题的思维链技术：Cot，ToT，GoT，AoT](https://zhuanlan.zhihu.com/p/654034193)
100. [The Prompt Landscape](https://blog.langchain.dev/the-prompt-landscape/)  langchain
101. [CometLLM - suite of LLMOps tools - track and visualize LLM prompts and chains](https://colab.research.google.com/github/comet-ml/comet-llm/blob/main/examples/CometLLM_Prompts.ipynb)
102. [大模型 PUA 指南：来自 Google Meta Microsoft 等大厂](https://zhuanlan.zhihu.com/p/671915693) 

### 案例
200. [运维大模型探索之 Text2PromQL 问答机器人 ](https://mp.weixin.qq.com/s/nXoZJ4xfgihA2mnBQ8EdIQ)     架构图， 最后两个重点总结   未