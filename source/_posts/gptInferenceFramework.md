---
title: 推理-框架
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



# lmdeploy-推理实战 [3]
### 模型转换
{% asset_img  'convert.png' %}
### TurboMind 推理+命令行本地对话
{% asset_img  'infer.png' %}
### TurboMind推理+API服务
+ 启动服务
{% asset_img  'infer-api.png' %}
+ Client访问服务
{% asset_img  'infer-api-client.png' %}

# 参考
### 框架
1.1. [探秘LLM应用开发](https://mp.weixin.qq.com/mp/appmsgalbum?action=getalbum&__biz=MzA5MTIxNTY4MQ==&scene=1&album_id=2959126655292211206)   8-19

1xx. https://github.com/www6v/llm-action/tree/main/inference
1xx. https://www.zhihu.com/question/625415776/answer/3243562246


### 实战
3. [lmdeploy 量化部署](https://github.com/InternLM/tutorial/blob/main/lmdeploy/lmdeploy.md)
   [(5)LMDeploy 大模型量化部署实践](https://www.bilibili.com/video/BV1iW4y1A77P/) V
   

1xx. [TensorRT-LLM保姆级教程（一）-快速入门](https://zhuanlan.zhihu.com/p/666849728)
1xx. [TensorRT-LLM保姆级教程（二）-离线环境搭建、模型量化及推理](https://zhuanlan.zhihu.com/p/667572720)
1xx. [TensorRT-LLM（持续更新）](https://zhuanlan.zhihu.com/p/669576221)
1xx. [模型推理服务化框架Triton保姆式教程（一）：快速入门](https://zhuanlan.zhihu.com/p/629336492)
1xx. [模型推理服务化框架Triton保姆式教程（二）：架构解析](https://zhuanlan.zhihu.com/p/634143650)
1xx. [模型推理服务化框架Triton保姆式教程（三）：开发实践](https://zhuanlan.zhihu.com/p/634444666)

