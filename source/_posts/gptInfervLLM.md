---
title: (原理)推理 vLLM
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

# continuous batching[10.1]
### 朴素批处理 / 静态批处理
![朴素批处理 / 静态批处理](https://images.ctfassets.net/xjan103pcp94/1LJioEsEdQQpDCxYNWirU6/82b9fbfc5b78b10c1d4508b60e72fdcf/cb_02_diagram-static-batching.png)

### 连续批处理
![连续批处理](https://images.ctfassets.net/xjan103pcp94/744TAv4dJIQqeHcEaz5lko/b823cc2d92bbb0d82eb252901e1dce6d/cb_03_diagram-continuous-batching.png)

# 参考
### 原理
1. [VLLM ——高效GPU训练框架](https://www.bilibili.com/video/BV1cP41187wY/)  V
2. [vllm](https://github.com/vllm-project/vllm) git
3. [vLLM](https://www.hopsworks.ai/dictionary/vllm)
4. [vLLM: Easy, Fast, and Cheap LLM Serving with PagedAttention](https://blog.vllm.ai/2023/06/20/vllm.html)   看动图

### continuous batching
10. [How continuous batching enables 23x throughput in LLM inference while reducing p50 latency](https://www.anyscale.com/blog/continuous-batching-llm-inference)
   10.1. [如何通过连续批处理(continuous batching)将LLM推理吞吐量提升23倍，同时减少延迟](https://juejin.cn/post/7277917295271723048) ***
   [continuous batching在LLM推理中的意义](https://zhuanlan.zhihu.com/p/652165071) ***
   [Continuous Batching：一种提升 LLM 部署吞吐量的利器](https://mp.weixin.qq.com/s/bs3puOXFZYg5K-zfyDfpOw) *
   [Continuous Batching：解锁LLM潜力！让LLM推断速度飙升23倍，降低延迟！](https://zhuanlan.zhihu.com/p/655700809) QA
   [vllm_example  Repo](https://github.com/ray-project/ray/blob/cc983fc3e64c1ba215e981a43dd0119c03c74ff1/doc/source/serve/doc_code/vllm_example.py) git
   [llm-continuous-batching-benchmarks Repo](https://github.com/anyscale/llm-continuous-batching-benchmarks) git

1xx. [大模型推理核心技术：Continuous Batching详解](https://blog.csdn.net/qq_27590277/article/details/135710435)

1xx. [从continuous batching到vLLM中的batching](https://zhuanlan.zhihu.com/p/688551989)