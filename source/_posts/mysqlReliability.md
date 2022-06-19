---
title: MySQL的高可靠和高可用
date: 2020-06-21 18:14:49
tags:
  - mysql
categories: 
  - 数据库
  - 关系型 
  - mysql
---


<p></p>
<!-- more -->


## 一. MySQL主从复制原理

### 1.1  主从复制
<div style="text-align: center;">

![master-slave](https://user-images.githubusercontent.com/5608425/66110430-58be6180-e5f9-11e9-9272-da2f69e51b1c.jpg)
MySQL主从复制
</div>

> + MySQL master 将数据变更写入二进制日志( binary log, 其中记录叫做二进制日志事件binary log events，可以通过 show binlog events 进行查看)
+ MySQL slave 将 master 的 binary log events 拷贝到它的中继日志(relay log)
+ MySQL slave 重放 relay log 中事件，将数据变更反映它自己的数据

### 1.2 主备切换
<div style="width:70%;margin:auto">
{% asset_img  mysqlMasterSlave1.PNG  MySQL主备切换流程 %}

因为readonly设置对超级(super)权限用户是无效的，而用于同步更新的线程，就拥有超级权限。
</div>

<div style="width:70%;margin:auto">
{% asset_img  mysqlMasterSlave2.PNG  主备流程图 %}
</div>

> 一个事务日志同步的完整过程是这样的：
1. 在备库B上通过change master命令，设置主库A的IP、端口、用户名、密码，以及要从哪个
位置开始请求binlog，这个位置包含文件名和日志偏移量。
2. 在备库B上执行start slave命令，这时候备库会启动两个线程，就是图中的io_thread和
sql_thread。其中io_thread负责与主库建立连接。
3. 主库A校验完用户名、密码后，开始按照备库B传过来的位置，从本地读取binlog，发给B。
4. 备库B拿到binlog后，写到本地文件，称为中转日志（relay log）。
5. sql_thread读取中转日志，解析出日志里的命令，并执行。

### 1.3  Master-Master(双M)循环复制问题 
> 如果设置了双M结构，日志的执行流就会变成这样：
1. 从节点A更新的事务，binlog里面记的都是A的server id；
2. 传到节点B执行一次以后，节点B生成的binlog 的server id也是A的server id；
3. 再传回给节点A，A判断到这个server id与自己的相同，就不会再处理这个日志。所以，死循
环在这里就断掉了。

### 1.4 主备延迟
+ 主备延迟来源
1. 备库所在机器的性能要比主库所在的**机器性能差**
2. **备库的压力大**
解决方案: 
I. **一主多从**。除了备库外，可以多接几个从库，让这些从库来分担读的压力。
II. **通过binlog输出到外部系统**，比如Hadoop这类系统，让外部系统提供统计类查询的能力。
3. **大事务**
解决方案:
I. 不要一次性地用delete语句删除太多数据
II. 大表DDL场景, 处理方案就是，计划内的DDL，建议使用gh-ost方案.
4. 备库的并行复制能力 [3]


### 1.5 主备切换的策略

由于主备延迟的存在，所以在主备切换的时候，就相应的有不同的策略。

+ 可靠性优先策略 - 数据不丢、安全可靠

<div style="width:70%;margin:auto">
{% asset_img  mysqlMasterSlave-reliable.PNG  可靠性优先主备切换流程 %}
</div>

<div style="width:70%;margin:auto">
{% asset_img  mysqlMasterSlave-reliable-fault.PNG  可靠性优先策略，主库不可用 %}
</div>

+ 可用性优先策略 - 服务可用

**总结：
实际的应用中，我更建议使用可靠性优先的策略。
在满足数据可靠性的前提下，MySQL高可用系统的可用性，是依赖于主备延迟的。延迟的时间越小，在主库故障的时候，服务恢复需要的时间就越短，可用性就越高。**

## 二. binlog的三种格式
1. statement
2. row格式
3. mixed格式: statement or row格式

> 因为有些**statement格式**的binlog可能会**导致主备不一致**，所以要使用row格式。
但**row格式的缺点是，很占空间**。比如你用一个delete语句删掉10万行数据，用statement的
话就是一个SQL语句被记录到binlog中，占用几十个字节的空间。但如果用row格式的binlog，
就要把这10万条记录都写到binlog中。这样做，不仅会占用更大的空间，同时写binlog也要耗
费IO资源，影响执行速度。
所以，MySQL就取了个**折中方案**，也就是有了mixed格式的binlog。**mixed格式**的意思
是，MySQL自己会判断这条SQL语句是否可能引起主备不一致，如果有可能，就用row格式，
否则就用statement格式。
也就是说，mixed格式**可以利用statment格式的优点，同时又避免了数据不一致的风险**。
因此，如果你的线上MySQL设置的binlog格式是statement的话，那基本上就可以认为这是一个
不合理的设置。你至少应该把binlog的格式设置为mixed。


## 三. redo log 和 undo log

##### redo Log 
+ WAL日志，保证事务持久性
+ buffer楼盘之前数据库意外宕机， 可以进行数据的恢复

##### undo log
+ 保证事务原子性， 回滚或者事务异常，可以回滚到历史版本
+ 实现MVCC的必要条件

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


## 参考:
1. 《MySQL实战45讲-MySQL是怎么保证主备一致的？》   丁奇
2. 《MySQL实战45讲-MySQL是怎么保证高可用的？》  丁奇
3. 《MySQL实战45讲-备库为什么会延迟好几个小时？》  丁奇
4. 《云数据库架构》 1.1.5  1.1.7 - 阿里云