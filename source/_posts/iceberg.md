---
title: Iceberg
date: 2022-09-01 17:42:10
tags:
  - Kubernetes
categories: 
  - 大数据 
  - 存储
  - Iceberg  
---

<p></p>
<!-- more -->



## 特性 [1] [2]

+ 基于快照的读写分离和回溯
	- **快照控制**：可实现使用完全相同的表快照的可重复查询，或者使用户轻松检查更改
	- **Time Travel** 
	- **行级更新**  [4]
	  V1版本-Copy On Write（COW）模式
      V2版本-Copy On Write，还增加了Merge On Read（MOR）
+ 流批统一的写入和读取
	- 兼容性好：可以存储在任意的云存储系统和HDFS中
	- 快速扫描数据：无需使用分布式SQL引擎即可读取表或查找文件
	- 数据修剪优化：使用表元数据使用分区和列级统计信息修剪数据文件

+ ACID 语义及数据多版本
	- 支持**事务**：序列化隔离,表更改是原子性的，读者永远不会看到部分更改或未提交的更改
	- 高并发：**高并发写入**器使用乐观并发，即使写入冲突，也会重试以确保兼容更新成功
	- **版本回滚 Version rollback**：使用户可以通过将表重置为良好状态来快速纠正问题

+ 表, 模式及分区的变更
	- **模式演化 Schema evolution**：支持添加，删除，更新或重命名，并且没有副作用
	- **隐藏分区 Hidden Partition**：可以防止导致错误提示或非常慢查询的用户错误
	- **分区布局演变 Partition layout evolution**：可以随着数据量或查询模式的变化而更新表的布局

+ 不强绑定计算存储引擎



## 整体架构 [3]
+ 数据
  普通的 Parquet 文件
+ 元数据
	+ catalog
      version-hint.txt 文件 	
    + metadata file
	  json 文件
	+ manifestlist file  [snapshot]
      以 snap- 开头的 avro 文件	
 	+ manifest file
      16db143c,18ce4c4a 开头的 avro 文件

##  读写过程
+ 读写
+ 增量读
+ 实时小文件合并



## 参考

1. [Flink + Iceberg 全场景实时数仓的建设实践](https://zhuanlan.zhihu.com/p/347660549)  腾讯数据平台
2. [5分钟入门数据湖IceBerg](https://cloud.tencent.com/developer/article/2290397)
3. [Iceberg 原理分析](https://zhuanlan.zhihu.com/p/488467438)
4. [数据湖Iceberg技术在小米的落地与场景应用](https://z.itpub.net/article/detail/7B5B8C89CC5244F94A0C5FDF7DC83DFB)


[Iceberg实时湖仓数据分析性能优化](https://zhuanlan.zhihu.com/p/636273850)
[火山引擎 Iceberg 数据湖的应用与实践](https://blog.csdn.net/weixin_46399686/article/details/131308217)
[陈梁：腾讯数据湖查询优化实践 ](https://mp.weixin.qq.com/s?__biz=MzI1MjQ2OTQ3Ng==&mid=2247562593&idx=2&sn=a41a5202c21118b1f17619a80eff651f)

[深度对比delta、iceberg和hudi三大开源数据湖方案](https://zhuanlan.zhihu.com/p/110748218)  ***
[Apache Iceberg 在严选批流一体的实践](https://baijiahao.baidu.com/s?id=1776240000826938540&wfr=spider&for=pc) 
