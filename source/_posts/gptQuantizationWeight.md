---
title: (原理)Weight only quant(GPTQ, AWQ)
date: 2023-03-26 11:42:49
tags:
  - 量化
categories: 
  - AIGC
  - 量化  
---

<p></p>
<!-- more -->


# GPTQ[6]
### 原理
GPTQ 采用 int4/fp16 (W4A16) 的混合量化方案，其中**模型权重**被量化为 **int4** 数值类型，而**激活值**则保留在 ** float16**，是一种**仅权重量化**方法。在推理阶段，模型权重被动态地反量化回 float16 并在该数值类型下进行实际的运算；同 OBQ  一样，GPTQ还是从**单层量化**的角度考虑，**希望找到一个量化过的权重，使的新的权重和老的权重之间输出的结果差别最小**。

### 实现
AutoGPTQ 代码库集成到了 Transformers 中，让用户使用 GPTQ 算法在 **8 bit、4 bit、3 bit**，甚至是 **2 bit** 精度下量化和运行模型成为可能。当使用 **int4 量化**时，精度的下降可以忽略不计，同时在小批量推理上保持着与 fp16 基线相当的速度。需要注意的是，GPTQ 方法与 bitsandbytes 提出的训练后量化方法有所不同，GPTQ 需要**在量化阶段**提供一个**校准数据集**。

# AWQ [7]
### 技术原理
AWQ是一种对大模型**仅权重量化**方法。通过**保护更“重要”的权重不进行量化**，从而在不进行训练的情况下提高准确率。

### 实现
目前，除了官方提供了对于AWQ的支持（llm-awq）之外，社区有相当多的工具（如：**AutoAWQ**、**vLLM**、 HuggingFace TGI、LMDeploy、 **TensorRT-LLM**、FastChat 等）提供了对AWQ的支持。


# 参考
6. [大模型量化技术原理-LLM.int8()、GPTQ](https://zhuanlan.zhihu.com/p/680212402)
7. [大模型量化技术原理-AWQ、AutoAWQ](https://zhuanlan.zhihu.com/p/681578090)
1xx. 《8-实战Transformers模型量化》 Ai大模型微调