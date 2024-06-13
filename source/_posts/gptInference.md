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
### overview[2]
有几种方法可以在内存中**降低推理成本**或/和**加快推理速度**。
- 应用各种**并行处理方式**，以在大量GPU上扩展模型。智能并行处理模型组件和数据使得运行拥有数万亿参数的模型成为可能。
- **内存卸载**，将临时未使用的数据卸载到CPU，并在以后需要时再读回。这有助于减少内存使用，但会导致更高的延迟。
- **智能批处理策略**；例如，EffectiveTransformer将连续的序列打包在一起，以消除批处理内的填充。
- **网络压缩技术**，如**修剪、量化、蒸馏**。较小的模型，无论是参数数量还是位宽，应该需要更少的内存并且运行更快。
- 针对目标模型架构的特定改进。许多**架构变化**，特别是针对注意力层的变化，有助于提高Transformer解码速度。

### 模型压缩 [1]

{% asset_img 'compress.png' %}

+ 剪枝（Pruning）
+ 知识蒸馏（Knowledge Distillation，KD）
+ 量化（Quantization）
+ 低秩分解（Low-Rank Factorization）

### KV Cache

# 推理 [10]
### LLM Algorithmic/Eval Survey
[Efficient Large Language Models: A Survey](https://github.com/AIoT-MLSys-Lab/Efficient-LLMs-Survey)


### LLM Train/Inference Framework
Megatron-LM
vLLM ***
TensorRT-LLM ***
DeepSpeed-FastGen 2x vLLM?  ***
PETALS

### Continuous/In-flight Batching
Continuous Batching
In-flight Batching

### Weight/Activation Quantize/Compress
ZeroQuant
GPTQ
SmoothQuant
AWQ
SparQ

### IO/FLOPs-Aware/Sparse Attention
MQA
FlashAttention ***
GQA

### KV Cache Scheduling/Quantize/Dropping
PagedAttention *** 
TensorRT-LLM KV Cache FP8

### Prompt/Context Compression
Selective-Context
LLMLingua ***
LongLLMLingua ***

### Long Context Attention/KV Cache Optimization
RingAttention
KVQuant
RAGCache
KCache

### Parallel Decoding/Sampling
Speculative Sampling ***

# 参考
### 综述
1. [一文探秘LLM应用开发(13)-模型部署与推理(优化理论) ](https://mp.weixin.qq.com/s/glPPSqHjsnDjC0DZSuuPzA) 

2. [Large Transformer Model Inference Optimization ](https://lilianweng.github.io/posts/2023-01-10-inference-optimization/)

1xx. [大语言模型推理性能优化综述](https://zhuanlan.zhihu.com/p/656485997)

1xx. [NLP（十八）：LLM 的推理优化技术纵览](https://zhuanlan.zhihu.com/p/642412124) *** 

1xx. [3万字详细解析清华大学最新综述工作：大模型高效推理综述](https://mp.weixin.qq.com/s/U9ESiWehnoKc9SnDz7DVKg)

### Awesome-LLM-Inference
10. [Awesome-LLM-Inference Repo](https://github.com/DefTruth/Awesome-LLM-Inference) git
1xx. [[Awesome-LLM-Inference]🔥第三期：30篇，LLM推理论文集-500页PDF](https://zhuanlan.zhihu.com/p/669777159)
1xx. [[Awesome-LLM-Inference]🔥第二期: 20篇，LLM推理论文集-300页PDF](https://zhuanlan.zhihu.com/p/658091768)
1xx. [[LLM推理优化]🔥100+篇: 大模型推理各方向新发展整理](https://zhuanlan.zhihu.com/p/693680304)

