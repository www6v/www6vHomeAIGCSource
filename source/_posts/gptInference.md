---
title: 推理
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

# 推理 框架[1.1]
{% asset_img 'inference.jpg' %}

+ server 云端
vLLM，TensorRT， deepspeed

+ pc/edge 移动端
 llama.cpp
  mlc-llm
  ollama

+ 服务 Server
  Triton Server
  
# 推理 优化
### overview[2.2]
有几种方法可以在内存中**降低推理成本**或/和**加快推理速度**。
- 应用各种**并行处理方式**，以在大量GPU上扩展模型。智能并行处理模型组件和数据使得运行拥有数万亿参数的模型成为可能。
- **内存卸载**，将临时未使用的数据卸载到CPU，并在以后需要时再读回。这有助于减少内存使用，但会导致更高的延迟。
- **智能批处理策略**；例如，EffectiveTransformer将连续的序列打包在一起，以消除批处理内的填充。
- **网络压缩技术**，如**修剪、量化、蒸馏**。较小的模型，无论是参数数量还是位宽，应该需要更少的内存并且运行更快。
- 针对目标模型架构的特定改进。许多**架构变化**，特别是针对注意力层的变化，有助于提高Transformer解码速度。


### 模型压缩 [2.1]
剪枝（Pruning）
知识蒸馏（Knowledge Distillation，KD）
量化（Quantization）
低秩分解（Low-Rank Factorization）

# 推理实战 [3]
### 模型转换
{% asset_img  'convert.png' %}
### TurboMind 推理+命令行本地对话
{% asset_img  'infer.png' %}
### TurboMind推理+API服务
+ 启动服务
{% asset_img  'infer-api.png' %}
+ Client访问服务
{% asset_img  'infer-api-client.png' %}

# 参考
### 框架
1.1. [探秘LLM应用开发](https://mp.weixin.qq.com/mp/appmsgalbum?action=getalbum&__biz=MzA5MTIxNTY4MQ==&scene=1&album_id=2959126655292211206)   8-19

100. https://github.com/www6v/llm-action/tree/main/inference
101. https://www.zhihu.com/question/625415776/answer/3243562246

### 优化
2.1. [一文探秘LLM应用开发(13)-模型部署与推理(优化理论) ](https://mp.weixin.qq.com/s/glPPSqHjsnDjC0DZSuuPzA) 
2.2 https://lilianweng.github.io/posts/2023-01-10-inference-optimization/
103. [大语言模型推理性能优化综述](https://zhuanlan.zhihu.com/p/656485997)
104. [NLP（十八）：LLM 的推理优化技术纵览](https://zhuanlan.zhihu.com/p/642412124) *** 
105. [NLP（二十）：漫谈 KV Cache 优化方法，深度理解 StreamingLLM](https://zhuanlan.zhihu.com/p/659770503)

### 实战
3. [lmdeploy 量化部署](https://github.com/InternLM/tutorial/blob/main/lmdeploy/lmdeploy.md)
   [(5)LMDeploy 大模型量化部署实践](https://www.bilibili.com/video/BV1iW4y1A77P/) V