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
### LLM Algorithmic/Eval Survey
[Efficient Large Language Models: A Survey](https://github.com/AIoT-MLSys-Lab/Efficient-LLMs-Survey)


### LLM Train/Inference Framework[系统层优化]
Megatron-LM
vLLM ***
TensorRT-LLM ***
DeepSpeed-FastGen 2x vLLM?  ***
PETALS

### Continuous/In-flight Batching[系统层优化]
Continuous Batching ***
In-flight Batching

### Weight/Activation Quantize/Compress[模型层优化]
ZeroQuant
GPTQ
SmoothQuant
AWQ ***
SparQ

### IO/FLOPs-Aware/Sparse Attention [模型层优化]
MQA ***
FlashAttention ***
GQA

### KV Cache Scheduling/Quantize/Dropping[系统层优化]
PagedAttention *** 
TensorRT-LLM KV Cache FP8

### Prompt/Context Compression[数据层优化]
Selective-Context
LLMLingua ***
LongLLMLingua ***

### Long Context Attention/KV Cache Optimization
RingAttention
KVQuant
RAGCache
KCache

### Parallel Decoding/Sampling[系统层优化]
Speculative Sampling ***


# 参考
### Awesome-LLM-Inference
10. [Awesome-LLM-Inference Repo](https://github.com/DefTruth/Awesome-LLM-Inference) git
1xx.  [[Awesome-LLM-Inference]🔥第三期：30篇，LLM推理论文集-500页PDF](https://zhuanlan.zhihu.com/p/669777159)
1xx.  [[Awesome-LLM-Inference]🔥第二期: 20篇，LLM推理论文集-300页PDF](https://zhuanlan.zhihu.com/p/658091768)
1xx.  [[LLM推理优化]🔥100+篇: 大模型推理各方向新发展整理](https://zhuanlan.zhihu.com/p/693680304) 