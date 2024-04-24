---
title:  (原理)SFT 数据集
date: 2023-02-06 19:04:41
tags:
  - SFT
categories:
  - AIGC  
  - SFT
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 论文
+ 论文地址
 《HOW ABILITIES IN LARGE LANGUAGE MODELS ARE AFFECTED BY SUPERVISED FINE-TUNING DATA COM- POSITION》
  keyword: SFT 数据组合
  
# 问题[1]
1、推理、编码和通用能力如何随SFT数据量而变化？
2、在SFT中结合三种能力时是否存在性能冲突？
3、导致性能冲突的关键因素是什么？
4、不同的SFT策略对组合数据有什么影响？

# 实验结果[1]
1、不同的能力表现出不同的扩展模式，在数据量相同的情况下，较大的模型通常表现出更优越的性能。
2、随着数据量的持续增加，数学推理和代码生成能力也在不断提高，一般能力则是在样本数达到一千左右时才得到提升，且提升速度较慢。
3、在数据量较低的情况下，数据组合会带来各种能力的提高，而在数据量较高的情况下，能力则会发生冲突。
4、组成数据量会影响性能，而组成比例的影响则微乎其微。


# 参考
1. [SFT微调的数据组合及训练策略如何影响大模型性能：4个经典问题及实验结论分享 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648404728&idx=2&sn=1cb2203648271720d421c963ebcc03b3)

1xx. [再看大模型微调与应用：3大行业18个开源垂直微调模型、微调数据、工具资源及有趣的AIGC应用集合](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401381&idx=1&sn=c24d896aab990ffdf30107a7c6c1ea4f) 二 三

1xx. [也谈大模型研发中的微调数据规模评估与质量问题：数据规模大小的影响评估、数据主要问题及清洗项目](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648400009&idx=1&sn=f72c0a9cb7c19184995156c3ef169b74)

1xx. [也谈微调数据质量、多样性规模对大模型性能的影响与评估方案：Belle项目开源实验工作报告介绍 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648400342&idx=1&sn=d344ced5035fc804f490b00469746fc8)