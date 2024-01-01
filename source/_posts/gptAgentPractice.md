---
title:  Agent 实践
date: 2023-01-01 10:33:11
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





# Assistant API功能介绍 [7]
从功能实现层面来说，Assistant API是截至目前最完整、性能最强大的AI应用开发API，具体功能如下：
- 首先，Assistant API前所未有的能够**调用OpenAI各模型的各项能力**，包括可以调用Chat系列模型（即GPT系列模型）完成文本对话、调用DALL·E 3进行绘图、调用GPT-4-vision进行图像识别、以及调用Text-to-Speech模型进行语音转文字等，并且支持在一轮对话中调用不同模型；
- 其次，Assistant API还**内置了代码解释器功能（Code interpreter）和海量文本信息提取功能（Knowledge retrieval）**同时也一如既往支持借助**Function calling**进行模型功能层面拓展，此外，非常重要的是，Assistant API还支持在一轮对话中调用多个工具；
- 其三，此外对于开发者非常友好的一点是，Assistant API最小运行单元为持久化的线程对象（persistent Threads），因此在实际运行Assistant API时，不仅能可以精确控制每一步的执行过程，同时persistent Threads也会保留每轮对话的核心信息，并且当超出模型接收信息最大上下文限制时能够自动删除早期信息，从而实现对模型短期记忆的合理管理；
- 其四，Assistant API还能够直**接连接OpenAI在线文档库**，即如果用户将外部文档保存在OpenAI云空间内，则可以在调用Assistant API时实时访问文档库中的任意文件，甚至可以在不同线程中调用不同的文档。而在借助Assistant API的Knowledge retrieval功能，则可以让大模型实时获取这些文件信息，并且合理管理短期记忆；



# 参考
7. [Assistant API详解与Agent开发实战-九天Hector](https://github.com/www6v/AIGC/tree/master/%E4%B9%9D%E5%A4%A9Hector/Assistant%20API%E8%AF%A6%E8%A7%A3%E4%B8%8EAgent%E5%BC%80%E5%8F%91%E5%AE%9E%E6%88%98-%E4%B9%9D%E5%A4%A9Hector)
