---
title: (原理)Diffusion
date: 2023-06-29 17:28:21
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


# Diffusion
### DDPM 实现噪声到图片步骤[1]

DDPM实现从噪声生成图像的步骤就清晰了：

1. **前向过程：将原图逐步添加噪声， 共1000步**
2. **反向过程：利用神经网络学习加噪图像到噪声的变换，使得模型可以去噪**
3. **推理使用：随机采样，得到高斯噪声，然后逐步去噪，经过1000步去噪，得到清晰图像。**
{% asset_img  '1.jpg' %}

### DDPM 模型结构[1]

{% asset_img  'ddpm-struct.png' %}

### DDPM——训练[4]
+ 训练过程 - 正向
{% asset_img  'train1.jpg' %}

+ 训练过程 - 反向 predict noise 
{% asset_img  'train2.jpg' %}


### DDPM——推理[4]
+ 生图-推理
{% asset_img  'infer.jpg' %}


### Diffusion Model 拓展 —— Stable Diffusion [1]
Stable Diffusion 背后的技术是**LDM（latent diffusion model）**


LDM论文中有一幅图很好的解释了LDM的思想：首先在pixel space，需要有encoder和decoder，在latent space采用了多头注意力机制，并且除了时间步信息，加入了conditioning模块，其中的引导信息可以是文本、图片、表征向量等等一切内容，然后为引导信息配一个embedding模块，就可以将引导信息加入模型中。

SD是一个**基于latent的扩散模型**，它在UNet中引入text condition来实现基于文本生成图像。SD的核心来源于[Latent Diffusion](https://link.zhihu.com/?target=https%3A//arxiv.org/abs/2112.10752)这个工作，常规的扩散模型是基于pixel的生成模型，而Latent Diffusion是基于latent的生成模型，它先采用一个autoencoder将图像压缩到latent空间，然后用扩散模型来生成图像的latents，最后送入autoencoder的decoder模块就可以得到生成的图像。[3]

{% asset_img  'ldm.jpg' %}


SD模型的主体结构如下图所示，主要包括三个模型：

- **autoencoder**：encoder将图像压缩到latent空间，而decoder将latent解码为图像；
- **CLIP text encoder**：提取输入text的text embeddings，通过cross attention方式送入扩散模型的UNet中作为condition；
- **UNet**：扩散模型的主体，用来实现文本引导下的latent生成。
{% asset_img  '3.jpg' %} 


这里配上李宏毅老师的结构示意图，可知道LDM的核心在于2当中，处理的不再是像素空间，而是一个特征空间
{% asset_img  '2.jpg' %}


# SD的主要应用[3]

- 文生图
- 图生图
- 图像inpainting

# SD的其它特色应用[3]

- **个性化生成**  【fine-tuning】
  英伟达的[Textual Inversion](https://link.zhihu.com/?target=https%3A//arxiv.org/abs/2208.01618)和谷歌的[DreamBooth](https://link.zhihu.com/?target=https%3A//arxiv.org/abs/2208.12242)

- **风格化finetune模型** 【fine-tuning】
  目前finetune SD模型的方法主要有两种：一种是直接finetune了UNet，但是容易过拟合，而且存储成本；另外一种低成本的方法是基于微软的[LoRA](https://link.zhihu.com/?target=https%3A//arxiv.org/abs/2106.09685)，LoRA本来是用于finetune语言模型的，但是现在已经可以用来finetune SD模型了，具体可以见博客[Using LoRA for Efficient Stable Diffusion Fine-Tuning](https://link.zhihu.com/?target=https%3A//huggingface.co/blog/lora)。

- **图像编辑** 【image edit】
  谷歌的[prompt-to-prompt](https://link.zhihu.com/?target=https%3A//prompt-to-prompt.github.io/)和加州伯克利的[instruct-pix2pix](https://link.zhihu.com/?target=https%3A//www.timothybrooks.com/instruct-pix2pix)

- **可控生成** 【controllable】 
  可控生成是SD最近比较火的应用，这主要归功于[ControlNet](https://link.zhihu.com/?target=https%3A//github.com/lllyasviel/ControlNet)，基于ControlNet可以实现对很多种类的可控生成，比如边缘，人体关键点，草图和深度图等等。

# Evolution [5]
{% asset_img  'evolution-line.jpg' %}

{% asset_img  'evolution.jpg' %}


# 参考
1. [8.6 扩散模型——DDPM · PyTorch实用教程（第二版）](https://tingsongyu.github.io/PyTorch-Tutorial-2nd/chapter-8/8.6-diffusion-model.html)
2. https://github.com/CompVis/stable-diffusion
3. [文生图模型之Stable Diffusion](https://zhuanlan.zhihu.com/p/617134893)
4. [38.(正课)Stable Diffusion、DALL-E、Imagen 背后_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1Pg4y1M7Lr?p=3)
   [course PPT](https://speech.ee.ntu.edu.tw/~hylee/ml/ml2023-course-data/StableDiffusion%20(v2).pdf)
5. [【扩散生成模型串讲】一个视频梳理Diffusion模型演化进程，16个扩散相关生成模型，20+篇相关论文串讲。_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV13J4m1K73z/) V



