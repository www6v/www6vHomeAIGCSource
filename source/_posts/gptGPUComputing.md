---
title: GPU 计算
date: 2023-07-01 17:13:39
tags:
  - GPU
categories: 
  - AIGC
  - GPU
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 训练场景
### 公式[1]
训练显存消耗（可估算部分）主要包括：**模型参数（Model）+ 优化器状态（Optimizer status）+梯度值（Gradient）+激活值（Activation）**。根据数值的变化，可将显存消耗分为**静态/动态值**。训练过程中，**模型参数、优化器状态**一般不会变化，这两部分归属于**静态值**；**激活值、梯度值**会随着计算过程发生变化，将它们归类到**动态值**。 

+ 模型显存（Model Memory)
+ 优化器状态（Optimizer status）


+ 梯度值（Gradient）
+ 激活值（Activation）

+ 总结[2]
  **xB的大模型，训练的显存占用约为12-16x GB**。（默认全精度float32存储）

### 训练的并行计算公式[1]
+ 3D并行
+ 重计算（Recomputation）
+ Zero方法

# 推理场景
### 公式[1]
  1.2 * ModelMemory


# 工具
+ 使用 **HuggingFace Accelerate Web 工具**计算，实际值 = Total Size x 1.2
[model-memory-usage]( https://huggingface.co/spaces/hf-accelerate/model-memory-usage) git

+ 使用 **HuggingFace Accelerate 命令行工具**计算
``` shell
 $ accelerate estimate-memory meta-llama/Llama-2-13b-chat-hf
```

# 参考
1. [[LLM]大模型显存计算公式与优化](https://zhuanlan.zhihu.com/p/687226668)  定量

2. [大模型训练显存估算](https://zhuanlan.zhihu.com/p/680434161)  定性