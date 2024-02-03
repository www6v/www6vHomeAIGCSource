---
title: 涌现现象（Emergent） 
date: 2023-02-03 22:11:09
tags:
  - Emergent
categories: 
  - AIGC
  - Emergent  
---

<p></p>
<!-- more -->


# Emergent Abilities
  - 🔗 文章：Emergent Abilities of Large Language Models  (2022.10)  (arxiv.org)
  - 🔑关键词和摘要
    - Keywords: LLMs, Emergent Ability, Scaling
    - abstract
      - 不可预测
      - 不能从小模型的的性能外推
      - 是否能通过继续扩大模型规模来获得更多涌现能力
  - ⚙️研究设计和结论
    - 定义
      - 通常的涌现现象
      - 大模型的涌现现象
        - 小模型接近随机
        - **大模型突然出现**
        - 相变
      - 实验框架
        - performance vs 1. FLOPs, model parameters
        - [X] Training datasets
        - 叠甲：emergent 与很多因素都有关，本文并不是说到哪个 scale 就会出现 emergent，而是说 emergent 现象普遍存在。
      - 实验1
        - Few-shot Prompting
        - 测试数据说明:
          - A: 三位数加法，两位数乘法
          - B: [dɪfərənt], 复原 "different," 
          - C: 从 e l h l o 复原 hello
          - D: 波斯语问答
          - E: 针对GPT-3 对抗标的问答
          - ...
        - 结果
          - 这些 task，以 few-shot 形式展示过以后，都有 emergent
          - 不同模型 emergent scale 不一样
          - 有的 task，只有 540B 的 PaLM  emerge了
      - 实验2
        - 增强语言模型能力的 emerge 现象
        - 已知的一些大模型技巧在何种规模下发挥作用？
          - 大模型技巧
            - 思维链 Chain-of-thought: Let's think step by step.
            - 指令微调 请写一段XXX的描述
            - 草稿本方法： 计算 15+16, 让模型在草稿本上写“5+6=11，进位1”
        - 这些增强语言模型能力的方法都有一定程度的涌现
        - 联想：之前的 prompt tuning，parameter efficient tuning，都是某种随着模型规模扩大的涌现？
    - 讨论
      - **Emergent 现象的解释**
        - **多步能力说**
          - 每个子能力达到 90%  -> 一无是处
          - 每个子能力达到 95% -> 能完成一些任务了
        - 指标缺陷说
        - 奇怪的现象：交叉熵损失不是 emergent 的，而是在逐步下降
      - **Emergent 的阈值可能会越来越小**
        - 更干净的数据，更好的训练技巧，更优秀的模型结构都可以是  Emergent阈值变小
      - 未来方向：
        - 继续扩大 model scale，远未达到上限
        - 一些新结构的 scaling
        - 数据的 scaling
        - 理解 prompt 机制
        - 更前沿的 task，用来指导 emergent
        - 理解 emergence
  - 📚论文贡献
    - 优点
      - 第一次正式提出 emergent 实验
      - **做了充分的实验表明该现象在各种数据集上广泛存在**
      - 甚至验证了一些“方法”的涌现
      - 提出了一些解释该现象的观点，并提出质疑
    - 改进点
      - **还是不知道为啥 emerge**
      - 实验采用各种不同模型，无法得出哪个计算量级对哪种能力有 emerge

# 参考
1. [清华博士带你思考大语言模型LLM的涌现现象（Emergent）](https://www.bilibili.com/video/BV1qX4y1i78J/)  有脑图
    Emergent Abilities of Large Language Models （https://arxiv.org/abs/2206.07682）