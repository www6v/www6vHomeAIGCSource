---
title: 推理 Ray 
date: 2023-06-16 16:17:44
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

# 实战
### 环境
modelscope  GPU

### 实战1
+ 脚本[1]

+ 遇到的异常[2]

### 实战2
+ 脚本
``` shell
### 变更模型名字

### import 'modelscope' package


```

+ 异常[11]

### 实战3[20]
+ 脚本
vllm   0.2.3 -> 报异常
vllm  0.3.3 -> 报另一个异常


### 实战4
+ 脚本 [30]

+ 异常 [31]
```
# 运行这个命令报异常
python -m vllm.entrypoints.openai.api_server --trust-remote-code --served-model-name gpt-4 --model mistralai/Mixtral-8x7B-Instruct-v0.1 --gpu-memory-utilization 1 --tensor-parallel-size 8 --port 8000

```

# monitor[40]
### Ray Dashboard[41]
### Ray logging
Loki  grafana
### Built-in Ray Serve metrics
Prometheus 

# 参考
### 实战1
1. [Serve a Large Language Model with vLLM](https://docs.ray.io/en/master/serve/tutorials/vllm-example.html)

2. [Invalid device id when using pytorch dataparallel！](https://stackoverflow.com/questions/60750288/invalid-device-id-when-using-pytorch-dataparallel)  运行时碰到的异常

### 实战2
10. [examples/offline_inference_distributed.py](https://github.com/vllm-project/vllm/blob/main/examples/offline_inference_distributed.py)

11. [报错:RuntimeError: CUDA error: no kernel image is available for execution on the device](https://blog.csdn.net/zh515858237/article/details/135262401)

### 实战3
20. [Ray vLLM Interence](https://github.com/asprenger/ray_vllm_inference)


1xx. [GitHub - ray-project/langchain-ray: Examples on how to use LangChain and Ray](https://github.com/ray-project/langchain-ray/tree/main) git

### 实战4
30. [在甲骨文云上用 Ray +Vllm 部署 Mixtral 8*7B 模型_mixtral 8x7b 部署-CSDN博客](https://blog.csdn.net/engchina/article/details/135455197)

31. [报错:RuntimeError: CUDA error: no kernel image is available for execution on the device-CSDN博客](https://blog.csdn.net/zh515858237/article/details/135262401)

### monitor
40. [Monitor Your Application](https://docs.ray.io/en/master/serve/monitoring.html)

41. [Ray Dashboard ](https://docs.ray.io/en/master/ray-observability/getting-started.html)