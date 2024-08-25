---
title: (综述)推理优化
date: 2023-08-14 13:23:31
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


# 论文
+ 论文地址
 [A Survey on Efficient Inference for Large Language Models](https://arxiv.org/abs/2404.14294) 

+ 论文解析
  [论文解析](https://candied-skunk-1ca.notion.site/A-Survey-on-Efficient-Inference-for-Large-Language-Models-22145473188e437881bf566241492bea?pvs=4)
  
  
# 推理 [10]

### Trending LLM/VLM Topics
+ Mooncake
  Mooncake: A KVCache-centric Disaggregated Architecture for LLM Serving
+ MInference
 MInference 1.0: Accelerating Pre-filling for Long-Context LLMs via Dynamic Sparse

### LLM Algorithmic/Eval Survey
+ [Efficient Large Language Models: A Survey](https://github.com/AIoT-MLSys-Lab/Efficient-LLMs-Survey)


### LLM Train/Inference Framework[系统层优化]
+ Megatron-LM
   Training Multi-Billion Parameter Language Models Using Model Parallelism
+  **vLLM**
   Efficient Memory Management for Large Language Model Serving with PagedAttention
+ StreamingLLM
   EFFICIENT STREAMING LANGUAGE MODELS WITH ATTENTION SINKS
+ **TensorRT-LLM**
+ **DeepSpeed-FastGen 2x vLLM?**
  DeepSpeed-FastGen: High-throughput Text Generation for LLMs via MII and DeepSpeed-Inference
+ PETALS

+ **Mooncake**
   Mooncake: A KVCache-centric Disaggregated Architecture for LLM Serving
+ LMDeploy
  LMDeploy: LMDeploy is a toolkit for compressing, deploying, and serving LLMs
+ MLC-LLM
+ LightLLM
+ llama.cpp
+ flashinfer

### Continuous/In-flight Batching[系统层优化]
+ **Continuous Batching**
+ **In-flight Batching**

### Weight/Activation Quantize/Compress[模型层优化]
+ ZeroQuant
+ **GPTQ**
+ WINT8/4
+ **SmoothQuant**
+ **AWQ**
+ SparQ
+ W4A8KV4

### IO/FLOPs-Aware/Sparse Attention [模型层优化]
+ **MQA** 
+ **FlashAttention**
+ **GQA**
+ Flash-Decoding
+ FlashAttention-3

### KV Cache Scheduling/Quantize/Dropping[系统层优化]
+ MQA
+ GQA
+ **PagedAttention**
+ TensorRT-LLM KV Cache FP8
+ RadixAttention
+ **DistKV-LLM**
  Infinite-LLM: Efficient LLM Service for Long Context with DistAttention and Distributed KVCache(@Alibaba etc)

### Prompt/Context Compression[数据层优化]
+ Selective-Context
  Compressing Context to Enhance Inference Efficiency of Large Language Models(@Surrey)
+ **LLMLingua** 
  LLMLingua: Compressing Prompts for Accelerated Inference of Large Language Models(@Microsoft)
+ **LongLLMLingua**
  LongLLMLingua: Accelerating and Enhancing LLMs in Long Context Scenarios via Prompt Compression(@Microsoft)

### Long Context Attention/KV Cache Optimization
+ Blockwise Attention
  Blockwise Parallel Transformer for Large Context Models(@UC Berkeley)
+ RingAttention
  Ring Attention with Blockwise Transformers for Near-Infinite Context(@UC Berkeley)
+ KVQuant
+ RAGCache
+ KCache
+ YOCO
  You Only Cache Once: Decoder-Decoder Architectures for Language Models(@Microsoft)

### Early-Exit/Intermediate Layer Decoding

### Parallel Decoding/Sampling[系统层优化]
+ **Speculative Sampling**
  Accelerating Large Language Model Decoding with Speculative Sampling(@DeepMind)

### CPU/Single GPU/FPGA/Mobile Inference 
+ OpenVINO
+ xFasterTransformer

# 参考
### Awesome-LLM-Inference
10. [Awesome-LLM-Inference Repo](https://github.com/DefTruth/Awesome-LLM-Inference) git
1xx.  [[Awesome-LLM-Inference]🔥第三期：30篇，LLM推理论文集-500页PDF](https://zhuanlan.zhihu.com/p/669777159)
1xx.  [[Awesome-LLM-Inference]🔥第二期: 20篇，LLM推理论文集-300页PDF](https://zhuanlan.zhihu.com/p/658091768)
1xx.  [[LLM推理优化]🔥100+篇: 大模型推理各方向新发展整理](https://zhuanlan.zhihu.com/p/693680304) 