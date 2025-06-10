---
title: (原理)幻觉问题
date: 2023-02-06 16:43:35
tags:
  - Hallucination 
categories: 
  - AIGC
  - Hallucination  
---

<p></p>
<!-- more -->



# 幻觉[3]

Hallucination in large language models usually refers to the model generating unfaithful, fabricated, inconsistent, or nonsensical content. As a term, hallucination has been somewhat generalized to cases when the model makes mistakes. Here, I would like to narrow down the problem of hallucination to cases where the model output is fabricated and **not grounded** by either the provided context or world knowledge.
大型语言模型中的幻觉通常是指模型生成不忠实、捏造、不一致或无意义的内容。作为一个术语，幻觉在某种程度上被推广到模型犯错的情况。在这里，我想将幻觉问题缩小到模型输出是捏造的， **而不是**基于所提供的上下文或世界知识的情况。



There are two types of hallucination:
幻觉有两种类型：

1. **In-context hallucination**: The model output should be consistent with the source content in context.
   上下文幻觉：模型输出应与上下文中的源内容一致。
2. **Extrinsic hallucination**: The model output should be grounded by the pre-training dataset. However, given the size of the pre-training dataset, it is too expensive to retrieve and identify conflicts per generation. If we consider the pre-training data corpus as a proxy for world knowledge, we essentially try to ensure the model output is factual and verifiable by external world knowledge. Equally importantly, when the model does not know about a fact, it should say so.
   外在幻觉：模型输出应以训练前数据集为基础。但是，考虑到预训练数据集的大小，检索和识别每代冲突的成本太高。如果我们将预训练数据语料库视为世界知识的代理，我们基本上会尝试确保模型输出是真实的，并且可以通过外部世界知识进行验证。同样重要的是，当模型不知道某个事实时，它应该这么说。



# Anti-Hallucination Methods[3]

### RAG → Edits and Attribution

