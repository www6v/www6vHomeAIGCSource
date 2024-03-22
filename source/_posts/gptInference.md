---
title: (综述)推理优化
date: 2023-01-01 22:58:43
tags:
  - Inference
categories: 
  - AIGC
  - Inference 
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 推理 优化
### overview[2.2]
有几种方法可以在内存中**降低推理成本**或/和**加快推理速度**。
- 应用各种**并行处理方式**，以在大量GPU上扩展模型。智能并行处理模型组件和数据使得运行拥有数万亿参数的模型成为可能。
- **内存卸载**，将临时未使用的数据卸载到CPU，并在以后需要时再读回。这有助于减少内存使用，但会导致更高的延迟。
- **智能批处理策略**；例如，EffectiveTransformer将连续的序列打包在一起，以消除批处理内的填充。
- **网络压缩技术**，如**修剪、量化、蒸馏**。较小的模型，无论是参数数量还是位宽，应该需要更少的内存并且运行更快。
- 针对目标模型架构的特定改进。许多**架构变化**，特别是针对注意力层的变化，有助于提高Transformer解码速度。

### 模型压缩 [2.1]

{% asset_img 'compress.png' %}

+ 剪枝（Pruning）
+ 知识蒸馏（Knowledge Distillation，KD）
+ 量化（Quantization）
+ 低秩分解（Low-Rank Factorization）

### KV Cache[2.3][2.4]


# 参考
### 综述
2.1. [一文探秘LLM应用开发(13)-模型部署与推理(优化理论) ](https://mp.weixin.qq.com/s/glPPSqHjsnDjC0DZSuuPzA) 
2.2   [Large Transformer Model Inference Optimization ](https://lilianweng.github.io/posts/2023-01-10-inference-optimization/)
1xx. [大语言模型推理性能优化综述](https://zhuanlan.zhihu.com/p/656485997)
1xx. [NLP（十八）：LLM 的推理优化技术纵览](https://zhuanlan.zhihu.com/p/642412124) *** 

### kv cache
2.3. [NLP（二十）：漫谈 KV Cache 优化方法，深度理解 StreamingLLM](https://zhuanlan.zhihu.com/p/659770503) ***
2.4. [大模型推理加速：看图学KV Cache](https://zhuanlan.zhihu.com/p/662498827) ***





