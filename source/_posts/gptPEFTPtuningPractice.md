---
title: (实战)PEFT P-Tuning
date: 2024-01-28 19:04:02
tags:
  - PEFT
categories:
  - AIGC  
  - PEFT
---

<p></p>
<!-- more -->

### 最佳实践[1]
+ 要看losss, 也要看业务的loss
+ 生成模型常用的评价方法
  - BLEU 能评估流畅度
  - 结果都是流畅的前提下，ROUGE 反应参照句中多少内容被生成的句子包含（召回）  
+ 垂直模型
  - stf之后失去通用能力
  - 要有通用能力, 需要pre-train和STF中都融入通用的语料
+ 每个模型的学习率lr不一样
  - chatglm的学习率
    LR=2e-2

### 学习率
+ 改的特别大
  模型训练的时候会震荡
+ 改的特别小
   模型训练的时候会收敛非常慢

# 参考
1. [train_pt2.sh](https://github.com/www6v/fine-tuning-lab/blob/agiclass-v1/chatglm/train_pt2.sh) git   基于法律文本的chatglm的p-tuning
   [train_pt2.sh](https://github.com/www6v/fine-tuning-lab/blob/agiclass-v1/chatglm2/train_pt2.sh) git   基于法律文本的chatglm-2的P-tuning v2
   [十一、小参数量微调](https://github.com/www6v/fullStackLLM/blob/master/08-fine-tuning/peft/index.ipynb)
   bili有相关的总结的视频

