---
title: (多样 复杂)Wizard
date: 2023-03-18 18:57:23
tags:
  - dataProcess
categories: 
  - AIGC
  - dataProcess   
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# Wizard 方法
### 自动指令数据进化 [1]
1）指令进化
  + In-Depth Evolving 提示 [深度]
    + 五种类型的提示来增强指令
      增加约束 + 深化 + 具体化 + 增加推理步骤 + 复杂化输入
    + 核心部分
      **In-Depth Evolving的提示的核心部分是 "你的目标是将一个给定的提示改写成更复杂的版本，使那些著名的人工智能系统（如ChatGPT和GPT4）更难处理。但改写后的提示必须是合理的，能被人理解，并能被人回应"**
   + In-Breadth Evolving提示 [广度]
     + 目的
       旨在提高**主题覆盖率**、**技能覆盖率**和整体数据集的**多样性**
     

2）响应生成

3）消除进化
   即过滤未能进化的指令


# LIMA [2]
当扩大数据量而不同时扩大提示多样性时，收益会大大减少，而在优化数据质量时，收益会大大增加。

# 参考
###   质量-> 多样性, 复杂度
1. [如何构造复杂多样的微调指令数据：WizardLM复杂指令构造思想与实验分析工作总结 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401462&idx=1&sn=764f0302918174cea29ae22ac5760033) 
    [WizardLM](https://github.com/nlpxucan/WizardLM) git 

2. [大模型微调究竟需要多少数据：从三个现有代表工作看几组结论及一点思考 ](https://mp.weixin.qq.com/s/c50HrOfKOqgqGPVRHf6EpA)
     **指令格式的多样性**
     《LIMA: Less Is More for Alignment》
     《MAYBE ONLY 0.5% DATA IS NEEDED》

1xx. [【论文笔记】LIMA: Less Is More for Alignment](https://blog.csdn.net/jinniulema/article/details/133915276)