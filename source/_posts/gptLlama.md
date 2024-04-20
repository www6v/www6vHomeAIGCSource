---
title: LLaMA
date: 2023-01-01 19:35:09
tags:
  - LLaMA
categories:
  - AIGC  
  - LLaMA
---

<p></p>
<!-- more -->


## 目录
<!-- toc -->

# LLaMA 架构（Architecture）[20]

### 预归一化（Pre-normalization）：受 GPT3 启发

为了提高**训练稳定性**，我们对每个 Transformer sub-layer 的**输入**进行归一化，而不是对**输出**进行归一化。 这里使用由 Zhang 和 Sennrich（2019）提出的 RMSNorm 归一化函数。

### SwiGLU 激活函数：受 PaLM 启发

用 SwiGLU 激活函数替换 ReLU 非线性，该函数由 Shazeer（2020）提出，目的是**提升性能**。 但我们使用的维度是 `2/3 * 4d`，而不是 PaLM 中的 `4d`。

### 旋转嵌入（Rotary Embeddings）：受 GPTNeo 启发

去掉了绝对位置嵌入（absolute positional embeddings），并在每个网络层中添加旋转位置嵌入（rotary positional embeddings，RoPE）。 RoPE 由 Su 等（2021）提出。


# LLaMA2[1]
{% asset_img 'llama2.png' %}

###  训练的架构[30]

Llama2采用了Llama 1中的大部分预训练设置和模型架构。使用RMSNorm应用预归一化，使用SwiGLU激活函数和旋转位置嵌入。

具体的，使用AdamW优化器进行训练，使用余弦学习率方式来动态调整学习率，预热2000步，并将最终学习率衰减到峰值学习率的10%，并使用0.1的权重衰减和1.0的梯度裁剪。

与Llama 1的主要架构差异包括增加了**上下文长度【两倍关系】**和**分组查询关注(GQA)**。

分词器方面，使用与Llama 1相同的标记器，采用字节对编码(BPE)算法，使用sentencepece的实现。值得注意的是，**与Llama 1一样，将所有数字拆分为单个数字，并使用字节来分解未知的UTF-8字符。总词汇表大小为32k。**

### 与LLaMA主要区别：[31]
+ 更多的训练数据
   1.4T -> 2T
+ 更⻓的上下文窗口
   2k-> 4k
+ GQA技术
+ 完整的RLHF链条


# 参考
### LLaMA
20. [[译][论文] LLaMA：开放和高效的基础语言模型集](http://arthurchiao.art/blog/llama-paper-zh/)
1xx. [第十五课：LLaMA](https://www.bilibili.com/video/BV1nN41157a9/)  *** 华为  V
1xx. [Meta最新语言模型LLaMA论文研读：小参数+大数据的开放、高效基础语言模型阅读笔记 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648399298&idx=1&sn=dd83c4f42c68a89f8199f990e7570586)

### LLaMA2
30. [也谈凌晨刷屏的Llama2开源可商用模型：从其数据构造、模型架构和评估方式等方面的一些总结与发现 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401927&idx=1&sn=3dddcb5c1d8b3c246a8b7529502fdcf0)
31. [【对话引擎应用】千帆中文增强Llama2提升大模型对话指令遵循能力](https://www.bilibili.com/video/BV1qQ4y1t7Aj/)  百度
1xx. [Llama 2详解](https://zhuanlan.zhihu.com/p/649756898)  *** 
    [Llama 2 模型结构解析](https://www.bilibili.com/video/BV12h4y1N7C8/) *** V
1xx. [第十六课：LLaMA2](https://www.bilibili.com/video/BV1Me411z7ZV/) *** 华为  V
1xx. [[译][论文] LLaMA 2：开放基础和微调聊天模型](http://arthurchiao.art/blog/llama2-paper-zh/)
1xx. [Llama2技术细节&开源影响](https://zhuanlan.zhihu.com/p/644671690)
1xx. [再看Llama2的实际体验与民间评测：从现有公开在线测试地址到几个测试例子看初步效果分析 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401959&idx=1&sn=582fa45cd00035bac621336f47cce252)
1xx. [关于大模型行业问答落地的技术方案再思考：兼看Llama2中文汉化的成立性、实现路线以及代表项目](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648402689&idx=1&sn=a1847ea36cde32bd386f85f41cf197b9)

1xx. [Llama中文社区](https://llama.family/)



