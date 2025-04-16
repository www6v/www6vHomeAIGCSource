---
title: Prompt-to-Prompt
date: 2024-04-16 16:25:38
tags:
  - Diffusion
categories: 
  - AIGC
  - Diffusion 
---

<p></p>
<!-- more -->


# 论文

- 论文地址
[PROMPT-TO-PROMPT IMAGE EDITING
WITH CROSS-ATTENTION CONTROL](https://prompt-to-prompt.github.io/ptp_files/Prompt-to-Prompt_preprint.pdf)
- 开源地址
[Prompt-to-Prompt](https://github.com/google/prompt-to-prompt/) git
- Project page
[Project page](https://prompt-to-prompt.github.io/)

# 示意[1]



{% asset_img  'gvn5hr6b.bmp' %}

# 应用[1]

**应用方面：**Prompt-to-Prompt 这个方法是原理上的创新，应用方面只适用于“已经生成了一张大致满意的图，我们想对它进行部分修改”。**但是对于“手头有一张来历不明的图，我们想对它进行修改”这个任务就很麻烦了**，因为很难去倒推这张图对应的prompt是啥。

所以后续有一项工作叫 [InstructPix2Pix](https://zhuanlan.zhihu.com/p/655135961)，作用是“**一张来历不明的图，只要说‘把猫改成狗’，模型就能把画面里的猫改成狗，其他不变**。”非常好用，听说已经集成在 Stable Diffusion WebUI 里可以直接用了。

# Method[1]

{% asset_img  'vfk2k2bg.bmp' %}
上半部分，原版cross-attention，下半部分，本文的cross-attention


{% asset_img  'ck0g81ot.bmp' %}

# 参考

1. [Prompt-to-prompt：让生成的图像保持一致](https://zhuanlan.zhihu.com/p/655372592)

[diffusion model(十四)： prompt-to-prompt 深度剖析](https://blog.csdn.net/weixin_40779727/article/details/136854062)