**Self-RAG** (“Self-reflective retrieval-augmented generation”; [Asai et al. 2024](https://arxiv.org/abs/2310.11511)) trains a LM end-to-end to learn to reflect on its own generation by outputting both task output and intermittent special *reflection tokens*. They created a supervision dataset for a critic model and a generator model by prompting GPT-4 and then distilled that into an in-house model to reduce inference cost.
**Self-RAG**（“自反射检索增强一代”;[Asai 等人，2024](https://arxiv.org/abs/2310.11511) 年）通过输出任务输出和间歇性特殊*反射令牌* ，端到端训练 LM 以学习反射自己的生成。他们通过提示 GPT-4 为 critic 模型和生成器模型创建了一个监督数据集，然后将其提炼成内部模型以降低推理成本。



### Chain of Actions

Without grounding by external retrieved knowledge, we can design a process for using the model itself to do verification and revision to reduce hallucination.
在没有外部检索知识的基础的情况下，我们可以设计一个流程，使用模型本身进行验证和修改，以减少幻觉。



[Dhuliawala et al. (2023)](https://arxiv.org/abs/2309.11495) proposed a method named **Chain-of-Verification** (**CoVe**) based on a chain of actions to plan and execute verification. [10]
[Dhuliawala 等人（2023 年）](https://arxiv.org/abs/2309.11495) 提出了一种名为**验证链** （**CoVe**） 的方法，该方法基于一系列行动来计划和执行验证。



**RECITE** (“Recitation-augmented generation”; [Sun et al. 2023](https://arxiv.org/abs/2210.01296)) relies on recitation as an intermediate step to improve factual correctness of model generation and reduce hallucination. The motivation is to utilize Transformer memory as an information retrieval mechanism. Within RECITE’s recite-and-answer scheme, the LLM is asked to first recite relevant information and then generate the output. Precisely, we can use few-shot in-context prompting to teach the model to generate recitation and then generate answers conditioned on recitation. Further it can be combined with self-consistency ensemble consuming multiple samples and extended to support multi-hop QA.
**RECITE** （“朗诵增强生成”;[Sun 等人，2023](https://arxiv.org/abs/2210.01296) 年）依靠背诵作为中间步骤来提高模型生成的事实正确性并减少幻觉。动机是利用 Transformer 内存作为信息检索机制。在 RECITE 的背诵和回答方案中，要求 LLM 首先背诵相关信息，然后生成输出。准确地说，我们可以使用小镜头上下文提示来教模型生成背诵，然后生成以背诵为条件的答案。此外，它可以与使用多个样本的自一致性集成相结合，并扩展以支持多跳 QA。



todo

# Survey

### 论文
+ 论文地址
[A Survey of Hallucination in Large Foundation Models](https://arxiv.org/abs/2309.05922) Paper 

1xx. [大模型前沿热点最新综述：大模型微调遗忘、Agent智能体、幻觉及RAG检索增强模型推介](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403602&idx=1&sn=f2365b05630094f8d0de7ff784abe233) 大模型微调遗忘   幻觉

### 论文
+ 论文地址
[Siren's Song in the AI Ocean: A Survey on Hallucination in Large Language Models](https://arxiv.org/abs/2309.01219) Paper
1xx. [人工智能海洋中的塞壬之歌：大型语言模型LLM中的幻觉研究综述（一） ](https://mp.weixin.qq.com/s?__biz=MzU5NDg2MjgxMg==&mid=2247485189&idx=1&sn=95d6eb333dde007f262a2955b90bc7ec) 
1xx.  [大型语言模型的幻觉研究｜减轻及避免大模型LLM幻觉（二）](https://mp.weixin.qq.com/s/eGMwNz0F1dQsNDnsLNYr8Q)

1xx. [值得一读的大模型生成幻觉研究综述：大模型幻觉的起因、评估以及减轻策略总结 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403341&idx=1&sn=86cdaaf2c3a73439d2591a2f3dd0b9e0)   

# 幻觉 vs 事实性[1]
**幻觉**主要是指LLM生成毫无根据或毫无根据的内容，幻觉可以理解为模型倾向于"生成与某些来源相关的无意义或不真实的内容"。这与**事实性问题**不同，后者强调模型学习、获取和利用事实性知识的能力。

举例说明两者的**区别**：

如果一个LLM在被要求创作"一个关于兔子和狼交朋友的童话故事"时，创作出了一个关于"兔子和狗交朋友"的故事，那么它就表现出了幻觉。不过，这并不一定是事实性错误。
如果生成的内容包含准确的信息，但与提示的具体内容有出入，那就是**幻觉**，而**不是事实性问题**。
例如，如果LLM的输出包含了比提示指定更多的细节或不同的元素，但事实仍然正确，这就是**幻觉**。

相反，如果LLM避免给出直接答案，而是说"我不知道"，或者给出了一个准确的答案，但遗漏了一些正确的细节，那么这就是**事实性问题**，而**不是幻觉**。

此外，值得注意的是，**幻觉有时会产生一些内容，虽然与原始输入内容有偏差，但在事实方面仍然是准确的**。


# 解决方案[2]
+ Prompt 工程 *
  - Few-shot
  
+ 外部知识 *
  - RAG
  
+ 后处理 * 
  - 实事检查 *  
  - 人工检查  * 

+ 提升数据质量
  - Pretraining的数据质量
  - SFT的数据质量

+ 模型能力提升 *
  - 微调

# 参考
1. [再看大模型事实性的界定、错误的起因、评估及前沿缓解方案：Survey on Factuality in LLMS](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404394&idx=1&sn=d7cfcf2cd9aa6756d3cbff938f5f4cf2)

2. [降低大模型幻觉的5种方案](https://www.bilibili.com/video/BV1VXYxegErf/) v  
   [减少大模型幻觉，你必须要掌握的 6 个方法！](https://www.bilibili.com/video/BV1QUx9eFENq/) v  

3. [Extrinsic Hallucinations in LLMs](https://lilianweng.github.io/posts/2024-07-07-hallucination/) *** 

### Work

10. [再看大模型幻觉问题如何缓解 ：Chain-of-Verification-一种基于链式验证思想的自我修正工作解读 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403998&idx=1&sn=400cc902434bc04df508a55e192d2455)

1xx. [也看缓解大模型幻觉的多阶段RAG框架：加入混合检索、过程理由生成与验证的方案 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648405983&idx=2&sn=95dc9c7a12bed99b63c775d4b90519d8)


### survey
1xx. [大模型的幻觉问题调研: LLM Hallucination Survey](https://zhuanlan.zhihu.com/p/642648601)


1xx. [网络安全领域微调模型SecGPT：兼看大模型幻觉的度量方式、评估benchmark及RAG增强不同方式 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648405791&idx=2&sn=d7dada69e6d5ab5fba1333d234b947ef) 大模型幻觉综述


1xx. [LLM之幻觉（一）：大语言模型幻觉解决方案综述](https://mp.weixin.qq.com/s/N7NOsLHr8HYCMp5XGCBDjg)