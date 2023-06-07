---
title: HBase Hotkey-预分区和Rowkey设计
date: 2021-06-07 15:24:59
tags:
  - HBase
categories:
  - 大数据  
  - 存储
  - HBase
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


# 目标

Region自动split有**数据倾斜**问题，所以要**预分区**。

热的Region会有更多的读/写请求流入， 造成RegionServer的不稳定和更多的资源消耗（eg. gc 时间长）。

# Rowkey设计的原则

-  散列性
-  集中性 
-  唯一性   

# Row_key设计 防止热点的三种方法

###   Hash (通用)
```
十进制_年月日小时分秒_订单号
xx_20200101010101_364758  
xx_20200101010101_585775
xx_20200101010101_385748  

3个分区
xx = hash（年月日小时分秒，订单号）% 分区数
```

###  Reversing

**倒序时间戳**

一个数据库处理的通常问题是找到最近版本的值。采用倒序时间戳作为键的一部分可以对此特定情况有很大帮助。该技术包含追加( Long.MAX_VALUE - timestamp ) 到key的后面，如 [key][reverse_timestamp] 。

**表内[key]的最近的值可以用[key]进行Scan，找到并获取第一个记录。**由于HBase行键是排序的，该键排在任何比它老的行键的前面，所以是第一个。

该技术可以用于代替版本数，其目的是保存所有版本到“永远”(或一段很长时间) 。**同时，采用同样的Scan技术，可以很快获取其他版本。**

```
Rowkey: reverse(order_id) + (MAX_LONG – timestamp)
Columns: 该订单各种状态
```

```
2021010101010101 -> 101010101010101202
20210202020202 -> 2020202020201202
20210303030303 -> 3030303030301202
```

###  Salt

-  对get、put友好，对scan操作并不友好

-  有热点就要打散，但打散就难以做范围查询。因此，要同时满足这对相互矛盾的需求，**必须有一种折中的方案：既能在一定程度上打散，又能保证一定程度的有序。**

这个解决方案就是加盐，其实叫分桶(salt buckets)更准确。**数据在桶内保序，桶之间随机。**

写入时按桶个数取模，数据随机落在某个桶里，保证写请求在桶之间是均衡的。查询时读取所有的桶来保证结果集的有序和完备。

```
加盐的过程就是在原来key的基础上增加一个byte作为前缀,计算公式如下：
new_row_key = ((byte) (hash(key) % BUCKETS_NUMBER) + original_key
```

{% asset_img 'h-1.png'  %}

# HBase SDK与预分区 相关的参数

- 其中 NUMREGIONS 为 **region的个数**，一般按**每个region 6~8GB左右**来计算region数量，集群规模大，region数量可以适当取大一些
- SPLITALGO 为 rowkey分割的算法：Hbase自带了三种pre-split的算法，分别是 HexStringSplit、DecimalStringSplit 和 UniformSplit。

各种Split算法适用场景：
  - **HexStringSplit**: rowkey是**十六进制**的字符串作为前缀的 （MD5编码为16进制的rowkey） 
  - **DecimalStringSplit**: rowkey是**10进制**数字字符串作为前缀的
  - UniformSplit: rowkey前缀完全随机 （hash算法转换为字节数组的rowkey） 

# 分区数建议  

| 表                | 分区数建议，表大小                                     |
| ----------------- | ------------------------------------------------------ |
| 小表（<50G）      | 5～10个分区                                            |
| 大表（500G～10T） | 表的大小/10G, 最大120个分区<br> eg. 1T/10G = 100个分区 |

| 吞吐                                            | 有sacn需求           |
| ----------------------------------------------- | -------------------- |
| 吞吐高， 分区数相应多<br/>吞吐低， 分区数相应低 | 分区要控制在一定范围 |

# 可配置的分区数

1.  Portal里可以配置hbase 表的分区数， 配置的值存储在zk中。
2.  在建立表的时候读取预先存储好的分区数， 做到建表时自动分区。
3.  sdk 里读取预先存储好的分区数，保证负载均匀的写入Region。

# 已有表（负载不均衡的表）迁移到新的表-暂时不做

  老的表的rowkey清洗一遍存入新的表中。


# 总结

|               | put，get | scan                                    | 通用性     | 结果                |
| ------------- | -------- | --------------------------------------- | ---------- | ------------------- |
| **Salt**      | 友好     | 不友好<br/>多个Re**gion的多路归并算法** | 通用       | SDK（方式2-salt）   |
| **Reversing** | 友好     | 友好<br/>相同rowkey的会存储在一起       | 和业务相关 | SDK（方式3-自定义） |

# 参考
1. [HBase Rowkey的散列与预分区设计](https://blog.csdn.net/menghuannvxia/article/details/53842320)
2. [滴滴hbase常见的rowkey设计](http://www.inter12.org/archives/1192)
3. [HBaseWD: Avoid RegionServer Hotspotting Despite Sequential Keys](https://sematext.com/blog/hbasewd-avoid-regionserver-hotspotting-despite-writing-records-with-sequential-keys/) *** 代码
4. [Rowkey设计](https://help.aliyun.com/document_detail/59035.htm?spm=a2c4g.11186623.2.2.500e620cMI9Ks1) 阿里云
5. [预分区](https://help.aliyun.com/document_detail/71787.html) 阿里云





