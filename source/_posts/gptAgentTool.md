---
title: (原理)Agent-Tools
date: 2023-01-27 16:32:24
tags:
  - agent
categories:
  - AIGC  
  - agent
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 论文
+ 论文地址
  [Tool Learning with Foundation Models](https://arxiv.org/pdf/2304.08354.pdf) 

+ 开源地址
 [ToolLearningPapers](https://github.com/thunlp/ToolLearningPapers) git  

# 分类[1]
### Tool-augmented vs. Tool-oriented [kimi 总结]
1. Tool-augmented Learning（工具增强学习）:
   - 这种学习方式指的是在基础模型（如大型预训练语言模型）的基础上，**通过引入外部工具来增强模型的能力**。这些工具可以是任何可以被模型通过某种接口调用的系统或服务，例如搜索引擎、数据库、API等。
   - 工具增强学习的核心在于模型利用这些工具来获取额外的信息或执行特定的任务，从而弥补模型自身知识和能力的不足。
   - 例如，**一个语言模型可能通过调用天气API来获取最新的天气信息，或者通过搜索引擎来找到相关问题的答案**。

2. Tool-oriented Learning（面向工具的学习）:
   - 面向工具的学习则更多地关注于模型如何学习和理解如何使用这些工具。这不仅仅是调用工具API那么简单，而是**涉及到模型对工具的深入理解和策略性使用**。
   - 在这种学习模式下，模型可能需要**学习如何组合使用多个工具**，或者在复杂任务中动态调整对工具的使用策略，以实现更高效的问题解决。
   - 例如，模型可能需要学习如何在**规划一次旅行**时，先后调用地图API、航班搜索API和酒店预订API，同时还要根据用户反馈和环境变化动态调整计划。

总的来说，Tool-augmented Learning 强调的是通过外部工具来扩展模型的能力，而 Tool-oriented Learning 则更侧重于模型对工具使用的学习和优化。两者都是工具学习（Tool Learning）的重要组成部分，但在实际应用中可能会有不同的实现方式和关注点。

### Tool-augmented Learning
+ Toolformer   
  {% post_link 'gptAgentToolformer' %}
  
### Tool-oriented Learning
+ ToolMaker[10]
+ CREATOR[11]
+ ToolLLM [12]
+ Visual ChatGPT[13]
+ HuggingGPT[14]
+ Gorilla 
{% post_link 'gptAgentToolGorilla' %} 

# 参考
1. [大模型工具学习权威综述，BMTools 背后的论文！](https://zhuanlan.zhihu.com/p/624459759)

1xx. [清华发布工具学习框架，让ChatGPT操控地图、股票查询，贾维斯已来？](https://blog.csdn.net/xixiaoyaoww/article/details/130278978)

1xx. [回顾大模型在工具使用上的技术总结：兼看图检索增强生成方案-GRAG ](https://mp.weixin.qq.com/s/yZYGqAKIqDfGYF2YUckiiw)
   《Tool Learning with Large Language Models: A Survey》
   问题2:关于大模型使用工具的调研整理

### xxx
10. [LLM能够自己制作工具了：详解Large Language Models as Tool Makers](https://zhuanlan.zhihu.com/p/633654195)  

11. [THUNLP成员领读EMNLP大模型工具创造新框架“CREATOR”](https://www.bilibili.com/video/BV1EN4y1q7Zn/) V 有思维导图 

12. 《TOOLLLM: FACILITATING LARGE LANGUAGE MODELS TO MASTER 16000+ REAL-WORLD APIS》
[TOOLLLM：让大型语言模型掌握真实世界的API](https://zhuanlan.zhihu.com/p/647899563)
[ToolBench ](https://github.com/OpenBMB/ToolBench) git
[论文阅读：ToolLLM: Facilitating Large Language Models to Master 16000+ Real-world APIs](https://blog.csdn.net/Dbox_boom/article/details/134815624)

13. 《Visual ChatGPT: Talking, Drawing and Editing with Visual Foundation Models》
    [TaskMatrix](https://github.com/chenfei-wu/TaskMatrix)
  
14. [LLMs的自动化工具系统（HuggingGPT、AutoGPT、WebGPT、WebCPM）](https://nakaizura.blog.csdn.net/article/details/130856470)  
    

### Others
《Augmented Language Models》 
1xx. [Augmented Language Models（增强语言模型）](https://blog.csdn.net/qq_39388410/article/details/130798125)
1xx. [增强语言模型（ALM）之综述篇](https://zhuanlan.zhihu.com/p/611492200)







