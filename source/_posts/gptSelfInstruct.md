---
title: (原理)SELF-INSTRUCT
date: 2023-02-21 14:21:23
tags:
  - STF
categories:
  - AIGC  
  - STF
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# SELF-INSTRUCT 
### 自动指令数据生成[1]
{% asset_img  'selfInstruct.jpg' %}
1）指令生成
2）识别指令是否代表分类任务
3）用输入优先或输出优先的方法生成实例
4）过滤低质量数据

+ 实现步骤[3]
  - 人工设计175个表示不同任务的指令，并且给每条数据都编写了（指令, 输入, 输出）/（指令, 输出），将这175条数据作为种子池。
  - 使用模型生成新的指令；
  - 对该模型生成的指令判断是否分类任务；
  - 使用模型生成实例；
  - 对上述模型生成的数据进行过滤和后处理；
  - 将经过过滤和后处理的数据添加到种子池中；
  - 一直重复上述2到6步直到种子池有足够多的数据；

# 参考
1. [面向大模型微调的instruction指令自动化生成技术：SELF-INSTRUCT指令自动化生成框架工作介绍](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648399792&idx=1&sn=c70e1d13b68399b0c19cfbf658f35d77)

2. [Stanford Alpaca](https://www.bilibili.com/video/BV1nQ4y1A7Po) V
   [stanford_alpaca generate_instruction](https://github.com/www6v/stanford_alpaca/blob/main/generate_instruction.py) git

3. 《第二章 大模型训练与微调研发背后的数据艺术》 LLM大语言模型算法特训  那位科技 *** 
    **SELF-INSTRUCT**， Baize， **Evol-instruct**， **Self-QA**， Ultra-chat
    

1xx. [大模型SFT微调指令数据的生成](https://zhuanlan.zhihu.com/p/650596719)
   SELF-INSTRUCT， Wizard， Backtranslation

1xx. [让ChatGPT生成训练ChatGPT的训练数据](https://zhuanlan.zhihu.com/p/618334308)
   BELLE

1xx. [self-instruct](https://github.com/yizhongw/self-instruct/) git

