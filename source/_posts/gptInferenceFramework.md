---
title: (实战)推理-框架
date: 2023-02-02 11:14:35
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



# 实战  lmdeploy-推理部署 [10]
### 模型转换
{% asset_img  'convert.png' %}
### TurboMind 推理+命令行本地对话
{% asset_img  'infer.png' %}
### TurboMind推理+API服务
+ 启动服务
{% asset_img  'infer-api.png' %}
+ Client访问服务
{% asset_img  'infer-api-client.png' %}

# 实战-vLLM推理部署[11]

# vLLM[2]
### page attention 
   memory sharing

# 参考
### 框架
1.1. [探秘LLM应用开发](https://mp.weixin.qq.com/mp/appmsgalbum?action=getalbum&__biz=MzA5MTIxNTY4MQ==&scene=1&album_id=2959126655292211206)   8-19

2. [VLLM ——高效GPU训练框架](https://www.bilibili.com/video/BV1cP41187wY/) V

1xx. [一文探秘LLM应用开发(18)-模型部署与推理(框架工具-Triton Server、RayLLM、OpenLLM)](https://mp.weixin.qq.com/s?__biz=MzA5MTIxNTY4MQ==&mid=2461142079&idx=1&sn=07d9033203c0064408fe0af33d1f9414)

1xx. [一文探秘LLM应用开发(16)-模型部署与推理(框架工具-TGI，vLLM，TensorRT-LLM，DS-MII) ](https://mp.weixin.qq.com/s?__biz=MzA5MTIxNTY4MQ==&mid=2461142012&idx=1&sn=dafb0b676cdf6d41fd9bd54f9b6a82d3)

1xx. [llm-action  inference](https://github.com/www6v/llm-action/tree/main/inference) git

1xx. [大模型推理框架概述](https://zhuanlan.zhihu.com/p/659792625)


### 实战
10. [lmdeploy 量化部署](https://github.com/InternLM/tutorial/blob/main/lmdeploy/lmdeploy.md)
      [(5)LMDeploy 大模型量化部署实践](https://www.bilibili.com/video/BV1iW4y1A77P/) V
   
11. [Atom-7B-Chat vllm推理部署](https://github.com/LlamaFamily/Llama2-Chinese/blob/main/inference-speed/GPU/vllm_example/README.md) 



1xx. [TensorRT-LLM保姆级教程（一）-快速入门](https://zhuanlan.zhihu.com/p/666849728)
1xx. [TensorRT-LLM保姆级教程（二）-离线环境搭建、模型量化及推理](https://zhuanlan.zhihu.com/p/667572720)
1xx. [TensorRT-LLM（持续更新）](https://zhuanlan.zhihu.com/p/669576221)
1xx. [模型推理服务化框架Triton保姆式教程（一）：快速入门](https://zhuanlan.zhihu.com/p/629336492)
1xx. [模型推理服务化框架Triton保姆式教程（二）：架构解析](https://zhuanlan.zhihu.com/p/634143650)
1xx. [模型推理服务化框架Triton保姆式教程（三）：开发实践](https://zhuanlan.zhihu.com/p/634444666)

