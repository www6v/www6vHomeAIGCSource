---
title: (综述)多模态 
date: 2023-01-18 09:48:37
tags:
  - multimodal
categories:
  - AIGC  
  - multimodal
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 论文[Foundational Models Defining]
+ 论文地址
 《Foundational Models Defining a New Era in Vision: A Survey and Outlook》大学


# 基础模型分类 [1]
+ 分类
{% asset_img  'pattern.webp' %}

+ 分类
{% asset_img  'pattern1.webp' %}

### textually prompted models 
  - contrastive
    CLIP  双塔
  - generative 
    Flamingo 
  - hybrid 
    BLIP
  - conversational
    GPT-4， miniGPT4, LLaVa

传统上，视觉语言模型主要用于需要同时理解视觉和文本模态的任务。然而，随着CLIP展示出的卓越性能，基于**语言监督的模型**在显著上升，并成为主流方法。在本节中，我们专注于探索依赖**语言作为主要监督来源**的方法。这些以文本为提示的模型可以广泛分为三种主要类型：对比、生成和混合方法。


###  visually prompted models
  - Foundational 
    SAM

###  heterogeneous  models

# 架构 [1]
{% asset_img  'arch.webp' %}

---

# 论文[MM-LLMs]
+ 论文地址
 《MM-LLMs: Recent Advances in MultiModal Large Language Models》  腾讯

+ 开源地址
  [mm-llms](https://mm-llms.github.io/archives/) 腾讯

+ 解析
  [解析](https://candied-skunk-1ca.notion.site/MM-LLMs-Recent-Advances-in-MultiModal-Large-Language-Models-7ee5033df80e4b5394153c6a77cc21a3?pvs=4)

---

# 论文[MLLM]
+ 论文地址
   [A Survey on Multimodal Large Language Models](https://arxiv.org/pdf/2306.13549v1)
   [A Survey on Multimodal Large Language Models](https://arxiv.org/abs/2306.13549) 中国科学技术大学   腾讯

+ 开源地址
  [Repo](https://github.com/BradyFU/Awesome-Multimodal-Large-Language-Models)

# Arch [3.2]
{% asset_img  'arch2.png' %}

# 类型[3.1]
+ 本文将最近具有代表性的MLLM分为4种主要类型：
  - **多模态指令调整（MIT）**
  - 多模态上下文学习（M-ICL）
  - 多模态思想链（M-CoT）
  - **LLM辅助视觉推理（LAVR）**【类似agent】
  
# 参考
### survey
1. 《Foundational Models Defining a New Era in Vision: A Survey and Outlook》
    [视觉大模型的全面解析](https://blog.csdn.net/qq_45368632/article/details/132180645)
    [基础模型定义视觉的新时代：综述和展望](https://zhuanlan.zhihu.com/p/655135848)
    [万字长文带你全面解读视觉大模型](https://zhuanlan.zhihu.com/p/648578542)

2. xxx
   
3. 《A Survey on Multimodal Large Language Models》  v1 v2版本
   3.1 [MLLM首篇综述 | 一文全览多模态大模型的前世、今生和未来](https://cloud.tencent.com/developer/article/2322835)  v1版本
   3.2 [多模态大语言模型全面综述：架构，训练，数据，评估，扩展，应用，挑战，机遇](https://mp.weixin.qq.com/s/V5aiWUYh14q00jAn2O6VKA)  v2版本








