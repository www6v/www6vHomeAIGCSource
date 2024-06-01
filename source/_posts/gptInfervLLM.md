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
### Llama-Chinese on vLLM[11]
+ vLLM异步推理
+ 流式返回

### Qwen on vLLM[12]
+ vLLM异步推理
+ 流式返回

### Qwen on vLLM[13]
+ 离线推理   

+ 适配OpenAI-API的API服务

  ```shell
  python -m vllm.entrypoints.openai.api_server \
      --model Qwen/Qwen1.5-7B-Chat
  ```

+ 多卡推理
  传递参数 `--tensor-parallel-size` 来运行多GPU服务
  
+ 量化推理
  在运行服务时添加 `--quantization` 参数


# 参考
### 原理
1. [VLLM ——高效GPU训练框架](https://www.bilibili.com/video/BV1cP41187wY/)  V
2. [vllm](https://github.com/vllm-project/vllm) git
3. [vLLM](https://www.hopsworks.ai/dictionary/vllm)
4. [vLLM: Easy, Fast, and Cheap LLM Serving with PagedAttention](https://blog.vllm.ai/2023/06/20/vllm.html)   看动图


### 实战
11. [Llama-Chinese Repo](https://github.com/LlamaFamily/Llama-Chinese/blob/main/inference-speed/GPU/vllm_example/api_server.py) git
12. [qwen-vllm Repo](https://github.com/owenliang/qwen-vllm/blob/master/vllm_server.py) git
    [Qwen（通义千问） Repo](https://github.com/QwenLM/Qwen/blob/main/README_CN.md#%E9%83%A8%E7%BD%B2)  git
13. [qwen doc](https://qwen.readthedocs.io/zh-cn/latest/deployment/vllm.html)
    
### 源代码
1xx.[VLLM推理流程梳理](https://blog.csdn.net/just_sort/article/details/132115735)
1xx. [LLM 高速推理框架 vLLM 源代码分析 / vLLM Source Code Analysis](https://zhuanlan.zhihu.com/p/641999400) *** 
1xx. [vLLM源码阅读s2——是如何进行离线推理的](https://www.bilibili.com/video/BV1qE42157Rn/) V
