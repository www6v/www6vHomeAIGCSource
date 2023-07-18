---
title: Flink Checkpoint-分布式快照方法
date: 2022-02-03 21:31:11
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

## 目录
<!-- toc -->

# 原理 [1]
###   CheckPoint的保存
  **当所有任务都恰好处理完一个相同的输入数据的时候，将它们的状态保存下来**

###  从CheckPoint恢复状态
（1）重启应用
（2）**读取检查点，重置状态**
（3）**重放数据**
    重置偏移量
（4）继续处理数据

###  CheckPoint 算法
+  检查点的“分界线”（Checkpoint Barrier） 
watermark 指示的是“之前的数据全部到齐了”，而 barrier 指示的是“之前所有数据的状
态更改保存入当前检查点”：它们都是一个“截止时间”的标志。

+ 分布式快照算法
  - Flink 使用了 Chandy-Lamport 算法的一种变体，被称为**“异步分界线快照” (asynchronous barrier snapshotting)算法**。
  - 算法的核心两个原则:
    1. 当上游任务向多个并行下游任务发送** barrier** 时，需要广播出去;
    2. 而当多个上游任务向同一个下游任务传递 barrier 时， 需要在下游任务执行**“分界线对齐”(barrier alignment)**操作，也就是需要等到所有并行分区 的 barrier 都到齐，才可以开始状态的保存。

# 原理 [5]
### 分布式场景的状态容错
Flink 分布式场景的作业拓扑是**有向无环并且是弱联通图**。可以**采用裁剪的Chandy-Lamport**，记录所有输入的offset和各个算子状态，依赖 rewinding source 从而**不需要存储 channel 的状态**。这在存在聚合逻辑的情况下可以**节省大量的存储空间**。

最后做恢复，恢复就是把数据源的位置重新设定，然后每一个算子都从检查点恢复状态。

### Flink 的分布式快照方法
首先在源数据流里插入**Checkpoint barrier**，也就是上文提到的**Chandy-Lamport算法里的marker message**，不同的Checkpoint barrier会把流自然地切分多个段，每个段都包含了Checkpoint的数据；

Flink 里有一个**全局的 Coordinator**，它不像 Chandy-Lamport 对任意一个进程都可以发起快照，这个集中式的 Coordinator会把 Checkpoint barrier 注入到每个 source 里，然后启动快照。

当每个节点收到 barrier 后，因为 Flink 里面它不存储 Channel state，所以它**只需存储本地的状态**就好。

在做完了Checkpoint 后，**每个算子的每个并发都会向Coordinator发送一个确认消息**，当所有任务的确认消息都被Checkpoint Coordinator接收，快照就结束了。

# 实践
### API [2] [3]
+ 默认不开启 checkpoint

``` Java
StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
// start a checkpoint every 1000 ms
env.enableCheckpointing(1000);
// advanced options:
// set mode to exactly-once (this is the default)
env.getCheckpointConfig().setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE);
// checkpoints have to complete within one minute, or are discarded
env.getCheckpointConfig().setCheckpointTimeout(60000);
// make sure 500 ms of progress happen between checkpoints
env.getCheckpointConfig().setMinPauseBetweenCheckpoints(500);
// allow only one checkpoint to be in progress at the same time
env.getCheckpointConfig().setMaxConcurrentCheckpoints(1);
// enable externalized checkpoints which are retained after job cancellation
env.getCheckpointConfig().enableExternalizedCheckpoints(ExternalizedCheckpointCleanup.RETAIN_ON_CANCELLATION);
// This determines if a task will be failed if an error occurs in the execution of the task’s checkpoint procedure.
env.getCheckpointConfig().setFailOnCheckpointingErrors(true);
```

``` Java 
StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
// 每 60s 做一次 checkpoint
env.enableCheckpointing(60000);
// 高级配置：
// checkpoint 语义设置为 EXACTLY_ONCE，这是默认语义
env.getCheckpointConfig().setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE);
// 两次 checkpoint 的间隔时间至少为 1 s，默认是 0，立即进行下一次 checkpoint
env.getCheckpointConfig().setMinPauseBetweenCheckpoints(1000);
// checkpoint 必须在 60s 内结束，否则被丢弃，默认是 10 分钟
env.getCheckpointConfig().setCheckpointTimeout(60000);
// 同一时间只能允许有一个 checkpoint
env.getCheckpointConfig().setMaxConcurrentCheckpoints(1);
// 最多允许 checkpoint 失败 3 次
env.getCheckpointConfig().setTolerableCheckpointFailureNumber(3);
// 当 Flink 任务取消时，保留外部保存的 checkpoint 信息
env.getCheckpointConfig().enableExternalizedCheckpoints(ExternalizedCheckpointCleanup.RETAIN_ON_CANCELLATION);
// 当有较新的 Savepoint 时，作业也会从 Checkpoint 处恢复
env.getCheckpointConfig().setPreferCheckpointForRecovery(true);
// 允许实验性的功能：非对齐的 checkpoint，以提升性能
env.getCheckpointConfig().enableUnalignedCheckpoints();
```

###  使用经验[4][N AI]
1. 当 Checkpoint 时间比设置的间隔时间长时，可以设置 Checkpoint 间最小时间间隔。这样不会立即进行下一次 Checkpoint，从而减少系统在 Checkpoint 方面的资源消耗，确保任务计算资源的充足。
2. 如果 Flink 状态很大，在恢复时需要从远程存储读取状态，状态文件过大可能导致任务恢复很慢，浪费时间在网络传输方面。建议开启 Flink Task 本地状态恢复，加快状态恢复速度。
3. 可以增加 Checkpoint 保存数，以便在最新的 Checkpoint 恢复失败时回滚到之前的 Checkpoint 进行恢复。
4. 建议设置的 Checkpoint 间隔时间大于完成时间。


# 参考
1. 尚硅谷 flink(Java) - bilibili 
    《尚硅谷大数据技术之flink（java）》 第 10 章 容错机制
2. [[1143]Flink的Checkpoint和Savepoint](https://blog.csdn.net/xc_zhou/article/details/124898733) 
3. [Flink Checkpoint 参数详解](https://www.shuzhiduo.com/A/xl56qQM9Jr/)
4. [有赞实时任务优化：Flink Checkpoint 异常解析与应用实践](https://zhuanlan.zhihu.com/p/112876846)
5. [课时5: 《 Fault-tolerance in Flink》](https://developer.aliyun.com/learning/course/58/detail/1071)  阿里云  《Apache Flink 入门》 ***
100. [(十)简单解释: 分布式数据流的异步快照(Flink的核心)](https://zhuanlan.zhihu.com/p/43536305) 原理 - aws SDE - 未 *** 
101. [基于 Log 的通用增量 Checkpoint](https://xie.infoq.cn/article/f89ea4c1e06004f617b7ae0a7)  未  阿里

