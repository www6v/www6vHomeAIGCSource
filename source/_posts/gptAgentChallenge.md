---
title: (原理)Agent Challenge
date: 2023-05-13 07:17:37
tags:
  - Agent
categories: 
  - AIGC
  - Agent  
---

<p></p>
<!-- more -->





# 问题和局限性 [4]
+ 记忆召回问题
  只是做简单的 embedding 相似性召回，很容易发现召回的结果不是很好
  
+ 错误累积问题

+ 探索效率问题
  中途引入人工的判断干预和反馈输入

+ 任务终止与结果验证
  模型 agent 的工作如何终止也是一个挑战



# 挑战 [8]
### 如何让 agent 选择合适的工具
+ Toolformer - fine tune
+ Gorilla - retrieval，fine tune

### 不必要的工具使用
“Human Input”也写成一种工具，让模型来主动发起对人类的提问
[Human as a tool](https://python.langchain.com/docs/integrations/tools/human_tools)

### Agent 返回的格式不稳定
这里常见的做法是让 LLM **按照 json 这类常见的 schema 来返回**，一般稳定性会高一些（相比“Action:”这种）。
此外自动修复重试也很实用，可以利用 LangChain 里的 **output parsers** 来帮助完成。

### 记住之前的操作，避免重复
AutoGPT - retrieval 结合近期操作记录

### 处理超长的 observation
需要用一些工具从中**提取有用信息**，或者**放到外部存储中再借助 retrieval 来使用**。

### 专注于目标
简单的做法是**在 prompt 结尾处再把目标加上**，引起 agent 的注意。
另外像 BabyAGI，HuggingGPT 这种把 **planning 和 execution 分开**的做法也是很有用。**拆分的比较细**的任务往往步骤比较短，也不容易丢失目标。

### 结果评估
+ **评估最终结果**是否正确
+ **过程的细化评估**
  - 选择的中间步骤是否正确。
  - 生成 action 的 input 是否正确。
  - 生成的步骤序列是否合理高效。


# 参考
4. [AutoGPT与LLM Agent解析](https://zhuanlan.zhihu.com/p/622947810) *** 
8. [LLM 全栈开发指南补遗](https://zhuanlan.zhihu.com/p/633033220)  Agents  ***
   [Harrison Chase: Agents](https://fullstackdeeplearning.com/llm-bootcamp/spring-2023/chase-agents/)  ***
   
   

1xx. [LLM Agent 现状和一些思考 （202401）](https://zhuanlan.zhihu.com/p/679032270)
   当前 Agent 的缺陷和挑战
   
1xx. [Agent开发者坦白：窘境中前行](https://mp.weixin.qq.com/s/kCXZN7Wli-RCvZXRb6mF7g)