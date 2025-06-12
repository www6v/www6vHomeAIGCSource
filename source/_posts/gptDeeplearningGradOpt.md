---
title: (原理)梯度优化
date: 2024-04-04 17:28:27
tags:
  - deepLearning
categories: 
  - AIGC
  - deepLearning   
---

<p></p>
<!-- more -->

# 梯度优化



# **Gradient accumulation**

{% asset_img 'maonmv7e.bmp' %}

# **G**radient checkpointing [10]

- 显存占用优化算法

  - memory usage 与 computation time 之间的 tradeoff ；

- gradient checkpointing

  - In deep neural networks, backpropagation requires storing **intermediate activations** for computing gradients during the backward pass.

  - 但是当层数变多时，存储所有的中间层的激活值（intermediate activations）非常地占用显存；

  - gradient checkpointing

    **选择性地重新计算（recompute）一部分的 intermediate activations 在反向传播过程中**来缓解显存的压力；

    

# **Gradient Clipping  (梯度裁剪)**

### 目的[21]

**梯度爆炸问题的常见应对方式为“梯度裁剪”**，也就是通过“clip”方式来防止迭代中梯度值过大。

### 两种常见形式[20]

- 梯度范数裁剪（Gradient Norm Clipping）: 这种方法涉及计算所有参数梯度的范数（例如L2范数），如果这个范数超过了设定的阈值，就将梯度缩放到这个阈值以内。在PyTorch中，这可以通过 **torch.nn.utils.clip_grad_norm_** 函数实现。
- 梯度值裁剪（Gradient Value Clipping）: 这种方法对每个参数的梯度值进行独立裁剪，确保它们不会超过一个设定的最大值或最小值。在PyTorch中，这可以通过 **torch.nn.utils.clip_grad_value_** 函数实现。

# 参考

### overview

[Performance and Scalability: How To Fit a Bigger Model and Train It Faster](https://huggingface.co/docs/transformers/v4.18.0/en/performance)  ***

### **gradient accumulation**

1xx. [[LLMs 实践\] 11 gradient accumulation 显存优化 trick](https://www.bilibili.com/video/BV1tz4y1773d/)  v

​	[gradient_accumulation.ipynb](https://github.com/chunhuizhang/personal_chatgpt/blob/main/tutorials/gradient_accumulation.ipynb)

​	[ [LLMs 实践\] 11 gradient accumulation 显存优化 trick  ](https://www.notion.so/LLMs-11-gradient-accumulation-trick-180bfe21108480639536fa51f7de92a8?pvs=21)

1xx.  [Pytorch入门（7）—— 梯度累加（Gradient Accumulation）](https://blog.csdn.net/wxc971231/article/details/139177793)

1xx. [聊聊梯度累加(Gradient Accumulation)](https://zhuanlan.zhihu.com/p/595716023)

1xx. [What is Gradient Accumulation in Deep Learning?](https://towardsdatascience.com/what-is-gradient-accumulation-in-deep-learning-ec034122cfa)

1xx. [Performing gradient accumulation with Accelerate](https://huggingface.co/docs/accelerate/usage_guides/gradient_accumulation)

​	[使用Accelerate进行梯度累积](https://hugging-face.cn/docs/accelerate/usage_guides/gradient_accumulation)

### gradient checkpointing

10. [[LLMs 实践\] 13 gradient checkpointing 显存优化 trick](https://www.bilibili.com/video/BV1QM4y1H7nH/) v

​	[gradient_checkpointing.ipynb](https://github.com/chunhuizhang/personal_chatgpt/blob/main/tutorials/gradient_checkpointing.ipynb)

​	[[LLMs 实践\] 13 gradient checkpointing 显存优化 trick ](https://www.notion.so/LLMs-13-gradient-checkpointing-trick-180bfe211084806db50fe0b130061a13?pvs=21)

​	[Fitting larger networks into memory.](https://medium.com/tensorflow/fitting-larger-networks-into-memory-583e3c758ff9) *** 看动图

​	[Backprop and systolic arrays.](https://yaroslavvb.medium.com/backprop-and-systolic-arrays-24e925d2050)

### **Gradient Clipping**

20. [梯度裁剪（Gradient Clipping）](https://blog.csdn.net/ZacharyGz/article/details/135410610)

​	https://github.com/pytorch/pytorch/blob/main/torch/nn/utils/clip_grad.py

21. [深度炼丹之梯度裁剪](https://zhuanlan.zhihu.com/p/99953668)

1xx. [【深度学习】第6.2节 梯度裁剪](https://zhuanlan.zhihu.com/p/659767690)

1xx. [【Pytorch】梯度裁剪——torch.nn.utils.clip_grad_norm_的原理及计算过程](https://blog.csdn.net/m0_46412065/article/details/131396098)

1xx.  [PyTorch使用Tricks：梯度裁剪-防止梯度爆炸或梯度消失 ！！](https://blog.csdn.net/leonardotu/article/details/136145043)



