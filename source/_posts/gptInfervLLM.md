---
title: (原理|实战)推理 vLLM
date: 2023-05-31 22:24:07
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

# Key features [2]

+ **page attention**[1] 
   memory sharing
+  Continuous **batching** of incoming requests
+ Quantization: 
   - **GPTQ**
   - **AWQ**
   - SqueezeLLM
   - **FP8 KV Cache**

# Architecture[3]
![Architecture](https://cdn.prod.website-files.com/618399cd49d125734c8dec95/663e103a10d15c2ecfd84ac9_K3J79pEM-PAXQiK8DfT2YlotBhcZeLy-UFqhja4dFMDp4478X1tfCGnEgWDkNAMIOMXQvCVo_5EWsVspC07wSLaD4T3n_oqCf3i8mdFFcV1uDCbcmD0-thbwVdbcpTA41teD8ErJxi3jTIrXZsAjcm4.png)



# PagedAttention[4]
![PagedAttention: KV Cache are partitioned into blocks. Blocks do not need to be contiguous in memory space. ](https://blog.vllm.ai/assets/figures/annimation0.gif)

![Example generation process for a request with PagedAttention. ](https://blog.vllm.ai/assets/figures/annimation1.gif)


# 实战
### vLLM 推理部署[11]

# 参考
### 原理
1. [VLLM ——高效GPU训练框架](https://www.bilibili.com/video/BV1cP41187wY/)  V
2. [vllm](https://github.com/vllm-project/vllm) git
3. [vLLM](https://www.hopsworks.ai/dictionary/vllm)
4. [vLLM: Easy, Fast, and Cheap LLM Serving with PagedAttention](https://blog.vllm.ai/2023/06/20/vllm.html)   看动图


### 实战
11. [Atom-7B-Chat vllm推理部署](https://github.com/LlamaFamily/Llama2-Chinese/blob/main/inference-speed/GPU/vllm_example/README.md) 
