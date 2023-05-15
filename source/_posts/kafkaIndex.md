---
title: Kafka 索引
date: 2021-05-15 15:51:57
tags:
  - Kafka
categories:
  - 消息系统  
  - Kafka
---

<p></p>
<!-- more -->

## 索引类型
+ 偏移量索引
+ 时间戳索引



---

在 AbstractIndex 中，这个 MappedByteBuffer 就是名为 **mmap** 的变量。接下来，我用

注释的方式，带你深入了解下这个 mmap 的主要流程。

``` Scala
@volatile protected var mmap: MappedByteBuffer = { 
// 第1步：创建索引文件
val newlyCreated = file.createNewFile() 
// 第2步：以writable指定的方式（读写方式或只读方式）打开索引文件
val raf = if (writable) new RandomAccessFile(file, "rw") else new Rando try {    
  if(newlyCreated) {       
    if(maxIndexSize < entrySize) // 预设的索引文件大小不能太小，如果连一个索引     throw new IllegalArgumentException("Invalid max index size: " + m       // 第3步：设置索引文件长度，roundDownToExactMultiple计算的是不超过maxInde       // 比如maxIndexSize=1234567，entrySize=8，那么调整后的文件长度为1234560       raf.setLength(roundDownToExactMultipl
```

这些代码最主要的作用就是创建 mmap 对象。要知道，AbstractIndex 其他大部分的操作都是和 mmap 相关。

AbstractIndex：这是 Kafka 所有类型索引的抽象父类，里面的 mmap 变量是实现索引机制的核心，你一定要掌握它。

- **改进版二分查找算法**

现在，最新索引项保存在 Page #13 中。如果要查找最新索引项，原版二分查找算法将会

依次访问 Page #0、7、10、12 和 13。此时，问题来了：Page 7 和 10 已经很久没有被

访问过了，它们大概率不在页缓存中，因此，一旦索引开始征用 Page #13，就会发生

**Page Fault，**等待那些**冷页数据从磁盘中加载到页缓存**。根据国外用户的测试，这种加载

过程可能长达 1 秒。

- **位移索引和时间戳索引**

{% asset_img  kafka3.jpg  %}


**参考：**
**04 | 索引（上）：改进的二分查找算法在Kafka索引的应用**
**05丨索引（下）：位移索引和时间戳索引的区别是什么？**

---

## 日志模块 Q&A

+    简述Kafka的日志目录结构
+    Kafka中有那些索引文件？
+    如果我指定了一个offset，Kafka怎么查找到对应的消息？
+    如果我指定了一个timestamp，Kafka怎么查找到对应的消息？
+    聊一聊你对Kafka的Log Retention的理解
+    聊一聊你对Kafka的Log Compaction的理解
+    聊一聊你对Kafka底层存储的理解（页缓存、内核层、块层、设备层）
+    kafka的mmap是对写的优化，还是读的优化？

# 参考
{% post_link 'zeroCopy' %} self
