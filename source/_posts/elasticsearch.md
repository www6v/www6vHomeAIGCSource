---
title: Elastic Search
date: 2019-08-02 22:27:22
tags: 
  - elasticSearch
categories:  
  - 分布式
  - 存储
  - elasticSearch
---

<p></p>
<!-- more -->


## 模型 
+ 向量空间模型
相似性计算 tf, idf(5.0)   
+ 概率检索模型
BM25(5.0之后)  

+ 精确率(Presicion)和召回率(recall)
   

## 搜索
term -> 不分词
全文索引 ->  会分词

## 索引更新策略
完全更新策略 -> index 
再合并策略
原地更新策略

##  数据写入
<div style="text-align: center; width: 70%; height: 70%">
![Elasticsearch 数据写入](https://user-images.githubusercontent.com/5608425/65385405-d7491280-dd60-11e9-9a73-895afca03bb8.png)
Elasticsearch 数据写入
</div>

+ write：文档数据到内存缓存，并存到 translog
+ refresh：内存缓存中的文档数据，到文件缓存中的 segment 。此时可以被搜到
+ flush 是缓存中的 segment 文档数据写入到磁盘

##  geoip
<div style="text-align: center; width: 70%; height: 70%">
![elastic geoip](https://user-images.githubusercontent.com/5608425/64664368-8d6b4d00-d481-11e9-88bd-1b4cbf99379c.JPG) 
elastic geoip
</div>

## 参考
1. [Elasticsearch 数据写入原理](https://mp.weixin.qq.com/s/BSjA_TBuapPHrE4COCp9VA)




