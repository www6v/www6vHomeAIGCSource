---
title: (图生文)BLIP-2, Flamingo
date: 2023-03-15 23:00:59
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

# BLIP-2
### Overview [1]
用一个Qformer来提取图像特征（等同与Flamingo的perceiver resampler），然后用cross- attention进行多模态交互，此时视觉编码器和LLM都会被冻结，**只训练Qformer**，而在下游任务微调时，可以再解锁视觉编码器，让它跟Qformer一起训练

### 两阶段的训练策略 [1]
BLIP-2设计了两阶段的训练策略，以使视觉编码器能学会提取更关键的信息。
+ 第一阶段：使用多种预训练任务，如Image-Text Contrastive Learning(**ITC**)，Image-grounded Text Generation(**ITG**)，Image-Text Matching(**ITM**)让Qformer学会如何从**视觉编码器中抽取文本相关的特征**。
+ 第二阶段，将Qformer插入到LLMs中，用language modeling进行训练。



### 架构[3]
+ **两个阶段训练**
  + 阶段一
    获得高质量的 **图文对齐向量表征**
    通过**ITC ITM  ITG 三个损失函数**获得了很好的图片文本 **对齐向量表征能力**，仅训练**Qformer**中很少的参数
    【ITM:  image-text 是否是匹配的 |    image 和text 都能相互看到】
    【ITG: image生成text |    image 能全看到, text只能逐个的看】
    【ITC: image和text的对比学习, 对比学习分类分错了的  送入ITM 负样本 |  image和 text  之间是不能看到的】
  + 阶段二
    通过向量表征进行**文字生成**

### code [2]

# Flamingo[1]
### 架构
它在Frozen模型的基础上做进一步的改进，不同点主要有两个：一是使用了更大的LLMs，二是**冻结视觉编码器**，引入**perceiver resampler**和**XAttn-Dense**两个适配单元作为可训练的模块。
  - perceiver resampler：
      类似DETR，通过设计多个Perceiver Resampler来生成**64个固定长度的tokens**，主要作用在于可以**从图像中提取固定长度的特征向量**，能够解决图像甚至多帧视频的**feature map不一致的问题**。【图像和文本对齐】
  - XAttn-Dense：在每一层LLM上都会增加**corss- attention**以入到**LLM中与视觉向量进行交互**，**融合多模态信息**。【融合】



# 参考
### blip2
1.  [基于LLMs的多模态大模型（Flamingo, BLIP-2，KOSMOS-1，ScienceQA）](https://nakaizura.blog.csdn.net/article/details/130757157?spm=1001.2014.3001.5502)

2. [blip2](https://github.com/www6v/LAVIS/tree/main/projects/blip2) git
   [blip2_instructed_generation](https://colab.research.google.com/github/salesforce/LAVIS/blob/main/examples/blip2_instructed_generation.ipynb) git 运行过
   
3.  [强推！科大讯飞和中科院终于把多模态大模型讲明白了，CLIP、blip、blip2三种模型原理一口气学完](https://www.bilibili.com/video/BV1Ek4y1G74J) V *** 

1xx.  [AI论文精读之多模态大模型BLIP-2](https://www.bilibili.com/video/BV18u4y137ZV/) V

1xx. [MiniGPT-4实现原理及其核心BLIP2模型实践：从代表性图文对数据集、BLIP2模型结构到调用实践](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648400402&idx=1&sn=efd84698e6a207b2035995ec2e255417) *

1xx. [BLIP2：下一代多模态模型的雏形](https://zhuanlan.zhihu.com/p/606364639)

### Flamingo
1xx. [[论文速览]Flamingo: a Visual Language Model for Few-Shot Learning[2204.14198]](https://www.bilibili.com/video/BV1pu411G7ce) V
1xx.  [DeepMind出手！多模态小样本打败精调](https://zhuanlan.zhihu.com/p/511517344)
1xx. [Otter  on OpenFlamingo](https://github.com/Luodian/Otter) git
1xx. [open_flamingo](https://github.com/mlfoundations/open_flamingo) git


