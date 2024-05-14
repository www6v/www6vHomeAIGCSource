---
title: (对比学习)CLIP
date: 2023-02-29 15:56:58
tags:
  - multimodal
categories:
  - AIGC  
  - multimodal
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# CLIP 在训练过程中做了哪些事情？[Elmo][1]

在训练过程中，CLIP（Contrastive Language-Image Pre-training）模型主要进行了以下几个步骤：

1. **数据预处理** : CLIP 使用了一个大规模的数据集，包含 4 亿个 “图像 - 文本” 对，这些数据需要进行清洗和预处理，以便于模型学习。
2. **特征提取** : 通过 Text Encoder 和 Image Encoder 分别对文本和图像进行特征提取。Text Encoder 通常是基于 Transformer 的模型，而 Image Encoder 可以是基于 CNN（卷积神经网络）或者 VIT（Vision Transformer）的模型。
3. **对比学习** : CLIP 采用对比学习的策略，通过对比正确的图像 - 文本对与错误的图像 - 文本对，使得模型能够学习到正确对的特征表示与其他对的区分。具体来说，CLIP 通过 InfoNCE 损失函数来最大化正确对的相似度，同时最小化错误对的相似度。
4. **特征空间对齐** : 通过对比学习，CLIP 将图像和文本的特征映射到一个共享的多模态特征空间中，使得图像特征和文本特征可以直接进行相似度比较。
5. **参数优化** : 通过反向传播和梯度下降等方法，不断调整模型参数，以最小化损失函数，从而优化模型性能。
6. **Zero-shot 推理能力的培养** : 在训练过程中，CLIP 学习了如何通过文本提示（prompts）来进行 zero-shot 的图像分类，即在没有直接观测到的类别标签下，通过文本描述来识别图像内容。
7. **模型评估与调整** : 通过在验证集上的评估，调整模型结构和超参数，以提高模型的泛化能力和性能。

通过这些训练步骤，CLIP 能够学习到一个强大的多模态特征表示，使其能够在多种视觉任务上进行 zero-shot 或 few-shot 的推理。

# CLIP Zero-shot推理[1]
### 步骤
- 首先，我们创建一个**标签全集**，如图中（2）所示，并得到每一个**标签的特征向量**
- 然后，我们取一张图片，如图中（3）所示，过Image Encoder后得到该**图片的特征向量**
- 最后，计算图片向量和文字向量间的**相似度**，取相似度最高的那条label即可。

### 局限
  当你喂给CLIP一张图时，不管这张图片它是否有见过，CLIP都不会生成一个全新的标签，而是去全集标签中找一个最相似的给你。


# 参考
1. [关于多模态经典之作CLIP，还有哪些细节是你不知道的](https://zhuanlan.zhihu.com/p/660476765) 代码
   
1xx. [神器CLIP：连接文本和图像，打造可迁移的视觉模型](https://zhuanlan.zhihu.com/p/493489688) ***
1xx. [【CLIP系列Paper解读】CLIP: Learning Transferable Visual Models From Natural Language Supervision](https://zhuanlan.zhihu.com/p/486857682) ***
1xx. [CLIP 模型解读](https://zhuanlan.zhihu.com/p/646790176)
1xx. [详解CLIP (一) | 打通文本-图像预训练实现ImageNet的zero-shot分类，比肩全监督训练的ResNet50/101](https://zhuanlan.zhihu.com/p/521151393)
1xx. [openai多模态大模型：clip详解及实战](https://blog.csdn.net/lsb2002/article/details/132275132)
1xx. [CLIP：多模态领域革命者](https://zhuanlan.zhihu.com/p/555314976)


### 实战
1xx. [open_clip Repo](https://github.com/mlfoundations/open_clip) git
1xx. [Chinese-CLIP Repo](https://github.com/www6v/Chinese-CLIP) git
1xx. langchain 中有CLIP的实现
