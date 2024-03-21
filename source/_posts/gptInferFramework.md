---
title: (原理)推理-框架
date: 2023-03-21 22:18:17
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

# vLLM[2]
### page attention 
   memory sharing



# TensorRT-LLM
### key features
+ Flash Attention
+ MMHA
+ Quantization
+ Multi-GPU Multi-Node
+ TP/PP
+ In-flight Batching


### Quantization
+ QAT Expensive
+ PTQ More feasible than QAT



### Quantization[3]

|                   | Weight only quant | smoothquant(PTQ ) | fp8(PTQ ) |
| ----------------- | ----------------- | ----------------- | --------- |
| Latency Reduction | **                | ***(best)         | ***(best) |
| Modal Acc         | **                | *                 | ***(best) |
| Memory Saving     | **                | ***(best)         | ***(best) |
| Ease of use       | ***(best)         | **                | *         |



# 参考

1.1. [探秘LLM应用开发](https://mp.weixin.qq.com/mp/appmsgalbum?action=getalbum&__biz=MzA5MTIxNTY4MQ==&scene=1&album_id=2959126655292211206)   8-19

2. [VLLM ——高效GPU训练框架](https://www.bilibili.com/video/BV1cP41187wY/) V

3. [大语言模型推理：低精度最佳实践](https://www.bilibili.com/video/BV1h44y1c72B) V

1xx. [一文探秘LLM应用开发(18)-模型部署与推理(框架工具-Triton Server、RayLLM、OpenLLM)](https://mp.weixin.qq.com/s?__biz=MzA5MTIxNTY4MQ==&mid=2461142079&idx=1&sn=07d9033203c0064408fe0af33d1f9414)

1xx. [一文探秘LLM应用开发(16)-模型部署与推理(框架工具-TGI，vLLM，TensorRT-LLM，DS-MII) ](https://mp.weixin.qq.com/s?__biz=MzA5MTIxNTY4MQ==&mid=2461142012&idx=1&sn=dafb0b676cdf6d41fd9bd54f9b6a82d3)

1xx. [大模型推理框架概述](https://zhuanlan.zhihu.com/p/659792625)







