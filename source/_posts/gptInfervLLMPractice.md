---
title: (实战)推理 vLLM 
date: 2023-06-12 14:19:45
tags:
  - infer
categories: 
  - AIGC
  - infer 
---

<p></p>
<!-- more -->

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
### 实战
11. [Llama-Chinese Repo](https://github.com/LlamaFamily/Llama-Chinese/blob/main/inference-speed/GPU/vllm_example/api_server.py) git
12. [qwen-vllm Repo](https://github.com/owenliang/qwen-vllm/blob/master/vllm_server.py) git
    [Qwen（通义千问） Repo](https://github.com/QwenLM/Qwen/blob/main/README_CN.md#%E9%83%A8%E7%BD%B2)  git
13. [qwen doc](https://qwen.readthedocs.io/zh-cn/latest/deployment/vllm.html)
    
### 源代码
1xx.[VLLM推理流程梳理](https://blog.csdn.net/just_sort/article/details/132115735)
1xx. [LLM 高速推理框架 vLLM 源代码分析 / vLLM Source Code Analysis](https://zhuanlan.zhihu.com/p/641999400) *** 
1xx. [vLLM源码阅读s2——是如何进行离线推理的](https://www.bilibili.com/video/BV1qE42157Rn/) V
