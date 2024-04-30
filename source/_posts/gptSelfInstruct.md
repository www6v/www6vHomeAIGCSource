---
title: (原理)SELF-INSTRUCT, Self-QA
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

# Self-QA[3]
### 思想
知识引导的指令生成Knowledge-Guided Instruction Generation

### 指令生成阶段
+ 采用语言模型本身来根据无监督的文本生成指令。这种方法使生成的指令具有领域针对性，并与所提供的无监督文本的内容相关。
  - 非结构化的知识，如网页和书籍数据，直接使用。
  - **结构化数据**，如表格和知识图谱，在被利用之前需要**转换为非结构化文本数据**。如通过使用模板填充槽或将每个数据条目与相应的属性名称连接起来来实现。


### 指令答案生成阶段
+ 将**生成的指令问题**让大模型进行预测，**生成答案**


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

