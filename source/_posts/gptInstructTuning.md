---
title: Instruct Tuning
date: 2024-01-06 19:09:20
tags:
  - Instruct-Tuning
categories: 
  - AIGC
  - Instruct-Tuning  
---

<p></p>
<!-- more -->

# In Context Learning ( ICL ) 上下文学习
{% asset_img 'ICL.webp' %}

+ **in context learning**，大意是在**prompt learning的基础上，将少量有标签样本融入prompt**。
+ 上图的ICL模型可以理解成**有监督、无训练**的**小样本学习**。
+ 但**并非所有ICL都不训练**。比如下图右上角的**FLAN**就是用instruction tuning**训练参数**的。

{% asset_img 'ICL-tech.webp' %}
+ **FLAN**，**既属于 in context learning，也属于 instruction learning**


# Instruction Learning
###  Instruct Tuning-FLAN

### instructGPT

### chatGPT 

# 参考
[第九课：Instruct Tuning](https://www.bilibili.com/video/BV1cm4y1e7Cc/) *** V
[FLANv2：大模型指令微调必看论文](https://zhuanlan.zhihu.com/p/646136859) 
[June 2023, A Stage Review of Instruction Tuning](https://yaofu.notion.site/June-2023-A-Stage-Review-of-Instruction-Tuning-f59dbfc36e2d4e12a33443bd6b2012c2)
[各种tuning的简单逻辑解释](https://zhuanlan.zhihu.com/p/619406727)