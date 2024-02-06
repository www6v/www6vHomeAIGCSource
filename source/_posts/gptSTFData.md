---
title:  STF 数据
date: 2023-02-06 19:04:41
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

# STF 数据组合[1]
《HOW ABILITIES IN LARGE LANGUAGE MODELS ARE AFFECTED BY SUPERVISED FINE-TUNING DATA COM- POSITION》
### 问题
1、推理、编码和通用能力如何随SFT数据量而变化？
2、在SFT中结合三种能力时是否存在性能冲突？
3、导致性能冲突的关键因素是什么？
4、不同的SFT策略对组合数据有什么影响？

### 实验结果
1、不同的能力表现出不同的扩展模式，在数据量相同的情况下，较大的模型通常表现出更优越的性能。
2、随着数据量的持续增加，数学推理和代码生成能力也在不断提高，一般能力则是在样本数达到一千左右时才得到提升，且提升速度较慢。
3、在数据量较低的情况下，数据组合会带来各种能力的提高，而在数据量较高的情况下，能力则会发生冲突。
4、组成数据量会影响性能，而组成比例的影响则微乎其微。


# SFT数据集
[开源SFT数据集整理](https://github.com/chaoswork/sft_datasets)

# 参考
1. [SFT微调的数据组合及训练策略如何影响大模型性能：4个经典问题及实验结论分享 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404728&idx=2&sn=1cb2203648271720d421c963ebcc03b3)