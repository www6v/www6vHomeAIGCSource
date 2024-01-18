---
title: Deep Learning
date: 2022-06-11 15:57:10
tags:
  - DeepLearning
categories:
  - AIGC
  - DeepLearning
---

<p></p>
<!-- more -->

## DeepLearning
+ Feedforward 前向传播
  + training
    Get some “ground truth” labeled data, a set of   (𝒙, 𝒚)    i.e. training data
  + Feedforward:   𝒚′= 𝒇(𝒙),  calculate loss: 𝑳(𝒚′, 𝒚)
  + Gradient Descent  

+ Backward
  + Backpropagation 反向传播
    算出每个权重的梯度
  
+ parameters learning
当我们要去训练一个神经网络的时候我们要做的事情就是先feedforward的前向传播, 
然后根据这个前向传播的结果算出所有权重的梯度，然后再把这个梯度呢 转换成一个update的值，去update每个权重。 

## 参考
1. [系统论文阅读研讨会week9：机器学习系统（一）](https://www.bilibili.com/video/BV1GA41157mJ/) ***
2. [W9：机器学习系统（一）](https://learn-sys.github.io/cn/reading/) ***  对应的PPT
100. [吴恩达：28张图全解深度学习知识](https://zhuanlan.zhihu.com/p/461925341)

