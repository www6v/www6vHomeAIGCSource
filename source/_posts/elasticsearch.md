---
title: Elasticsearch(es)
date: 2019-08-02 22:27:22
tags: 
  - Elasticsearch
categories:  
  - 大数据
  - 存储
  - Elasticsearch
---

<p></p>
<!-- more -->

## ES的概念

DB| Elastic Search | 
:-:|:-:
Table|Index(Type)
Row|Document
Column|Field
Schema|Mapping
SQL| DSL

##### 倒排索引 [3]
+ 倒排索引包括2部分
  + 单词词典(term dictionary)
  + 倒排列表(posting list)
    文档id: doc id
    词频 TF
    位置 Position 
    偏移 Offset

##### analysis 分词 [4]
+ Analyzer 分词器
  1. Character Filters 
     针对原始文本处理
  2. Tokenizer
     切分单词
  3. Token Filters
     将切分的单词进行加工
+ 中文分词器
  + icu_analyzer
  + IK
  + THULAC

##### term搜索 vs 全文搜索[5]
+ term  不分词
  - term 返回算分结果
  - keyword 完全匹配
  - query 转成 filter
    忽略tf-idf计算, 避免相关性算分的开销
    filter可以有效利用缓存    
+ 全文索引  会分词
  - 索引和搜索时都会进行分词
    查询时，会对输入的查询进行分词

function score query

##### 索引更新策略
+ 完全更新策略 -> index 
+ 再合并策略
+ 原地更新策略

##### 搜索模型 
+ 向量空间模型
相似性计算 tf, idf(5.0)  

+ 概率检索模型
BM25(5.0之后)  

##### search api [6]
+ uri search
  url中的查询参数
+ request body search
  json DSL

##### 衡量相关性 information retrieval [6] [pic]
  + 精确率(Presicion)
    尽可能返回较少的无关文档
  + 召回率(recall)
    尽可能返回较多的相关文档
  + ranking 
    是否能按照相关度进行排序

##  geoip
<div style="text-align: center; width: 70%; height: 70%">
	
![elastic geoip](https://user-images.githubusercontent.com/5608425/64664368-8d6b4d00-d481-11e9-88bd-1b4cbf99379c.JPG) 
elastic geoip
</div>

## 参考
1. [Elasticsearch 数据写入原理](https://mp.weixin.qq.com/s/BSjA_TBuapPHrE4COCp9VA)
3. 12丨倒排索引介绍
4. 13丨通过Analyzer进行分词
5. 24丨基于词项和基于全文的搜索
6. 14丨SearchAPI概览

