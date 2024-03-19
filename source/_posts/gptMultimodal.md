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

# 基础模型分类 [1]
{% asset_img  'pattern.webp' %}

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


# 总结 [10]
{% asset_img  'multimodal.webp' %}

# Model Architecture[2]
{% asset_img  'multimodalArach.png' %}



# 其他
+ 对比
  - [CNN  更深的网络]
  - [transformer 没有局限]
  
+ CV任务
  - 分类（Classification）
  - 检测（Detection）
  - 分割（Segmentation）
  - 跟踪（Tracking）
  - 行为识别（Action Recognition）
  
# 参考
### survey
1. 《Foundational Models Defining a New Era in Vision: A Survey and Outlook》大学
    [视觉大模型的全面解析](https://blog.csdn.net/qq_45368632/article/details/132180645)
    [基础模型定义视觉的新时代：综述和展望](https://zhuanlan.zhihu.com/p/655135848)
    [万字长文带你全面解读视觉大模型](https://zhuanlan.zhihu.com/p/648578542)

2. [AI之MLM：《MM-LLMs: Recent Advances in MultiModal Large Language Models多模态大语言模型的最新进展》翻译与解读](https://blog.csdn.net/qq_41185868/article/details/135877268) 翻译
   [腾讯发布的多模态大模型（MM-LLM）的最新综述、从26个最新的多模态大模型中归纳最佳实践](https://zhuanlan.zhihu.com/p/680487634)
   [多模态大模型最新完整综述 MM-LLMs](https://zhuanlan.zhihu.com/p/680955430)
   [mm-llms](https://mm-llms.github.io/archives/) 腾讯


1xx. [MLLM首篇综述 | 一文全览多模态大模型的前世、今生和未来](https://cloud.tencent.com/developer/article/2322835)
   [A Survey on Multimodal Large Language Models](https://arxiv.org/abs/2306.13549)

### Overview
10. [多模态大模型 CLIP, BLIP, BLIP2, LLaVA, miniGPT4, InstructBLIP 系列解读](https://zhuanlan.zhihu.com/p/653902791) ***

1xx. [Multimodality and Large Multimodal Models (LMMs)](https://huyenchip.com/2023/10/10/multimodal.html)
   [多模态和多模态大模型 (LMM)[译]](https://baoyu.io/translations/lmm/multimodality-and-large-multimodal-models)

1xx. [写在多模态征服一切之前（未来数据和模型应该是什么样的？）](https://zhuanlan.zhihu.com/p/667942680)

1xx. [多模态论文串讲](https://blog.csdn.net/qq_52038588/article/details/133893013) ***

### chat
1xx. [[论文阅读] 双子座：一个功能强大的多模态模型系列，Gemini: A Family of Highly Capable Multimodal Models](https://zhuanlan.zhihu.com/p/670821058)

1xx. [166页超长论文阅读，大多模态模型的黎明：GPT-4V的初步探索，The Dawn of LMMs: Preliminary Explorations with GPT-4V(ision) [上]](https://zhuanlan.zhihu.com/p/663655741)


### other
1xx. [DeepMind出手！多模态小样本打败精调](https://zhuanlan.zhihu.com/p/511517344)
1xx. [大模型系列04 -文本图像生成](https://zhuanlan.zhihu.com/p/669757416)


1xx. [基于LLMs的多模态大模型（Flamingo, BLIP-2，KOSMOS-1，ScienceQA）](https://blog.csdn.net/qq_39388410/article/details/130757157)



### agent
1xx. [WebVoyager：借助强大多模态模型，开创全新的网络智能体 [译]](https://baoyu.io/translations/ai-paper/2401.13919-webvoyager-building-an-end-to-end-web-agent-with-large-multimodal-models)





