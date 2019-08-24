---
title: 文件&存储总结
date: 2019-08-24 12:47:32
tags:
  - 文件
  - 存储
categories:
  - 总结 
  - 存储
top: true    
---

<p hidden></p>
<!-- more -->

## 一. Linux文件系统   

系统 | 组件 | 缓存
-|-|-
虚拟文件系统 |  dentry， inode(索引文件) | page cache
块设备 | dev | buffer

## 二. 应用层


 总结 | 知识点   
 -|-
 NoSQL知识点     |  1. Key-Value 键值对 <br>2. “列族”（column families）数据库<br>3. 文档数据库<br> 4.图式数据库 
 文件IO总结      |  mmap，NIO(FileChannel)
 Redis总结       | AOF，RDB 
 Kafka总结       | Partition的Segment中的index文件，data文件 
 RocketMQ总结    | CommitLog， ComsumeQueue， 索引文件 