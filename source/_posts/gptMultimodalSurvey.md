---
title: (Survey)多模态  
date: 2023-03-16 12:45:30
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

# 论文
+ 论文地址
 《Multimodal Foundation Models:From Specialists to General-Purpose Assistants》 .Sep 2023   - microsoft

+ 开源地址
  [Computer Vision in the Wild (CVinW)](https://github.com/Computer-Vision-in-the-Wild/CVinW_Readings) 

# overview [0]
{% asset_img  'overview.jpeg' %}

# 视觉理解 [1]

{% asset_img  'understanding.png' %}

{% asset_img  'understanding-method.png' %}


# 视觉生成 [1]
### Human Alignments in Visual Generation
+ 四种alignment的方式 [10]
  - controllable
    Controlnet
  - editing
    instructPix2Pix
  - text prompts following
  - conception Customization
    DreamBooth
    {% asset_img  'align.jpg' %}
    {% asset_img  'generation.png' %}

### Text-to-Image Generation  技术流派（4类）
+ Generative adversarial networks (GAN)
+ Variational autoencoder (VAE)
+ Discrete image token prediction
+ Diffusion model

# 统一的视觉模型[2]

# 端到端的方式训练LLM[2]

# 多模态 Agent[3]

# 参考
### 翻译
《Multimodal Foundation Models:From Specialists to General-Purpose Assistants》  

0. [AGI之MFM：《Multimodal Foundation Models: From Specialists to General-Purpose Assistants多模态基础模型：从专家到通用助](https://blog.csdn.net/qq_41185868/article/details/133594461) 翻译
   
1. [AGI之MFM：《多模态基础模型：从专家到通用助手》翻译与解读之视觉理解、视觉生成](https://yunyaniu.blog.csdn.net/article/details/133594554)
   
2. [AGI之MFM：《多模态基础模型：从专家到通用助手》翻译与解读之统一的视觉模型、加持LLMs的大型多模态模型](https://yunyaniu.blog.csdn.net/article/details/133594624)
   
3. [AGI之MFM：《多模态基础模型：从专家到通用助手》翻译与解读之与LLM协同工作的多模态智能体、结论和研究趋势](https://yunyaniu.blog.csdn.net/article/details/133606408)

### 解读
10. [大模型系列04 -文本图像生成](https://zhuanlan.zhihu.com/p/669757416)

1xx.   [Multimodal Foundation Models: From Specialists to General-Purpose Assistants](https://blog.csdn.net/qq_41200212/article/details/134663233)  


1xx.  对应第二章节 
  [《Alignments in Text-to-Image Generation》](https://datarelease.blob.core.windows.net/tutorial/vision_foundation_models_2023/slides/Zhengyuan_Tutorial_T2I2023.pdf)
   [[CVPR2023 Tutorial Talk] Alignments in Text-to-Image Generation](https://www.bilibili.com/video/BV14P411v7Un/) V
   
1xx. 对应第三章节 
[《From Specialist to Generalist:
Towards General Vision Understanding Interface》](https://datarelease.blob.core.windows.net/tutorial/vision_foundation_models_2023/slides/Jianwei_CVPR2023_Tutorial.pdf)
  [[CVPR Tutorial Talk] Towards General Vision Understanding Interface](https://www.bilibili.com/video/BV1ds4y1k7pj/?vd_source=f6e8c1128f9f264c5ab8d9411a644036)   