---
title: 文档智能
date: 2023-04-19 06:18:08
tags:
  - DocumentAI
categories: 
  - AIGC
  - DocumentAI
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 文档理解 [10]
### 基于大模型的OCR-FREE微调方案
+ LLaVAR [12]
+ TextMonkey [11]

### 文档版式分析数据集


# 其他
### mPLUG-DocOwl1.5  [20]
DocOwl1.5由mPLUG-Owl2初始化，使用**ViT/L-14作为视觉编码器**，并使用带有模态自适应模块的7B大模型作为**解码器**。
每个子图像由ViT/L-14编码为1,024个特征，然后由**H-Reducer缩减为256个特征**。

### TextMonkey [20]
为了减少图像特征的冗余，继承了**Qwen-VL**中的图像**重采样器**，在每个窗口中都会使用。

# 参考
10. [值得一看的文档理解前沿方案及版式分析开源数据：三种模式、九大数据集 ](https://mp.weixin.qq.com/s/FsjoUUFssMv2UkbxM-IJ3A)
11. [Monkey](https://github.com/Yuliang-Liu/Monkey)
    [Monkey Demo](http://vlrlab-monkey.xyz:7684/)
12. [LLaVAR：增强的视觉指令微调](https://zhuanlan.zhihu.com/p/670175648)
    [LLaVAR: Enhanced Visual Instruction Tuning for Text-rich Image Understanding](https://llavar.github.io/)
    

1xx. [加速 Document AI (文档智能) 发展](https://huggingface.co/blog/zh/document-ai)
    [加速 Document AI (文档智能) 发展](https://baijiahao.baidu.com/s?id=1755096032832674219&wfr=spider&for=pc)

1xx. [阿里面向企业数字化的文档智能技术与应用](https://mp.weixin.qq.com/s/d2Nns1qashMbcXPMG-4McQ)


### 其他
20. [也看跨模态大模型遇见文档理解：mPLUG-DocOwl1.5及TextMonkey方案中的数据工程 ](https://mp.weixin.qq.com/s/1MSOZfbKcPW1BTT4f9XvQg) 