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

## 目录
<!-- toc -->

# DeepLearning [1]
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

# 模型训练[2]
+ 两个要素
  + 一个**数据集**
  + 一个**损失函数**

+ 模型训练
  - 本质上是一个求解最优化问题的过程
  - 怎么求解
    - 梯度下降与凸问题
      梯度决定了函数变化的方向，每次迭代更新我们会**收敛到一个极值**
    - mini-batch梯度下降
      条件允许的情况下，**Batch Size尽量大些**      
    - **学习率**
      - 学习率也很关键，甚至需要**动态调整** 
        适当调整学习率（Learning Rate），**避免陷入很差的局部解或者跳过了好的解**  
      - 学习率，它和梯度的模数共同决定了**每步走多远**

# 求解器[2]
+ 最常用的就是 **Adam** 或者 **AdamW**

# 常用的损失函数[2]
+ 两个数值的差距
+ 两个向量之间的（欧式）距离
+ 两个向量之间的夹角（余弦距离）
+ 两个概率分布之间的差异，**交叉熵**

# 常用的超参[2]
### 过拟合与欠拟合
+ 防止过拟合的方法（1）：**Weight Decay**
  惩罚参数的复杂性
+ 防止过拟合的方法（2）：**Dropout**
 在前向传播的时候，概率性的（临时）删除一部分神经元，这样可以使模型泛化性更强，因为它不会太依赖某些局部的特征
 
### 学习率调整策略
+ 开始时学习率**大**些：快速到达最优解附近
+ 逐渐**减小**学习率：避免跳过最优解
+ NLP 任务的损失函数有很多“悬崖峭壁”，自适应学习率更能处理这种极端情况，**避免梯度爆炸**。

+ **防止过拟合的方法（3）**：**学习率 Warm Up**
  - 先从一个很小的学习率逐渐上升到正常学习率，在稳步减小学习率

# 自然语言处理常见的网络结构[3]
### 文本卷积神经网络 TextCNN
+ how
  + 一个窗口的卷积和Pooling过程

+ why
  - 参数量较少、好训练、算力要求低
  - 适合**文本分类**问题
  - 善于表示**局部特征（卷积窗口）**，不擅长表示长上下文依赖关系

### 循环神经网络 RNN
+ 简易 RNN  
  最大问题是随着序列长度增加，**梯度消失或爆炸**
+ LSTM 和 GRU
  通过「门」来控制上文的状态被记住还是遗忘，同时防止梯度消失或爆炸
  
  
# 参考
1. [系统论文阅读研讨会week9：机器学习系统（一）](https://www.bilibili.com/video/BV1GA41157mJ/) V ***
    [W9：机器学习系统（一）](https://learn-sys.github.io/cn/reading/) ***  对应的PPT
  
2. 《11-机器学习基础-上》AI 大模型全栈工程师培养计划_2
   [课件](https://github.com/www6v/fullStackLLM/blob/master/08-fine-tuning/index.ipynb) 

3. 《12-机器学习基础-下》AI 大模型全栈工程师培养计划_2
    [课件](https://github.com/www6v/fullStackLLM/blob/master/08-fine-tuning/index.ipynb) 
   
1xx. [吴恩达：28张图全解深度学习知识](https://zhuanlan.zhihu.com/p/461925341)

