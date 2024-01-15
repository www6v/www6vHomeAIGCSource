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
### 模型压缩 [2.1]
剪枝（Pruning）
知识蒸馏（Knowledge Distillation，KD）
量化（Quantization）
低秩分解（Low-Rank Factorization）

# 参考
### 框架
1.1. [探秘LLM应用开发](https://mp.weixin.qq.com/mp/appmsgalbum?action=getalbum&__biz=MzA5MTIxNTY4MQ==&scene=1&album_id=2959126655292211206)   8-19

100. https://github.com/www6v/llm-action/tree/main/inference
101. https://www.zhihu.com/question/625415776/answer/3243562246

### 优化
2.1. [一文探秘LLM应用开发(13)-模型部署与推理(优化理论) ](https://mp.weixin.qq.com/s/glPPSqHjsnDjC0DZSuuPzA) 
102. https://lilianweng.github.io/posts/2023-01-10-inference-optimization/

