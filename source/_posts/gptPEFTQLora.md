---
title: PEFT QLoRA 实战
date: 2024-01-12 10:36:44
tags:
  - PEFT
categories:
  - AIGC
  - PEFT
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 技术原理 [1]
使用一种新颖的高精度技术将预训练模型量化为 4 bit，然后添加一小组可学习的低秩适配器权重，这些权重通过量化权重的反向传播梯度进行微调。
QLoRA提出了两种技术实现高保真 4 bit微调——4 bit NormalFloat(NF4) 量化和双量化。

+ 4bit NormalFloat（NF4）：对于正态分布权重而言，一种信息理论上最优的新数据类型，该数据类型对正态分布数据产生比 4 bit整数和 4bit 浮点数更好的实证结果。

+ 双量化：对第一次量化后的那些常量再进行一次量化，减少存储空间。

+ 分页优化器:  使用此功能为优化器状态（Optimizer）分配分页内存，然后在 GPU 内存不足时将其自动卸载到 CPU 内存，并在优化器更新步骤需要时将其加载回 GPU 内存。

{% asset_img 'qlora.png' %}

实验证明，无论是使用16bit、8bit还是4bit的适配器方法，都能够复制16bit全参数微调的基准性能。这说明，尽管量化过程中会存在性能损失，但通过适配器微调，完全可以恢复这些性能。

# 实战1 [2]


# 参数
1. [大模型参数高效微调技术原理综述（五）-LoRA、AdaLoRA、QLoRA](https://zhuanlan.zhihu.com/p/636215898)
2. [高效微调技术QLoRA实战，基于LLaMA-65B微调仅需48G显存，真香](https://zhuanlan.zhihu.com/p/636644164)  先是训练llama-7b, 再是训练llama-65b
   [qlora](https://github.com/www6v/llm-action/tree/main/train/qlora) git
   
3. [4bits_training](https://github.com/zyds/transformers-code/tree/master/04-Kbit%20Training/27-4bits_training)
   [【手把手带你实战HuggingFace Transformers-低精度训练篇】4bit量化与QLoRA模型训练](https://www.bilibili.com/video/BV1DQ4y1t7e8/) V
   

1xx. [[大模型微调技术] LoRA、QLoRA、QA-LoRA 原理笔记](https://zhuanlan.zhihu.com/p/671089942) 
1xx. [大模型实操 | LoRA、QLoRA微调大模型实战技巧分享，含常见QA解答！](https://cloud.tencent.com/developer/article/2375230) 
