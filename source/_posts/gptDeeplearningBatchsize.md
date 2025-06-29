---
title: (原理)Batchsize
date: 2024-01-17 18:45:59
tags:
  - deepLearning
categories: 
  - AIGC
  - deepLearning   
---

<p></p>
<!-- more -->

# 最佳实践

### batchsize

- batchsize  下限 [1]

别太小的限制在于，**batch size太小，会来不及收敛。**

所以在常见的setting（～100 epochs），batch size一般不会低于16。

- batchsize 上限   [1]

batch size别太大的限制在于两个点，

1）batch size太大，memory容易不够用。这个很显然，就不多说了。

2）**batch size太大，深度学习的优化（training loss降不下去）和泛化（generalization gap很大）都会出问题。**

### **learning rate & batch size**

总之，可以证明，**learning rate/batch size的比值对深度学习是有指数级的影响**[3]，所以非常重要，没事别瞎调。[1]

**这也是为什么大的batch_size往往建议可以相应取大点[learning_rate](https://zhida.zhihu.com/search?content_id=462989051&content_type=Answer&match_order=1&q=learning_rate&zhida_source=entity), 因为梯度震荡小，大**learning_rate**可以加速收敛过程，也可以防止陷入到局部最小值，而小batch_size用小learning_rate迭代，防止错过最优点，一直上下震荡没法收敛（这也是一个小trick）**。[2]

# 参考

1. [怎么选取训练神经网络时的Batch size?](https://www.zhihu.com/question/61607442/answer/1875700191)  Summer Clover
2. [训练神经网络时batchsize扩大一倍的同时需要增加epoch数量吗?](https://www.zhihu.com/question/456600260/answer/2380983385) 新一

- [7.1 批大小调整实验](https://www.notion.so/7-1-174bfe21108480a7a702e4ebed99f68f?pvs=21) 百度邱

  [7.1 批大小调整实验](https://aistudio.baidu.com/education/lessonvideo/3048883)

- [设置BatchSize](https://zhuanlan.zhihu.com/p/148267858)

- [深度学习中的batch的大小对学习效果有何影响？](https://www.zhihu.com/question/32673260/answer/3356342576)
