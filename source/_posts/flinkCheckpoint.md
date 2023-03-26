---
title: Flink Checkpoint
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
  - Flink 使用了 Chandy-Lamport 算法的一种变体，被称为“异步分界线快照” (asynchronous barrier snapshotting)算法。
  - 算法的核心两个原则:
    1. 当上游任务向多个并行下游任务发送 barrier 时，需要广播出去;
    2. 而当多个上游任务向同一个下游任务传递 barrier 时， 需要在下游任务执行“分界线对齐”(barrier alignment)操作，也就是需要等到所有并行分区 的 barrier 都到齐，才可以开始状态的保存。

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


