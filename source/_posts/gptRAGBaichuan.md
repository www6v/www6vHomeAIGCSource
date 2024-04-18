---
title: RAG Baichuan案例
date: 2023-04-18 14:26:22
tags:
  - RAG
categories: 
  - AIGC
  - RAG  
---

<p></p>
<!-- more -->

# Baichuan RAG[1]
+ 借鉴了Meta的CoVe技术
+ 自研的TSF（Think-Step Further)技术
  猜测其本质应该是对Step-back prompting方法的改良
+ 自研了Baichuan-Text-Embedding向量模型 
+ 混合检索
  向量检索与稀疏检索并行的
+ self-Critique

# 参考
1. [大模型RAG问答行业最佳案例及微调、推理双阶段实现模式：基于模块化(Modular)RAG自定义RAG Flow](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648407638&idx=1&sn=5c167b4a11bc483f5790ef1e0340d670)

1xx. [大模型+搜索构建完整技术栈，百川智能用搜索增强给企业定制化下了一剂「猛药」](https://mp.weixin.qq.com/s?__biz=MzA3MzI4MjgzMw==&mid=2650901201&idx=1&sn=3a9bd61403fb4b024ec5d8c128990495)



1xx. [百川智能RAG方案总结：搜索出生的百川智能大模型RAG爬坑之路](https://blog.csdn.net/qq_27590277/article/details/135421245)
