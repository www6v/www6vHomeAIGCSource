---
title:  实时数仓
date: 2022-07-18 11:46:42
tags:
  - 实时数仓
categories:
  - 大数据  
  - 实时数仓
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 架构

###   参考架构 - 美团 基于Doris [1]

{% asset_img 'arch.png' %}

{% asset_img 'arch1.png' %}



### 参考架构-vivo 基于Hudi-Kappa架构   [4]

{% asset_img 'vivo-arch.jpg' %}



### 参考架构-快手 基于Kafka+Hive-Lambda架构   [6]

{% asset_img 'kuaishou-arch.jpg' %}





### 参考架构-腾讯 基于Hudi-Kappa架构  批流一体架构 [3]

{% asset_img 'tencent-arch.jpg' %}



### Tradeoff [5]

总的来说，数据湖 替换 Kafka 的**优势**主要包括：

- 实现存储层的**流批统一**
- **中间层支持 OLAP 分析**
- 完美支持高效**回溯**
- 存储成本降低

当然，也存在一定的**缺陷**，如：

- 数据延迟从**实时**变成**近实时**
- 对接其他数据系统需要额外开发工作



#  实时数仓-分层 [1]

### 数据源  ODS

{% asset_img 'basic.png' %}



### 明细层 DMD

+ 目的是给下游提供直接可用的数据
+ 要对基础层进行统一的加工，比如清洗、过滤、扩维等
+ 按照主题进行管理

### 汇总层 DMS

+ 所有的指标都统一在汇总层加工
+ 汇总指标池
  按照统一的规范管理建设，形成可复用的汇总结果



# 实时数仓-构建流程 [1]

+ 搭框架
  数据建设的层次化

+ 定规范
  每一层加工到什么程度，每一层用什么样的方式

+ 时效性
  设计的时候，层次不能太多  



# 数仓建模 [2]

###  事实表 

+ 事务事实表   
+ 周期快照事实表 
+ 累积快照事实表 

###  维度表 DIM
+ 类型
  + 星型模型
    维表只和事实表关联，维表之间没有关联，查询性能好，但冗余度高
    一般而言，我们都使用星型模型。
  + 雪花模型
    雪花模型是星型模式中的维度表进行规范化处理，进一步分解到附加表（维表）中冗余度小，但是查询性能差。
    将一个维表拆成核心表和拓展表

+ 存储
  + HBase
  + Redis
  + MySQL

# 参考
1. [美团外卖实时数仓建设实践](https://tech.meituan.com/2021/08/26/data-warehouse-in-meituan-waimai.html)  美团 
2. [一篇文章搞懂数据仓库：三种事实表（设计原则，设计方法、对比）](https://notomato.blog.csdn.net/article/details/110635856)
3. [[数据湖] 基于flink hudi的批流一体实践](https://zhuanlan.zhihu.com/p/523028640) 腾讯  
4. [vivo 实时计算平台建设实践](https://zhuanlan.zhihu.com/p/594928870)  vivo 
5. [Flink + Iceberg 全场景实时数仓的建设实践](https://zhuanlan.zhihu.com/p/347660549)  腾讯数据平台


+ [FFA 2022 实时湖仓](https://flink-learning.org.cn/activity/detail/9075f73ecfd2b87c6c7fbe7d79ad58ca)  ***
   + [美团买菜基于 Flink 的实时数仓建设](https://xie.infoq.cn/article/3c80a350e06d88e85d34f4008)  未
   + 6. [快手基于 Apache Flink 的实时数仓建设实践](https://flink-learning.org.cn/article/detail/de3aa90d2f02195e65e721c1f2a434e1)  *** 未
+ [FFA 2022 平台建设](https://flink-learning.org.cn/activity/detail/d3d092c45467c40fb8526c4ec2141be2)  ***
   + [小米基于 Flink 的实时数仓建设实践](https://xie.infoq.cn/article/acf64bbe900ec426b8699f094) 未
     
     









