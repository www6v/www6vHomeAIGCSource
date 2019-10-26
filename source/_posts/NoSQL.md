---
title: NoSQL知识点
date: 2018-07-19 10:30:36
tags:
  - Nosql
  - 一致性
  - 事务
categories:
  - 分布式
  - 存储 
  - Nosql  
---
                                                                            
## 1. NoSQL数据结构
大规模数据时，工程实践中常见的数据结构一般有两种：哈希表与平衡树
**平衡树:** B树, 同时适应磁盘和内存.  复杂度为O(logN).
**哈希表:** Hash数据结构可以高效地执行根据主键的插入、删除以及查找操作. 但不支持范围查询功能，不支持快照。复杂度为O(N)。
<!-- more -->   
 
**存储引擎：**
哈希表对应的存储引擎是随机读取存储引擎. 一致性Hash分 桶，每个桶内使用Log-Structured Hash Table存储数据。 Eg. Bitcask
B+树对应的存储引擎是Merge-Dump存储引擎。 Eg. Hbase, Cassandra.
 
## 2. NoSQL 数据建模技术
**Key-Value 键值对:** 简单， 不支持范围查找。 Eg. Oracle Coherence, Redis
**Ordered Key-Value 有序键值对：**map里嵌套map。这种模型的value主要通过“列族”（column families），列，和时间戳来控制版本。Eg. Apache HBase, Apache Cassandra
**Document databases 文档模型：**value中有主观的模式（scheme）,用字段名做索引. Eg. MongoDB, CouchDB
**Graph data models 图式数据库:** 图结构的数据模型. neo4j, FlockDB
 
数据库有对象模型与表模型的阻抗不匹配，NoSQL的**聚合（Aggregates）模型**更贴合**对象模型**的思路。
数据库是面向记录的， NoSQL是面向聚集的。
 
## 3. 一致性
#####  I．读写一致性
写后读一致性。
读后读一致性。
#####  II．写一致性
**原子写**：一次写入操作只能是单独的原子性的赋值。
**冲突预防**：
分布式锁或是 PAXOS（悲观锁）。
避免分布式的并发写操作，将对特定数据项的所有写操作路由到单个节点上（可以是全局主节点或者分区主节点）。Eg Hbase region  server，MongoDB，大部分关系数据库。
**冲突检测**：
    CAS （Compare And Set）模式, 检测并发更新的冲突，选择回滚其中一个版本，或是维持两个版本并交由客户端解决。 Eg.  Dynamo Vector Lock(向量时钟), memcache CAS, SVN.
 
![一致性](http://pic.yupoo.com/iammutex/Cr4HWbaZ/Js1Ke.png) 

#####  (A-H)  一致性由弱到强
1.  一次性读写 （A），（B），（C）, （D）
（A反熵），一致性最弱. 写操作的时候选择任意一个节点更新，在读的时候如果新数据还没有通过后台的反熵协议传递到读的那个节点，那么读到的仍然是旧数据  Eg. Cassandra  Gossip协议
 
   （B），（C）  反熵的变体
（D 一次性读写） 在总共返回的N个值中，如果协调器发现有的数据不是最新的。那么它可以通过读时修复机制来对这些节点进行处理。  Eg.  Dynamo 读时修复
 
2.  （E），（F）     
（E 读若干写若干） Quorum-based, 灵活可配置  Eg.  Dynamo  R+W>N，
（F 读全部写若干） 
 
3. （G）(H)
（G 主从）主从异步复制  Eg. Mysql  replication
(H PAXOS) 使用两阶段提交协议  Eg.  Oracle DBLink

##### 举例: Cassandra一致性
![Cassandra一致性](https://user-images.githubusercontent.com/5608425/64945268-c2710880-d8a2-11e9-8ace-dfe3dca32995.png)

## 4. 事务
#####  I. 单机事务       
ACID保证
（C 一致性）（I 隔离性）：
    主要有以下几种实现方式
1. 依托锁来实现的。  
分类：读写锁， 排他锁。
4个隔离级别和锁的粒度有关。
2. copy-on-write（MVCC）   
读写之间互不影响，写不阻塞读， 读不阻塞写， 效率高。
实现了隔离级别中用的最多的第二，第三级别。
3. 队列  
 
##### II. 分布式事务    
1.   常规实现
悲观锁： 读写锁（两阶段提交， 三阶段提交）
        乐观锁： Read-Test-Write， CAS（compare and set）
        分布式的MVCC  Eg. MegaStore, Percolator
        
        分布式锁： 分布式导致高延迟， 并且加锁解锁多次交互。
2.  避免分布式锁的实现
CAP理论中适当放宽一致性。 并兼顾一致性， 响应时间，可用性。

> 参考实现
  [用消息队列和消息应用状态表来消除分布式事务](http://wangyuanzju.blog.163.com/blog/static/1302920086424341932)  事务 一致性
  <<海量存储系列之六>>
 
## 5. 动态还是静态的数据结构
关系数据库模型： 
   动态更新的B+树， 写数据时，需要更新B+树。 读写依赖， 实现复杂， 有性能上限。

Nosql：
   动态数据和静态数据分离， MemTable(动态) + SSTable（静态）。牺牲读， 提升写性能。  
   MemTable: Write-back Cache, 随机IO写变成顺序IO写，降低大量的写操作对于存储系统的压力
 
## 6. 索引和join
索引
+ 关系数据库：单机索引
+ NoSQL索引：系统层面， 全局索引。

Join
+ 关系数据库Join： 存储引擎层面支持join。
+ NoSQL Join：一般根据应用来决定join的实现。

> 参考实现  <<Hbase二级索引>>
 
## 参考：
1.  [NoSQL数据库的分布式算法](https://my.oschina.net/juliashine/blog/88173)   论文 good 
    [NoSQL数据库的分布式算法](https://blog.csdn.net/wxliu1989/article/details/38415933)
    [DISTRIBUTED ALGORITHMS IN NOSQL DATABASES](https://highlyscalable.wordpress.com/2012/09/18/distributed-algorithms-in-nosql-databases/) 原文
2.  [NoSQL 数据建模技术](http://coolshell.cn/articles/7270.html)   good    
3.  [分布式系统的数据结构](http://www.nosqlnotes.net/archives/134)      
4.  [优雅的Bitcask](http://blog.nosqlfan.com/html/955.html)      
5.  [分布式事务](http://www.nosqlnotes.net/archives/62)       
6.  [SQL到NOSQL的思维转变](http://www.nosqlnotes.net/archives/140)      
7.  [HBase二级索引与Join](https://www.oschina.net/question/12_32573)  
8.  [cassandra框架模型之二——存储机制 CommitLog MemTable SSTable](https://www.cnblogs.com/bonelee/p/6278154.html)  一致性

### Paper
朱涛, 郭进伟, 周欢, 周烜, 周傲英. 分布式数据库中一致性与可用性的关系[J]. 软件学报, 2018, 29(1): 131-149.http://www.jos.org.cn/1000-9825/5433.htm
  
 

