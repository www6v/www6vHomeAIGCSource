---
title: 量化
date: 2023-02-19 17:00:25
tags:
  - 量化
categories: 
  - AIGC
  - 量化  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 量化
### 量化的定义  [3]
{% asset_img 'quantization.jpeg' %}

### 量化的两个阶段  [3]
{% asset_img 'twoProcedures.jpeg' %}


### 量化分类
+ 量化分类 [3][5]
  + Quantization-Aware Training (QAT)  
    **Need more data and time, More accurate**
  + Quantization-Aware Fine-tuning，QAF   
  + Post-Training Quantization (PTQ)  
    **Need fewer data and time, Less accurate**

+  PyTorch 支持的三种量化类型 [4]
   - dynamic quantization (weights quantized with activations read/stored in floating point and quantized for compute)
   - static quantization (weights quantized, activations quantized, calibration required post training)    **->PTQ**
   - static quantization aware training (weights quantized, activations quantized, quantization numerics modeled during training)   **->QAT**
  
  
### 量化推理

# 实战-PTQ[1]
###  量化与8bit模型训练
``` python
import torch
model = AutoModelForCausalLM.from_pretrained("D:/Pretrained_models/modelscope/Llama-2-7b-ms", low_cpu_mem_usage=True, 
                                             torch_dtype=torch.half, device_map="auto", load_in_8bit=True)
```

# 低精度训练方法[chat]
+ 半精度浮点数（FP16）训练
+ 混合精度训练（Mixed Precision Training）
+ 量化训练（Quantization Training）

# 参考
1.  [ 量化与8bit模型训练](https://www.bilibili.com/video/BV1EN411g7Yn/) V
    [【手把手带你实战HuggingFace Transformers-低精度训练篇】量化与8bit模型训练](https://www.bilibili.com/video/BV1EN411g7Yn/)
   [llama2_lora_8bit.ipynb](https://github.com/www6v/transformers-code/blob/master/04-Kbit%20Training/26-8bits_training/llama2_lora_8bit.ipynb)
2. [大模型训练｜概念篇](https://zhuanlan.zhihu.com/p/649460612)
3. << An Introduction to Quantization of Large Language Model >> 
4. [pytorch Quantization](https://pytorch.org/docs/stable/quantization.html)
5. [目前针对大模型进行量化的方法有哪些？](https://www.zhihu.com/question/627484732/answer/3261671478)

1xx. [神经网络低比特量化中训练和推理是如何实现的？](https://www.zhihu.com/question/510246227)


