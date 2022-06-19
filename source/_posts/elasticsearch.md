---
title: Elastic Search(es)
date: 2019-08-02 22:27:22
tags: 
  - elasticSearch
categories:  
  - 大数据
  - 存储
  - elasticSearch
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


## ES的集群
##### 主分片（Primary Shard）和副本分片（Replica Shard）
主分片数设置好后不能变更， 除非重建索引。 
副本数可以动态调整。

##### 节点角色
节点类型| 配置参数 |  默认值
:-:|:-:| :-:
master eligible| node.master| true
data| node.data | true
ingest| node.ingest| true
coordinating only| 无| 每个节点默认都是coordinating节点。设置其他类型全部为false。
machine learning| node.ml | true（需enable x-pack）



##### 三种颜色
绿色： 主分片和副本分片都正常
黄色： 主分片正常， 副本分片异常 
红色： 主分片和副本分片都异常 

## 搜索模型 
+ 向量空间模型
相似性计算 tf, idf(5.0)   
+ 概率检索模型
BM25(5.0之后)  

+ 精确率(Presicion)和召回率(recall)
   

## 搜索
term -> 不分词
全文索引 ->  会分词

function score query

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




