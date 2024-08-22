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




# 实战
+ [ControlNet + t2i_adapter + Custom Diffusion ](https://candied-skunk-1ca.notion.site/controllable-763edf3a43b94e03a1ff0faee9ac41c2?pvs=4)  diffusers


# 总结[metaso]
|                 | **功能定位**                                       | **性能与效率**                       | **应用场景**                                           | 总结                                                       |
| --------------- | -------------------------------------------------- | ------------------------------------ | ------------------------------------------------------ | ---------------------------------------------------------- |
| **ControlNet**  | 主要用于对图像生成过程中的**特定部分**进行控制     | **较大**且可能需要较多计算资源       | 适用于需要对图像特定区域进行**精细控制**的场景         | 【ControlNet  **结构控制**， image2image】                 |
| **T2I-Adapter** | 专注于将**文本提示转换为图像**                     | **较小**且更高效，适合资源受限的环境 | 适用于需要**从文本描述生成图像**的场景                 | 【T2I-Adapter  **多种控制**, text2image】                  |
| **IP-Adapter**  | 用于**分析图像提示并提取特征**，再将其用于图像生成 | 在图像质量和对齐方面表现优异         | 适用于需要结合图像和文本提示进行**复杂图像生成**的场景 | 【IP-Adapter **风格特征控制**,  text2image\|image2image 】 |





