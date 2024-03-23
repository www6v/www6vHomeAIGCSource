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

10. [FSDP 深度解析：2023 年了，大模型训练还要不要用 PyTorch 的 FSDP ？](https://zhuanlan.zhihu.com/p/644133265)

1xx. [【深度学习】【分布式训练】DeepSpeed：AllReduce与ZeRO-DP](https://zhuanlan.zhihu.com/p/610587671)

1xx. [Zero系列三部曲：Zero、Zero-Offload、Zero-Infinity](https://blog.csdn.net/qq_18555105/article/details/130513812)

1xx. [图解大模型训练之：数据并行下篇( DeepSpeed ZeRO，零冗余优化)](https://zhuanlan.zhihu.com/p/618865052)