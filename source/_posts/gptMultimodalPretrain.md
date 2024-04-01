---
title: (原理)多模态预训练 概述
date: 2023-03-04 13:23:20
tags:
  - multimodal
categories:
  - AIGC  
  - multimodal
---

<p></p>
<!-- more -->



## 目录
<!-- toc -->

# Overview
{% asset_img  'overview.png' %}


# 多模态预训练
##  数据集
+ 大规模无标注
+ 内容杂  噪音多

## 架构Transformer
+ 基于transformer encoder-理解任务
单流 - vl-bert  UNITER
双流 - ViLBERT， CLIP（双流结构，对比学习）

+  基于transformer decoder-生成任务
DALL-E  （VQVAE+GPT,  Text-to-Image Generation）
现在都用 → SD 扩散模型

+  基于encoder+decoder-理解+生成
文本的decoder
1. encoder + decoder 串行,  交叉注意力
2. encoder + decoder 并行

## 模型 - 自监督学习

+ 模态内掩码学习
文本 语音 视觉自身token级别mask

+ 模态间掩码学习
不同模态信息的相互预测
mask视觉， 输出对应文本

+ 模态间匹配学习
匹配与否的分类问题 - 正负样本(二分类)
对比学习 - 模态间的图文匹配对

# 下游任务
## 多模态下游任务-模型微调

+ 模型微调
  - p+ finetune（全参数）
  - p+ prompt-tuning
  - p+ adaptor-tuning
  - p+ lora

+ 多模态下游任务
  + 理解： text/audio/visual 内容生成
  + 生成： 跨模态 检索/问答/推理


# 更大更强的多模态预训练模型
+ **强大的语言模型**
+ 更大的视觉模型
+ 更大规模的预训练数据
+ 更多模态形式的数据

# 参考
1. [中科院刘静：多模态预训练的进展回顾与展望](https://www.bilibili.com/video/BV13P411q7tH/)  V

1xx. [MiniGPT4Qwen](https://github.com/Coobiw/MiniGPT4Qwen) git
[多模态大模型实战-MiniGPT4Qwen系列1：3090+2小时+通义千问=个人版双语多模态大模型](https://zhuanlan.zhihu.com/p/664612306)
