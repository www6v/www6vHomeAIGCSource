---
title: (原理|实战)混合精度 
date: 2024-02-01 22:29:42
tags:
  - Precision
categories:
  - AIGC
  - Precision
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 目的[3]
为了**加快训练时间**、**减少网络训练时候所占用的内存**，并且保存训练出来的模型精度持平的条件下，业界提出越来越多的混合精度训练的方法

# 使用的混合精度原因
{%  asset_img  'solution.png'  %}

# 混合精度解决方案
### FP32 权重备份 [1][2]

这种方法主要是用于**解决舍入误差**的问题。

{% asset_img 'weight-backup.jpg' %} 

### Loss Scale[1][2]

Loss Scale 主要是为了**解决 fp16 underflow**的问题。

{% asset_img 'loss-scale.jpg' %} 


# 实战
###  llama半精度训练[20]
+ 现象
  loss先变大，再为0
  loss爆炸，loss消失
+ 解决方案
  padding=left
  改为padding=right

``` python
import torch
model = AutoModelForCausalLM.from_pretrained("D:/Pretrained_models/modelscope/Llama-2-7b-ms", low_cpu_mem_usage=True, torch_dtype=torch.half, device_map="auto")
```


# 参考
### 原理
1. [混合精度](https://www.bilibili.com/video/BV1R94y1g78L?p=6)  *** V
2. [浅谈混合精度训练](https://zhuanlan.zhihu.com/p/103685761)
3. [全网最全-混合精度训练原理](https://zhuanlan.zhihu.com/p/441591808)  *** 
1xx. [【深度学习】混合精度训练与显存分析](https://zhuanlan.zhihu.com/p/608634079)

### 代码

20. [半精度训练与LLaMA2训练实战](https://www.bilibili.com/video/BV1CB4y1R78v/) 有代码
    [llama2_lora_16bit.ipynb](https://github.com/www6v/transformers-code/blob/master/04-Kbit%20Training/25-16bits_training/llama2_lora_16bit.ipynb)
    1xx. [PyTorch的自动混合精度（AMP）](https://zhuanlan.zhihu.com/p/165152789) 
    1xx. [混合精度](https://tensorflow.google.cn/guide/mixed_precision?hl=zh-cn)