---
title: (原理)分布式并行Training 
date: 2023-01-06 05:51:54
tags:
  - train
categories:
  - AIGC  
  - train
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


# 分布式并行 [1]
{% asset_img 'pararllelTraining.jpg' %}

### 数据并行 [4]
数据并行可以分为**中心化方式**的和**无中心化方式**的，对应于pytorch里面的**DataParallel**和**DistributedDataParallel(DDP)**

### 模型并行 
**张量并行**与**流水线并行**都属于**模型并行**，
区别在于对模型参数的切分“方向”不同：
**张量并行**把模型的**每层进行切分 (intra-layer)**，而**流水线并行**则**按层进行切分 (inter-layer) 并在不同设备处理**。[2]


##### 张量并行 [3]
 {% asset_img 'tensor.png' %}

+ Megatron-LM（1D）
+ Colossal-AI（2D、2.5D、3D）

#####   流水线并行 [3]
{% asset_img 'pipeline.png' %}

+ GPipe
+ PipeDream

### 多维混合并行[5]
##### DP + PP
##### 3D 并行（DP + PP + TP）
##### ZeRO-DP + PP + TP


# 框架
+ Megatron-LM（张量并行）
+ DeepSpeed（Zero-DP）
+ Colossal-AI（高维模型并行，如2D、2.5D、3D）
+ Alpa（自动并行）



# 流水线并行（Pipeline Parallelism, PP）[4][kimi]

引入流水线并行（Pipeline Parallelism, PP）后可能会存在以下**问题**以及相应的**优化方法**：

### 可能存在的问题

1. **理论上界与朴素串行方式的差异**：在理想情况下，不需要流水线并行，直接对mini-batch的样本做前向和反向操作。**朴素串行方式会导致硬件利用率低，因为每个micro-batch串行逐个做前向和反向，导致大量计算资源闲置**。

2. **Gpipe流水线并行的等待时间**：**Gpipe流水线并行需要等所有micro-batch都计算完才能执行反向过程**，这会导致额外的等待时间，增加了总耗时。

3. **硬件资源的浪费**：由于不同阶段的计算吞吐不同，可能会导致硬件资源的浪费。

### 如何优化

1. **Bubble Ratio分析**：定义**bubble ratio**来衡量流水线算法对硬件的浪费程度，值越小说明流水线效率越高。通过调整micro-batch的大小，可以减少气泡空腔的面积，提高硬件利用率。

2. **Micro-batch大小分析**：通过调整micro-batch的大小b，可以使得流水线并行的额外耗时尽可能小。这通常需要通过实际测试来进行性能分析。

3. **PipeDream (Non-Interleaved 1F1B)**：**通过解耦同一个mini-batch的不同micro-batch，允许它们独立地进行前向和反向计算**，从而减少显存的使用，并提高硬件资源的利用率。

4. **Interleaved 1F1B**：将流水线切分更细，使得每个设备可以分配更多的算力，减少了每个layer的计算时间，从而减少了总耗时。

5. **Re-materialization（Checkpointing）**：使用checkpoint技术，即只保留每个stage的输入activation，并在backward时从stage开头重新计算，以减少显存占用。

6. **优化通信策略**：对于跨mesh的通信，使用优化策略，如scatter-gather或all-gather，以减少通信开销。

7. **动态规划求解**：使用动态规划来优化子图和计算资源的划分，减少计算图中的非密集型算子，以降低搜索空间。

8. **Alpa自动化搜索**：Alpa通过数学建模和优化来寻找接近最优的并行策略，可以自动化地搜索并行策略，减少人工设计的工作量。

通过上述方法，可以在一定程度上优化流水线并行带来的问题，提高模型训练的效率和硬件资源的利用率。



# 参考
### 
1. [How to Train Really Large Models on Many GPUs? ](https://lilianweng.github.io/posts/2021-09-25-train-large/)

2. [大模型分布式训练的并行策略](https://finisky.github.io/how-to-train-large-language-model/) *

3. [大模型并行训练指南：通俗理解Megatron-DeepSpeed之模型并行与数据并行](https://blog.csdn.net/v_JULY_v/article/details/132462452)  ***

4. [[Transformer 101系列] LLM分布式训练面面观](https://zhuanlan.zhihu.com/p/664604792) ***

5. [大模型分布式训练并行技术（六）-多维混合并行](https://zhuanlan.zhihu.com/p/661279318)

6. [上半年大模型遍地开花，大模型发展中有哪些经验和教训？](https://www.zhihu.com/question/601594836/answer/3032763174) 分布式训练框架


1xx. [大模型分布式训练并行技术（一）-概述](https://zhuanlan.zhihu.com/p/598714869)

1xx. [分布式训练硬核技术——通信原语](https://zhuanlan.zhihu.com/p/465967735) 

1xx. [图解大模型训练之：流水线并行（Pipeline Parallelism），以Gpipe为例](https://zhuanlan.zhihu.com/p/613196255)  系列文章 

1xx. [图解大模型训练之：张量模型并行(TP)，Megatron-LM](https://zhuanlan.zhihu.com/p/622212228) ***


1xx. [全网最全-超大模型+分布式训练架构和经典论文](https://zhuanlan.zhihu.com/p/450854172) 

1xx. [大规模训练系列之技术挑战](https://zhuanlan.zhihu.com/p/350707888)

### 实战
1xx. [大模型流水线并行（Pipeline）实战](https://zhuanlan.zhihu.com/p/636488690)

### 其他
1xx. [第1章：DeepSpeed-Chat 模型训练实战](https://techdiylife.github.io/big-model-training/deepspeed/deepspeed-chat.html)  Bili 
      [DeepSpeed-Chat](https://github.com/microsoft/DeepSpeedExamples/tree/master/applications/DeepSpeed-Chat)