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


# LLaMA2[1]
{% asset_img 'llama2.png' %}


# 参考
### 分支
1. [LLaMA的解读与其微调：Alpaca-LoRA/Vicuna/BELLE/中文LLaMA/姜子牙/LLaMA 2](https://blog.csdn.net/v_JULY_v/article/details/129709105) ***
1xx. [我想学大模型，应该从哪个模型开始？LLaMA生态家谱整理和分析 ](https://mp.weixin.qq.com/s?__biz=MzUyOTA5OTcwMg==&mid=2247485019&idx=1&sn=e3417472c0c1f98aede498fbe905e1a0&)
1xx. [NLP（九）：LLaMA, Alpaca, ColossalChat 系列模型研究](https://zhuanlan.zhihu.com/p/618695885)
1xx. https://github.com/www6v/Llama2-Chinese
1xx. <<千帆增强版 Llama 2-提升大模型对话指令遵循能力>>

### 基座
1xx. [Llama 2详解](https://zhuanlan.zhihu.com/p/649756898)  *** 
    [Llama 2 模型结构解析](https://www.bilibili.com/video/BV12h4y1N7C8/) *** V
1xx. [第十五课：LLaMA](https://www.bilibili.com/video/BV1nN41157a9/)  *** 华为  V
1xx. [第十六课：LLaMA2](https://www.bilibili.com/video/BV1Me411z7ZV/) *** 华为  V
1xx. [[译][论文] LLaMA：开放和高效的基础语言模型集](http://arthurchiao.art/blog/llama-paper-zh/)
1xx. [[译][论文] LLaMA 2：开放基础和微调聊天模型](http://arthurchiao.art/blog/llama2-paper-zh/)
1xx.  [从0到1复现斯坦福羊驼（Stanford Alpaca 7B）](https://zhuanlan.zhihu.com/p/618321077) 
    GPUs: 8 卡 A800 80GB GPUs
1xx. [Llama2技术细节&开源影响](https://zhuanlan.zhihu.com/p/644671690)


1xx. [Llama中文社区](https://llama.family/)
2xx. [ Chinese-LLaMA-Alpaca](https://github.com/ymcui/Chinese-LLaMA-Alpaca) git



