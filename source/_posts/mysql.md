---
title: Mysql
date: 2019-09-10 16:02:39
tags:
  - mysql
categories:  
  - mysql
---

<p></p>
<!-- more -->

## 一. 索引

索引的数据结构： B+树能够很好地配合磁盘的读写特性，减少单次查询的磁盘访问次数


 index | MyISAM  |  InnoDB | Memory
:-: | :-: | :-: | :-:
 B-Tree<br>（balanced 平衡的）  | 支持 | 支持  | 支持
 Hash        | 不支持 | 不支持  | 支持
 R-Tree <br>空间索引 |  支持| 不支持 | 不支持
 Full-text    | 支持| 支持 | 不支持



 index使用场景 | 例子
 :-: | :-: 
 匹配全值  |  index (a,b,c) <br> a=1 and b=2 and c=3
 范围查找  |  index a>1 and b<3 
 匹配最左前缀  |  index(a，b，c)  <br> a OR a，b OR a、b、c OR a，c 会使用 <br>  b、c 不使用
 仅对索引列进行查询（覆盖索引）  |  index  a <br> a=1
  匹配列前缀 | index （a， b） <br> a like 'WEER%'    
  Index Condition Pushdown（ICP） |  减少回表IO     


 不会使用index的场景 | 例子
 :-: | :-: 
 like | like "%NI%"
 隐式转换 | lastname=1  不使用索引 <br>lastname='1'  使用索引
  复合索引不符合最左匹配原则 |
 or | index a <br>  a=3 or c=6 or d=9

<div style="text-align: center;">
![innodb-myisam-index](https://user-images.githubusercontent.com/5608425/65374438-66501f00-dcbc-11e9-8609-2da27df96809.png)
Innodb和MyISAM中的聚集索引和非聚集索引(二级索引)
</div>

**索引维护**
页分裂， 性能会受影响， 整体空间利用率降低大约50%。
页合并，页分裂的逆过程。 

** 自增主键 **
自增主键的插入数据模式，正符合了递增插入的场景。每次插入一条
新记录，都是追加操作，都不涉及到挪动其他记录，也不会触发叶子节点的分裂。
而有业务逻辑的字段做主键，则往往不容易保证有序插入，这样写数据成本相对较高。

除了考虑性能外，我们还可以从存储空间的角度来看。假设你的表中确实有一个唯一字段，比如
字符串类型的身份证号，那应该用身份证号做主键，还是用自增字段做主键呢？
由于每个非主键索引的叶子节点上都是主键的值。如果用身份证号做主键，那么每个二级索引的
叶子节点占用约20个字节，而如果用整型做主键，则只要4个字节，如果是长整型（bigint）则是
8个字节。显然，主键长度越小，普通索引的叶子节点就越小，普通索引占用的空间也就越小。
这样，非主键索引占用的空间最小。

所以，从性能和存储空间方面考量，自增主键往往是更合理的选择。


**覆盖索引**
如果执行的语句是select ID from T where k between 3 and 5，这时只需要查ID的值，而ID的值
已经在k索引树上了，因此可以直接提供查询结果，不需要回表。也就是说，在这个查询里面，
索引k已经“覆盖了”我们的查询需求，我们称为覆盖索引.

覆盖索引可以减少树的搜索次数，显著提升查询性能，所以使用覆盖索引是一个常用的性能优化手段.


## 二. redo log 和 undo log
```
  事务开始.
      记录A=1到undo log.
      修改A=3.
      记录A=3到redo log.( 先写内存， 后同步到磁盘中)

      记录B=2到undo log.
      修改B=4.
      记录B=4到redo log.( 先写内存， 后同步到磁盘中)

      将redo log写入磁盘。
  事务提交
```

## 三. MyISAM 和 InnoDB

  描述  | MyISAM  |  InnoDB 
  :-: | :-: | :-: 
  行锁(并发高，会死锁)| × | √ (默认支持)<br>Record lock: 锁记录<br>Gap lock: 锁范围，不锁记录<br>Next-key lock： 锁范围+锁记录
  表锁(并发低，不会死锁)| √ |  √
  事务和崩溃恢复| × |  √
  外键| × |  √
  MVCC| × |  √ <br> 在READ COMMITTED 和 REPEATABLE READ时有效 

> innodb对于行的查询使用next-key lock
  Next-locking keying、Gap锁为了解决Phantom Problem幻读问题
  当查询的索引含有唯一属性时(单条记录)，将next-key lock降级为record key


## 四. 事务隔离级别

隔离级别| 脏读|  不可重复读<br>（重点是修改）| 幻影读<br>（重点是新增或者删除）
:-: | :-: | :-: | :-:
READ-UNCOMMITTED|  √| √| √
READ-COMMITTED|  ×| √| √
REPEATABLE-READ<br>（**InnoDB默认支持**）| ×| ×| √
SERIALIZABLE|  ×| ×| ×


## 五. MySQL主从复制原理

<div style="text-align: center;">
![master-slave](https://user-images.githubusercontent.com/5608425/66110430-58be6180-e5f9-11e9-9272-da2f69e51b1c.jpg)
MySQL主从复制
</div>

> + MySQL master 将数据变更写入二进制日志( binary log, 其中记录叫做二进制日志事件binary log events，可以通过 show binlog events 进行查看)
+ MySQL slave 将 master 的 binary log events 拷贝到它的中继日志(relay log)
+ MySQL slave 重放 relay log 中事件，将数据变更反映它自己的数据

## 参考:

1. 《深入浅出MySQL：数据库开发、优化与管理维护》 
2. [MySQL索引背后的数据结构及算法原理](http://blog.codinglabs.org/articles/theory-of-mysql-index.html)
3. [理解MySQL——索引与优化](https://www.cnblogs.com/hustcat/archive/2009/10/28/1591648.html)
4. [Mysql事务总结](../../../../2015/02/21/transaction/) self
5. [剖析Mysql的InnoDB索引](https://blog.csdn.net/voidccc/article/details/40077329)  good
6. [可能是全网最好的MySQL重要知识点](https://mp.weixin.qq.com/s/M1dLLuePpdM9vA3F1uJGyw)
7. [MySQL索引原理及慢查询优化](http://www.admin10000.com/document/6228.html)  good 美团 未 
8. [业界难题-“跨库分页”的四种方案](https://mp.weixin.qq.com/s/h99sXP4mvVFsJw6Oh3aU5A)  58沈剑  未
9. [ali canal](https://github.com/alibaba/canal)
10. 《MySQL实战45讲》 深入浅出索引（上）  丁奇
10. 《MySQL实战45讲》 深入浅出索引（下）  丁奇

