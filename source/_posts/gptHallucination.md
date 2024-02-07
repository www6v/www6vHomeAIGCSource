---
title: 幻觉问题
date: 2023-02-06 16:43:35
tags:
  - Hallucination 
categories: 
  - AIGC
  - Hallucination  
---

<p></p>
<!-- more -->

# 幻觉 vs 事实性[1]
**幻觉**主要是指LLM生成毫无根据或毫无根据的内容，幻觉可以理解为模型倾向于"生成与某些来源相关的无意义或不真实的内容"。这与**事实性问题**不同，后者强调模型学习、获取和利用事实性知识的能力。

举例说明两者的**区别**：

如果一个LLM在被要求创作"一个关于兔子和狼交朋友的童话故事"时，创作出了一个关于"兔子和狗交朋友"的故事，那么它就表现出了幻觉。不过，这并不一定是事实性错误。
如果生成的内容包含准确的信息，但与提示的具体内容有出入，那就是**幻觉**，而**不是事实性问题**。
例如，如果LLM的输出包含了比提示指定更多的细节或不同的元素，但事实仍然正确，这就是**幻觉**。

相反，如果LLM避免给出直接答案，而是说"我不知道"，或者给出了一个准确的答案，但遗漏了一些正确的细节，那么这就是**事实性问题**，而**不是幻觉**。

此外，值得注意的是，**幻觉有时会产生一些内容，虽然与原始输入内容有偏差，但在事实方面仍然是准确的**。

# 参考
1. [再看大模型事实性的界定、错误的起因、评估及前沿缓解方案：Survey on Factuality in LLMS](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404394&idx=1&sn=d7cfcf2cd9aa6756d3cbff938f5f4cf2)

1xx. [再看大模型幻觉问题如何缓解 ：Chain-of-Verification-一种基于链式验证思想的自我修正工作解读 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403998&idx=1&sn=400cc902434bc04df508a55e192d2455)

1xx. [也看缓解大模型幻觉的多阶段RAG框架：加入混合检索、过程理由生成与验证的方案 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648405983&idx=2&sn=95dc9c7a12bed99b63c775d4b90519d8)

1xx. [大模型幻觉综述](https://arxiv.org/abs/2309.01219)
   [大模型幻觉综述](https://arxiv.org/abs/2309.05922)

1xx. [网络安全领域微调模型SecGPT：兼看大模型幻觉的度量方式、评估benchmark及RAG增强不同方式 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648405791&idx=2&sn=d7dada69e6d5ab5fba1333d234b947ef) 大模型幻觉综述

1xx. [大模型前沿热点最新综述：大模型微调遗忘、Agent智能体、幻觉及RAG检索增强模型推介](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403602&idx=1&sn=f2365b05630094f8d0de7ff784abe233) 大模型微调遗忘

1xx. [值得一读的大模型生成幻觉研究综述：大模型幻觉的起因、评估以及减轻策略总结 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403341&idx=1&sn=86cdaaf2c3a73439d2591a2f3dd0b9e0)