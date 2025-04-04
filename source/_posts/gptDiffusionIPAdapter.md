---
title: (原理|实战)IP-Adapter
date: 2023-08-22 18:26:51
tags:
  - Diffusion
categories: 
  - AIGC
  - Diffusion 
---

<p></p>
<!-- more -->

# 论文[IP-Adapter]

- 论文地址
[IP-Adapter: Text Compatible Image Prompt Adapter for Text-to-Image Diffusion Models](https://arxiv.org/pdf/2308.06721)
- 开源地址
[IP-Adapter](https://github.com/tencent-ailab/IP-Adapter) git
enable a pretrained text-to-image diffusion model to generate images **with image prompt**
有很多notebook的demo
- Project page
[Project page](https://ip-adapter.github.io/)

# IP-Adapter[10]

[IP-Adapter](https://hf.co/papers/2308.06721) is an image prompt adapter that can be plugged into diffusion models to
 enable image prompting without any changes to the underlying model. 
Furthermore, this adapter can be reused with other models finetuned from
 the same base model and it can be combined with other adapters like [ControlNet](https://huggingface.co/docs/diffusers/main/en/using-diffusers/controlnet). The key idea behind IP-Adapter is the *decoupled cross-attention*
 mechanism which adds a separate cross-attention layer just for image 
features instead of using the same cross-attention layer for both text 
and image features. This allows the model to learn more image-specific 
features.

[IP-Adapter](https://hf.co/papers/2308.06721) 是一种图像提示适配器，可以插入扩散模型以启用图像提示，而无需对底层模型进行任何更改。此外，该适配器**可以与从同一基本模型微调的其他模型重复使用**，并且**可以与其他适配器（如 [ControlNet](https://huggingface.co/docs/diffusers/main/en/using-diffusers/controlnet)）结合使用**。IP-Adapter背后的关键思想是***解耦的交叉注意力*机制**，该机制仅为图像特征添加了一个单独的交叉注意力层，而不是对文本和图像特征使用相同的交叉注意力层。这使模型能够学习**更多特定于图像的特征**。

# Method[2]

{% asset_img  '1723388369532.png' %}

**解耦注意力机制[1]**

IPAdapter提出的**解耦注意力机制decoupled cross attention**是指将**图像提示（image prompt）也看作是text**，按照上面的公式原理计算image prompt和查询特征  的cross attention，最后将text prompt计算的cross attention和image prompt计算的cross attention相加。

# 参考

1. [IPAdapter原理和代码解析](https://zhuanlan.zhihu.com/p/693224841)
2. [【腾讯】IP-Adapter论文解读，拿捏图生图，人脸更不在话下。](https://www.bilibili.com/video/BV1Zz421Q7wx/)   v

### 实战

10. [IP-Adapter](https://huggingface.co/docs/diffusers/main/en/using-diffusers/ip_adapter)  diffusers

1xx. [ip-adaptor on colab with diffusers](https://colab.research.google.com/drive/1srusRhcCYMasZ5pdO5nWHFhfLqB1sRhM) 运行过没异常

1xx. [IPAdapter 多个图像风格混合到一张图像上 comfyUI工作流](https://www.bilibili.com/video/BV1tz421S7gs/)  v 有代码