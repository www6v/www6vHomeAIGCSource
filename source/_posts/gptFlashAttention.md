---
title: (原理)Flash Attention
date: 2023-06-13 09:41:12
tags:
  - FlashAttention
categories: 
  - AIGC
  - FlashAttention
---

<p></p>
<!-- more -->



# 核心要点[1]
- 为什么**加快了计算**？Fast
    - **降低了耗时的HBM访问次数**。采用Tiling技术分块**从HBM加载数据到SRAM进行融合计算**。

- 为什么**节省了内存**？Memory-Efficient
     - **不再对中间矩阵S，P进行存储**。在反向的时候通过Recomputation重新计算来计算梯度。
     
- 为什么是**精准注意力**？Exact Attention
  - 算法流程只是**分块计算**，无近似操作。        

# 参考
1. [FlashAttention: 更快训练更长上下文的GPT【论文粗读·6】](https://www.bilibili.com/video/BV1SW4y1X7kh?spm_id_from=333.880.my_history.page.click) v

[FlashAttention: 更快训练更长上下文的GPT](https://readpaper.feishu.cn/docx/AC7JdtLrhoKpgxxSRM8cfUounsh)

1xx. [论文分享：新型注意力算法FlashAttention](https://www.bilibili.com/video/BV1zs4y1J7tb?spm_id_from=333.880.my_history.page.click) v

1xx.  [*Flash*Attention与标准注意力机制模型比较](https://www.bilibili.com/video/BV1he411d7on?spm_id_from=333.880.my_history.page.click) v

1xx. [*flash*attention原理深入分析](https://www.bilibili.com/video/BV1Kj411e7gJ?spm_id_from=333.880.my_history.page.click) v

 