---
title: (原理)RAG Baichuan案例
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

# 总结[2]

1. **多轮问答等场景的召回和传统搜索引擎的召回分布还不太一样。**百川借助子问题检索效果更高的特点，对原始复杂问题进行拆解、拓展来解决复杂问题检索质量偏差的问题。
2. **对于没见过的语料直接用向量检索的结果可能不太理想。**百川在大量语料上利用无监督方法训练embedding模型来优化效果。而行业大模型更倾向于私有的数据，要提升私有数据的训练效果还得继续在私有化数据上训练效果会更佳。
3. **Query拓展 + 多路召回 + Rerank + self-Critique可能是现阶段比较好的一种RAG方式，但是其也会带来更多成本。**总体思路有点像ReAct[3]系列的进阶版本，其在搜索侧和答案修正侧都做了更多的一些工作来优化实际效果。其缺点是需要多次调用大模型，会带来额外的成本，真实线上是否采用这种策略还有待验证。

# 参考

1. [大模型RAG问答行业最佳案例及微调、推理双阶段实现模式：基于模块化(Modular)RAG自定义RAG Flow](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648407638&idx=1&sn=5c167b4a11bc483f5790ef1e0340d670)

2. [百川智能RAG方案总结：搜索出生的百川智能大模型RAG爬坑之路](https://zhuanlan.zhihu.com/p/675770700)

1xx. [LLM/百川Baichuan2-53B搜索增强-开放API](https://zhuanlan.zhihu.com/p/658469464)


1xx. [大模型+搜索构建完整技术栈，百川智能用搜索增强给企业定制化下了一剂「猛药」](https://mp.weixin.qq.com/s?__biz=MzA3MzI4MjgzMw==&mid=2650901201&idx=1&sn=3a9bd61403fb4b024ec5d8c128990495)

1xx. [百川智能RAG方案总结：搜索出生的百川智能大模型RAG爬坑之路](https://blog.csdn.net/qq_27590277/article/details/135421245)
