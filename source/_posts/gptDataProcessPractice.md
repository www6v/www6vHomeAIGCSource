---
title: (实战)数据处理
date: 2023-03-19 17:17:50
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

# 案例
## 千帆Llama 2中文增强技术介绍-SFT[30]
### 数据增强
+ Self-instruct
+ wizard [20]

### 数据精简
+ 低质量过滤
+ 相似数据过滤

### 数据配比
+ 领域数据
+ 多语言数据


## 度小满轩辕金融大模型[31]
### 通用的数据清洗流水线
+ 文本抽取
  + 多来源数据收集
  + 正文提取
+ 数据清洗
  + 规则过滤
  + 模型过滤
+ 去重与校验
  + MinHashLSH
  + 质量校验

### 增量预训练 最佳数据配比
+ **英文数据  vs 中文数据**
  **1  :  3**

+ 中文数据中的  **通用数据 vs 金融数据**  
  从 9:1 变成  **4:1**
  + 通用领域指令数据
   8大类 50小类
  + 金融领域指令数据
   4大类 20小类

### 构造通用和金融指令数据
{%  asset_img  'data.jpeg'  %}
+ Self-Instruct
+ Evol-Instruct


# 参考
### 案例
30. 《千帆增强版 Llama 2》 百度 有ppt
31. 《金融行业实战：度小满轩辕金融大模型应用探索与开发实践》 百度  有ppt

1xx. [也看大模型训练语料如何清洗：Common Crawl概述、代表性清洗方案及代码实现          ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648399885&idx=1&sn=4f49c5148715c38aa4eaee3080435f17) 代码
   [GPT-3 训练语料 Common Crawl 处理流程](https://zhuanlan.zhihu.com/p/610659484?utm_id=0)



1xx. [Data-Juicer: 为大语言模型提供更高质量、更丰富、更易“消化”的数据](https://github.com/alibaba/data-juicer/blob/main/README_ZH.md) git