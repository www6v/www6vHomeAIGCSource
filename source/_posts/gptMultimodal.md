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

# 论文
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

# 论文
+ 论文地址
 《MM-LLMs: Recent Advances in MultiModal Large Language Models》  腾讯

+ 开源地址
  [mm-llms](https://mm-llms.github.io/archives/) 腾讯

# Model Architecture[2]
{% asset_img  'multimodalArach1.jpg' %}

+ Modality Encoder模态编码器
	对于图像，通常有四种可选编码器:NFNet-F6 (Brock等人，2021)、ViT (Dosovitskiy等人，2020)、CLIP ViT (Radford等人，2021)和Eva-CLIP ViT (Fang等人，2023)。
	- **NFNet-F6**是一种无归一化器的ResNet (He et al.， 2016)，展示了一种自适应梯度裁剪技术，允许在广泛增强的数据集上进行训练，同时实现SOTA级别的图像识别。
	- **ViT**将Transformer (Vaswani et al.， 2017)应用于图像，首先将图像划分为小patch。然后进行线性投影使patch展平，然后通过多个Transformer块进行编码。
	- **CLIP ViT**在文本和图像之间建立连接，包括一个ViT和一个文本编码器。它利用大量的文本-图像对，通过对比学习来优化ViT，将配对的文本和图像视为正样本，其他为负样本。
	- 它的**Eva版本**稳定了大规模CLIP的训练和优化过程，为扩展和加速昂贵的多模态基础模型训练提供了新的方向。对于视频，可以均匀采样到5帧，并经过与图像相同的预处理。



+ Input Projector输入投影器
	**输入投影器**可以直接通过线性投影器或多层感知器(MLP)来实现，即交替使用几个线性投影器和非线性激活函数。
	还有更复杂的实现，如交叉注意Cross-attention、Q-Former (Li et al.， 2023c)或P-Former (Jian et al.， 2023)。
	
	- **Cross-attention**使用一组可训练向量作为查询，并使用编码特征FX作为键将特征序列压缩到固定长度。然后将压缩后的表示直接输入LLM (Bai等人，2023b)或进一步用于X-text交叉注意融合(Alayrac等人，2022)。 
	- **Q-Former**从FX中提取相关特征，然后将选中的特征作为提示PX。
	- 同时，P-Former生成“参考提示”，对Q-Former生成的提示施加对齐约束。然而，Q-和P-Former都需要单独的PT进程进行初始化。
	
	| Input Projector输入投影器 |                                           |
	| ------------------------- | ----------------------------------------- |
	| Cross-attention           | Flamingo, Owl, Qwen-VL                    |
	| Q-Former                  | BLIP2, InstructBLIP, MiniGPT-4, MiniGPT-5 |
	| MLP                       | CogVLM , LLaVa1.5                         |
	| Linear Project            | LLaVa, PaLI-x,  MiniGPT-v2                |
	
	


{% asset_img  'multimodalArch.jpg' %}

---

# 论文
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

---

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
1. 《Foundational Models Defining a New Era in Vision: A Survey and Outlook》
    [视觉大模型的全面解析](https://blog.csdn.net/qq_45368632/article/details/132180645)
    [基础模型定义视觉的新时代：综述和展望](https://zhuanlan.zhihu.com/p/655135848)
    [万字长文带你全面解读视觉大模型](https://zhuanlan.zhihu.com/p/648578542)

2. 《MM-LLMs: Recent Advances in MultiModal Large Language Models》
   [AI之MLM：《MM-LLMs: Recent Advances in MultiModal Large Language Models多模态大语言模型的最新进展》翻译与解读](https://blog.csdn.net/qq_41185868/article/details/135877268) 翻译
   [腾讯发布的多模态大模型（MM-LLM）的最新综述、从26个最新的多模态大模型中归纳最佳实践](https://zhuanlan.zhihu.com/p/680487634)
   [多模态大模型最新完整综述 MM-LLMs](https://zhuanlan.zhihu.com/p/680955430)
   
3. 《A Survey on Multimodal Large Language Models》  v1 v2版本
   3.1 [MLLM首篇综述 | 一文全览多模态大模型的前世、今生和未来](https://cloud.tencent.com/developer/article/2322835)  v1版本
   3.2 [多模态大语言模型全面综述：架构，训练，数据，评估，扩展，应用，挑战，机遇](https://mp.weixin.qq.com/s/V5aiWUYh14q00jAn2O6VKA)  v2版本

### chat
1xx. [[论文阅读] 双子座：一个功能强大的多模态模型系列，Gemini: A Family of Highly Capable Multimodal Models](https://zhuanlan.zhihu.com/p/670821058)

1xx. [166页超长论文阅读，大多模态模型的黎明：GPT-4V的初步探索，The Dawn of LMMs: Preliminary Explorations with GPT-4V(ision) [上]](https://zhuanlan.zhihu.com/p/663655741)


### other
1xx. [DeepMind出手！多模态小样本打败精调](https://zhuanlan.zhihu.com/p/511517344)
1xx. [大模型系列04 -文本图像生成](https://zhuanlan.zhihu.com/p/669757416)







