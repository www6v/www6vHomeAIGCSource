---
title: (原理|实战)推理 TensorRT-LLM
date: 2023-06-02 21:59:23
tags:
  - infer
categories: 
  - AIGC
  - infer 
---

<p></p>
<!-- more -->


## 目录
<!-- toc -->

# TensorRT-LLM
### key features [2]
+ Flash Attention
+ MHA/MQA/GQA
+ **Quantization**
  - Weight-Only
  - SmoothQuant
  - **GPTQ**
  - **AWQ**
  - FP8
+ Paged **KV Cache** for the Attention
+ Multi-GPU Multi-Node
+ **TP(Tensor Parallelism)/PP(Pipeline Parallelism)**
+ In-flight **Batching**

# TensorRT-LLM 推理部署
[基于docker的部署]

# Triton 推理部署
[基于k8s的部署]

# 参考
### 原理
2. [TensorRT-LLM](https://github.com/NVIDIA/TensorRT-LLM/) git


### 实战
1xx. [TensorRT-LLM保姆级教程（一）-快速入门](https://zhuanlan.zhihu.com/p/666849728)
1xx. [TensorRT-LLM保姆级教程（二）-离线环境搭建、模型量化及推理](https://zhuanlan.zhihu.com/p/667572720)
1xx. [TensorRT-LLM（持续更新）](https://zhuanlan.zhihu.com/p/669576221)

1xx. [模型推理服务化框架Triton保姆式教程（一）：快速入门](https://zhuanlan.zhihu.com/p/629336492)
1xx. [模型推理服务化框架Triton保姆式教程（二）：架构解析](https://zhuanlan.zhihu.com/p/634143650)
1xx. [模型推理服务化框架Triton保姆式教程（三）：开发实践](https://zhuanlan.zhihu.com/p/634444666)
