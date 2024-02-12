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

---

# LLaMA 分支[1]

| 项目                            | 描述                                                         | 数据集                                  |
| ------------------------------- | ------------------------------------------------------------ | --------------------------------------- |
| LLaMa                           | 基座模型                                                     | 公开可用的数据集(1T token)              |
| Stanford Alpaca                 | 结合英文语料通过Self Instruct方式微调LLaMA 7B                | Self Instruct from davinci-003 API(52K) |
| Vicuna-13B                      | 通过ShareGPT.com的7万条对话数据微调LLaMA(Alpaca基础之上, 多轮对话和长序列, full fine-tune) | 用户共享对话(70K sample)                |
| BELLE                           | 结合中文语料通过Self Instruct方式微调BLOOMZ-7B或LLaMA        |                                         |
| Chinese-LLaMA/Chinese-Alpaca    | 通过中文数据预训练/指令微调LLaMA                             |                                         |
| 姜子牙系列模型Ziya-LLaMA-13B-v1 | 基于LLaMA-13B的中英文模型                                    |                                         |
| ChatLLaMA(英文版)               | LLaMA的RLHF版                                                |                                         |
| ColossalChat                    | 通过self-instruct技术指令微调LLaMA且加上RLHF                 |                                         |



# 参考
### 分支
1. [LLaMA的解读与其微调：Alpaca-LoRA/Vicuna/BELLE/中文LLaMA/姜子牙/LLaMA 2](https://blog.csdn.net/v_JULY_v/article/details/129709105) ***
   1xx. [我想学大模型，应该从哪个模型开始？LLaMA生态家谱整理和分析 ](https://mp.weixin.qq.com/s?__biz=MzUyOTA5OTcwMg==&mid=2247485019&idx=1&sn=e3417472c0c1f98aede498fbe905e1a0&)
   1xx. [NLP（九）：LLaMA, Alpaca, ColossalChat 系列模型研究](https://zhuanlan.zhihu.com/p/618695885)
   1xx. https://github.com/www6v/Llama2-Chinese
   1xx.  [从0到1复现斯坦福羊驼（Stanford Alpaca 7B）](https://zhuanlan.zhihu.com/p/618321077) 
    GPUs: 8 卡 A800 80GB GPUs
   1xx. <<千帆增强版 Llama 2-提升大模型对话指令遵循能力>>    
   
### LLaMA
20. [[译][论文] LLaMA：开放和高效的基础语言模型集](http://arthurchiao.art/blog/llama-paper-zh/)
1xx. [第十五课：LLaMA](https://www.bilibili.com/video/BV1nN41157a9/)  *** 华为  V

### LLaMA2
30. [也谈凌晨刷屏的Llama2开源可商用模型：从其数据构造、模型架构和评估方式等方面的一些总结与发现 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401927&idx=1&sn=3dddcb5c1d8b3c246a8b7529502fdcf0)
31. [【对话引擎应用】千帆中文增强Llama2提升大模型对话指令遵循能力](https://www.bilibili.com/video/BV1qQ4y1t7Aj/)  百度
1xx. [Llama 2详解](https://zhuanlan.zhihu.com/p/649756898)  *** 
    [Llama 2 模型结构解析](https://www.bilibili.com/video/BV12h4y1N7C8/) *** V
1xx. [第十六课：LLaMA2](https://www.bilibili.com/video/BV1Me411z7ZV/) *** 华为  V
1xx. [[译][论文] LLaMA 2：开放基础和微调聊天模型](http://arthurchiao.art/blog/llama2-paper-zh/)
1xx. [Llama2技术细节&开源影响](https://zhuanlan.zhihu.com/p/644671690)
1xx. [再看Llama2的实际体验与民间评测：从现有公开在线测试地址到几个测试例子看初步效果分析 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401959&idx=1&sn=582fa45cd00035bac621336f47cce252)


1xx. [Llama中文社区](https://llama.family/)
2xx. [ Chinese-LLaMA-Alpaca](https://github.com/ymcui/Chinese-LLaMA-Alpaca) git



