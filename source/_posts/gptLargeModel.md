---
title: 大模型 综述
date: 2022-10-30 19:10:21
tags:
  - 大模型
categories: 
  - AIGC
  - 大模型  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


# LLMs的背景[1]
### Scaling law of LLMs
+ KM scaling law
+ Chinchilla Scaling law

### LLMs的涌现能力
+ in-context learning
+ instruction following
+ step-by-step reasoning

### 大语言模型的关键技术 ***
+ Scaling
+ Training
+ Ability Eliciting
+ Alignment Tuning
+ Tool Manipulation

# Pre-training[1]
### 数据收集
### 架构
### 模型训练 ***
+ 优化设置
  - Batch Training
  - Learning Rate
  - Optimizer
  - Stabilizing the Training

+ 可扩展的训练技巧
  - 3D并行
    数据并行 +  流水线并行 + 张量并行
  - ZeRO
  - 混合精度训练
  - 总体训练建议

# Adaptation Tuning of LLMs[1]
### 指令调优 ***
### 对齐调优
### 高效调优


# 参考
### 综述
1. [大语言模型综述](http://aibox.ruc.edu.cn/docs/2023-08/cb9badcb213f4c8b89d00d579eed4a4c.pdf) 中文  v10 
     [大语言模型综述](https://github.com/RUCAIBox/LLMSurvey/blob/main/assets/LLM_Survey_Chinese.pdf) 中文
     [A Survey of Large Language Models](https://arxiv.org/pdf/2303.18223.pdf) 英文
     [LLMSurvey](https://github.com/www6v/LLMSurvey)  github
     [[论文]大语言模型综述](https://zhuanlan.zhihu.com/p/630203554) 

1xx. [[译][论文] 大语言模型（LLM）综述与实用指南（Amazon，2023）](http://arthurchiao.art/blog/llm-practical-guide-zh/)   实战  未
1xx. [通向AGI之路：大型语言模型（LLM）技术精要](https://zhuanlan.zhihu.com/p/597586623) *** 
1xx. [[Transformer 101系列] 初探LLM基座模型](https://zhuanlan.zhihu.com/p/640784855)   
1xx. [LLM从0开始预训练系列：2、大模型技术报告总结（GPT/PaLM/GLM/LLaMA/Skywork）](https://zhuanlan.zhihu.com/p/664046612) 

1xx. [高效大语言模型：综述](https://zhuanlan.zhihu.com/p/671710012)  *** 大模型各个维度的优化
1xx. [必看的十二个大模型前沿综述：兼论HALO大模型幻觉检测与缓解方案及Google小模型预测大模型训练不稳定的探索 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403847&idx=1&sn=9af731e9f8418a2d869f5464530c8bd6) 12个综述