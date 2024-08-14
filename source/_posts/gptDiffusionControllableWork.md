---
title: (Work|实战)Controllable 
date: 2023-07-17 15:31:39
tags:
  - Diffusion
categories: 
  - AIGC
  - Diffusion 
---

<p></p>
<!-- more -->


# 论文[ControlNet]
+ 论文地址
  [Adding Conditional Control to Text-to-Image Diffusion Models](https://arxiv.org/abs/2302.05543) 

+ 开源地址
  [ControlNet](https://github.com/lllyasviel/ControlNet) git

+ 论文解析
  [论文解析](https://candied-skunk-1ca.notion.site/ControlNet-76c3d54a18424e20a25a3e4a8a71b8e3?pvs=4)

---

# 论文[T2I-Adapter]
+ 论文地址
  [T2I-Adapter](https://arxiv.org/pdf/2302.08453) 

+ 开源地址
  [T2I-Adapter](https://github.com/TencentARC/T2I-Adapter) git

+ 论文解析
  [论文解析](https://candied-skunk-1ca.notion.site/T2I-Adapter-26eef5080f084dacb6e89d643d31e53d?pvs=4)


---
# 论文[IP-Adapter]
+ 论文地址
  [IP-Adapter: Text Compatible Image Prompt Adapter for Text-to-Image Diffusion Models](https://arxiv.org/pdf/2308.06721)
  
+ 开源地址
  [IP-Adapter](https://github.com/tencent-ailab/IP-Adapter) git
   enable a pretrained text-to-image diffusion model to generate images **with image prompt**
   有很多notebook的demo

+ Project page
  [Project page](https://ip-adapter.github.io/)   

+ 论文解析
  [论文解析](https://candied-skunk-1ca.notion.site/IP-Adapter-40dfd1f30d38456b8776a90871716c73?pvs=4)

---
# 实战
+ [ControlNet + t2i_adapter + Custom Diffusion ](https://candied-skunk-1ca.notion.site/controllable-763edf3a43b94e03a1ff0faee9ac41c2?pvs=4)  diffusers

+ [control net](https://www.bilibili.com/video/BV1Go4y1M7cK?p=2) V

---
# 总结[metaso]
|                 | **功能定位**                                       | **性能与效率**                       | **应用场景**                                           | 总结                                                       |
| --------------- | -------------------------------------------------- | ------------------------------------ | ------------------------------------------------------ | ---------------------------------------------------------- |
| **ControlNet**  | 主要用于对图像生成过程中的**特定部分**进行控制     | **较大**且可能需要较多计算资源       | 适用于需要对图像特定区域进行**精细控制**的场景         | 【ControlNet  **结构控制**， image2image】                 |
| **T2I-Adapter** | 专注于将**文本提示转换为图像**                     | **较小**且更高效，适合资源受限的环境 | 适用于需要**从文本描述生成图像**的场景                 | 【T2I-Adapter  **多种控制**, text2image】                  |
| **IP-Adapter**  | 用于**分析图像提示并提取特征**，再将其用于图像生成 | 在图像质量和对齐方面表现优异         | 适用于需要结合图像和文本提示进行**复杂图像生成**的场景 | 【IP-Adapter **风格特征控制**,  text2image\|image2image 】 |





