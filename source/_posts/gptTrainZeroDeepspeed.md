---
title: (原理)Zero Deepspeed
date: 2023-03-23 09:48:55
tags:
  - Zero
categories: 
  - AIGC
  - Zero  
---

<p></p>
<!-- more -->


# ZeRO-DP [1] [2]
+ ZeRO-DP
  是一种**分布式数据并行**训练方法，通过**减少冗余数据**来降低每个设备的显存占用，从而允许训练更大的模型


### ZeRO-DP 三个优化阶段
{% asset_img 'zero.png' %}

以 Adam优化器，64张GPU为例计算

+ naive DP的通信量
通信量是**2X**
显存占用**16X**

+ ZeRO Stage 1 （Pos）
总的通信量为**2X，跟naive DP一致**
显存方面 约为**naive DP的 1/4**

+ ZeRO Stage 2 （Pos+g）
通信量也是**2X, 跟naive DP一致**
显存方面  约为**naive DP的1/8**

+ ZeRO Stage 3 （Pos+g+p）
总的通信量为，为**naive DP的1.5倍**，增加50%通信量
显存方面  约为**naive DP的1/32**

# ZeRO-Offload[3]
+ ZeRO-Offload[2]
ZeRO技术的一个扩展，它将部分数据和计算从GPU（或其他主要训练设备）卸载到CPU，从而减轻了GPU的显存负担，并使得在有限GPU资源下训练更大的模型成为可能


**现在要做的就是沿着边把数据流图切分为两部分，分别对应GPU和CPU，**计算节点（矩形节点）落在哪个设备，哪个设备就执行计算，数据节点（圆形）落在哪个设备，哪个设备就负责存储，将被切分的边权重加起来，就是CPU和GPU的通信数据量。
ZeRO-Offload的切分思路是：图中有四个计算类节点：**FWD、BWD、Param update和float2half**，前两个计算复杂度大致是 O(MB) ， B 是batch size，后两个计算复杂度是 O(M) 。为了不降低计算效率，**将前两个节点放在GPU，后两个节点不但计算量小还需要和Adam状态打交道，所以放在CPU上**，Adam状态自然也放在内存中，为了简化数据图，将前两个节点融合成一个节点**FWD-BWD Super Node**，将后两个节点融合成一个节点**Update Super Node**。如下图右边所示，沿着gradient 16和parameter 16两条边切分。

{% asset_img 'zeroOffload.png' %}


# DeepSpeed [2]
### Key feature
+  ZeRO（Zero Redundancy Optimizer）
+  模型并行（Model Parallelism）
+  流水线并行（Pipeline Parallelism）
+  稀疏注意力（Sparse Attention）
+  显存和带宽优化


# PyTorch FSDP [10]
FairScale 说 **FSDP 相当于 ZeRO3 的优化**


# 参考
1. [[Transformer 101系列] LLM分布式训练面面观](https://zhuanlan.zhihu.com/p/664604792) ***

2. 《大模型分布式训练框架Microsoft DeepSpeed》 Ai大模型微调

3. [震惊！我竟然在1080Ti上加载了一个35亿参数的模型（ZeRO, Zero Redundancy Optimizer）](https://blog.csdn.net/weixin_43336281/article/details/126475071)

10. [FSDP 深度解析：2023 年了，大模型训练还要不要用 PyTorch 的 FSDP ？](https://zhuanlan.zhihu.com/p/644133265)

1xx. [【深度学习】【分布式训练】DeepSpeed：AllReduce与ZeRO-DP](https://zhuanlan.zhihu.com/p/610587671)

1xx. [Zero系列三部曲：Zero、Zero-Offload、Zero-Infinity](https://blog.csdn.net/qq_18555105/article/details/130513812)

1xx. [图解大模型训练之：数据并行下篇( DeepSpeed ZeRO，零冗余优化)](https://zhuanlan.zhihu.com/p/618865052)

1xx. [Deepspeed大模型分布式框架精讲](https://www.bilibili.com/video/BV1mc411y7jW/)  V 原理+实操    *** 
