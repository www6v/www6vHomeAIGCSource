---
title: Flink 端到端Exactly-once
date: 2022-02-01 22:30:47
tags:
  - flink
categories: 
  - 大数据 
  - 计算  
  - 流式计算 
  - flink
---

<p></p>
<!-- more -->

##  实现端到端Exactly-once[1][2][3]

(1)启动检查点保存
(2)算子任务对状态做快照
(3)Sink 任务开启事务，进行预提交
(4)检查点保存完成，提交事务

{% asset_img  flinkExactlyOnce.png  Flink Exactly-Once %}

  Once all of the operators complete their pre-commit, they issue a commit.
  If at least one pre-commit fails, all others are aborted, and we roll back to the previous successfully-completed checkpoint.
  After a successful pre-commit, the commit must be guaranteed to eventually succeed – both our operators and our external system need to make this guarantee. If a commit fails (for example, due to an intermittent network issue), the entire Flink application fails, restarts according to the user’s restart strategy, and there is another commit attempt. This process is critical because if the commit does not eventually succeed, data loss occurs.

[关键:  barrier , pre-commit，commit]



## Flink 端到端Exactly-once 是怎么实现的？ [Cursor]

To achieve end-to-end exactly-once semantics in Flink, the framework uses a combination of **checkpointing and transactional sources/sinks**.

Checkpointing is a mechanism that allows Flink to take a snapshot of the state of the application at regular intervals. This state includes the state of all operators in the application, as well as the progress of any ongoing transactions. In the event of a failure, Flink can use the latest checkpoint to restore the state of the application and resume processing from where it left off.

Transactional sources and sinks are sources and sinks that support transactions. These sources and sinks ensure that data is only read or written if the transaction is committed. If a transaction fails, any changes made by that transaction are rolled back, ensuring that the data remains consistent.

By combining checkpointing with transactional sources and sinks, Flink can guarantee end-to-end exactly-once semantics. If a failure occurs, Flink can use the latest checkpoint to restore the state of the application, and any transactions that were in progress at the time of the failure will be rolled back. When the application resumes processing, it will start from the last successfully committed transaction, ensuring that no data is lost or duplicated.

For more information on how to implement exactly-once semantics in Flink, you can refer to the official documentation: https://ci.apache.org/projects/flink/flink-docs-release-1.13/docs/deployment/transactional/




## 参考：
1. [Flink端到端Exactly-once](https://zhuanlan.zhihu.com/p/68797265) 王星辰
2. [An Overview of End-to-End Exactly-Once Processing in Apache Flink (with Apache Kafka, too!)](https://flink.apache.org/features/2018/03/01/end-to-end-exactly-once-apache-flink.html)   official
3. 尚硅谷 flink(Java) - bilibili   ***
4. [端到端一致性,流系统Spark/Flink/Kafka/DataFlow对比总结(压箱宝具呕血之作)](https://zhuanlan.zhihu.com/p/77677075) 原理 - aws SDE - 未
5. {% post_link 'flinkCheckpoint' %}  self




