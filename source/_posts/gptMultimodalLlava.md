---
title: 多模态  LLaVa
date: 2023-03-14 23:02:17
tags:
  - multimodal
categories:
  - AIGC  
  - multimodal
---

<p></p>
<!-- more -->

### GPT-assisted Visual Instruction Data Generation [1]
+ detail
  为了缓解这一问题，我们利用**纯语言 GPT-4 或 ChatGPT 作为强大的教师（两者都只接受文本作为输入），来创建涉及视觉内容的指令遵循数据**。具体来说，为了将图像编码为视觉特征以提示纯文本 GPT，我们使用了**两类符号**表示：

    i）**图像描述（Captions）**通常从不同角度描述视觉场景；
    ii）**边框（Bounding Boxes）**通常定位场景中的物体，每个框编码物体概念及其空间位置。表 14 顶部图块就是一个例子。


+ 158K   语言图像指令遵循样本
  + 58K  对话样本
  + 23K  详细描述样本 
  + 77K  复杂推理样本

# 参考
1. [【LMM 001】LLaVA：大型语言和视觉助手](https://datac.blog.csdn.net/article/details/135329498)

1xx. [基于视觉指令调整的多模态聊天机器人 LLaVA｜AI新青年讲座·大型语言模型专场](https://apposcmf8kb5033.pc.xiaoe-tech.com/live_pc/l_64a7d4fde4b0d1e42e7fc7e6) V

1xx. [【LMM 002】LLaVA-1.5：大型语言和视觉助手](https://datac.blog.csdn.net/article/details/135329602)

1xx. [【LMM 006】LLaVA-Plus：可以学习如何使用工具的多模态Agent](https://datac.blog.csdn.net/article/details/135329898)

