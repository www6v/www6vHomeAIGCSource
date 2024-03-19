---
title: (综述)多模态-InstructTuning
date: 2023-03-15 16:09:00
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

# Datasets for Visual Instruction Tuning[1]
### Single-turn
+ MiniGPT-4
**MiniGPT-4** [37] curates an image description dataset that contains 3439 image-text pairs for instruction fine-tuning. MiniGPT-4 **randomly selects 5000 images from the Conceptual Caption dataset** [38], [39] and prompts its **pre-trained VLM model** to generate detailed descriptions for each image. The generated descriptions are then** refined and filtered** both manually and by using ChatGPT, resulting in 3439 highquality image-text pairs.

+ MultiInstruct
MultiInstruct [43] build a comprehensive instruction dataset that covers 62 diverse multimodal tasks from 10 broad categories, such VQA, Image-text matching, grounded generation, and so on. These tasks include 34 existing tasks derived from 21 public dataset and 28 new tasks extended from them. Each task is equipped with 5 instruction templates to prompt the model to perform the specific task.

### Multi-turn
+ LLaVA
**LLaVA-Instruct-158k** [9] contains 158 image-text instruction data, including **58k conversation data** asking about the visual content of the image,**23k description data**, and **77k complex reasoning data** where the question may involve multi-step reasoning process.

# VLIT Data Construction Strategy[2]
### Annotation Adaption
+ MiniGPT-4

### Self-Instruct
+ LLaVA

# High-Quality VLIT Data[2]
### Correctness
### Diversity
### Complexity

# Method [1][2]

| Method        | Training Paradigm[2]         | Vision Encoder | Language Encoder | Inst[2] | Tuning Data                                                  |
| ------------- | ---------------------------- | -------------- | ---------------- | ------- | ------------------------------------------------------------ |
| MiniGPT-4     | FA → VLIT                    | EvaCLIP ViT    | Vicuna           | AA      | CC3M, CC12M, SBU, LAION 400M, MiniGPT-3.5K                   |
| MiniGPT-v2    |                              | EVA            | LLaMA2-chat      | AA+SI   | LAION, CC3M, SBU, GRIT-20M, COCO caption, Text Captions, RefCOCO, RefCOCO+, RefCOCOg, GQA, VQA-v2, OCR-VQA, OKVQA, AOK-VQA, Flickr30k Dataset, Unnatural Instruction Dataset |
| LLaVa         | FA → VLIT                    | CLIP ViT       | Vicuna           | SI      | CC3M Concept-balanced 595K, LLaVA-Instruct-158K              |
| LLaVA-1.5     | FA → VLIT                    | CLIP ViT       | Vicuna           |         | LLaVA, ShareGPT, VQAv2, GQA, OKVQA, OCRVQA, A-OKVQA, TextCaps, RefCOCO, VG |
| MultiInstruct | VLIT                         | OFA            | OFA              | AA      | VQAv2, Visual7w, GQA, OK-VQA, Visual Genome, MSCOCO, RefCOCO, COCO-Text, TDIUC, IQA, VAW, MOCHEG, WikiHow |
| Otter         |                              | CLIP ViT       | MPT              | SI      | MIMIC-IT                                                     |
| LAMM          | VLIT                         | CLIP ViT-L/14  | Vicuna           | SI      | Language-Assisted Multi-Modal Instruction-Tuning Dataset     |
| Qwen-VL       | FA → VLIT(Multi-Task Tuning) | ViT            | Qwen-7B          |         | LAION-en&zh, DataComp, Coyo, CC12M&3M, SBU, COCO, In-house Data, GQA, VGQA, VQAv2, DVQA, OCR-VQA, DocVQA, TextVQA, ChartQA, AI2D, GRIT, Visual Genome, RefCOCO, RefCOCO+, RefCOCOg, SynthDoG-en&zh, Common Crawl pdf&HTML |
| CogVLM        | FA → VLIT                    | EVA2-CLIP-E    | Vicuna-7Bv-1.5   |         | VQAv2, TextVQA                                               |
| StableLLaVA   | FA → VLIT                    | CLIP-ViT-L/14  | LLaMA            | AA      | Synthesized Image-Dialogue Dataset                           |

### Annotation Adaption-> SI
### Self-Instruct -> AA

# 参考

1. 《Visual Instruction Tuning towards General-Purpose Multimodal Model: A Survey》 ***  第4 5章  南洋大学 

2. 《Vision-Language Instruction Tuning: A Review and Analysis》 ***  第2 3 4 5章   腾讯

3. 《Instruction Tuning for Large Language Models: A Survey》 第5章

1xx. [【LMM 015】LAMM：多模态指令微调数据集，框架和基准](https://datac.blog.csdn.net/article/details/135434897)

1xx. [Talk | ACL'23 杰出论文，MultiIntruct：通过多模态指令集微调提升VLM的零样本学习](https://www.bilibili.com/video/BV12p4y1M7RV/)

1xx. [【ACL2023】MultiInstruct: Improving Multi-Modal Zero-Shot Learning via Instruction Tuning](https://blog.csdn.net/qq_45978862/article/details/132008907)

1xx. [[NeurIPS2023] LAMM：多模态指令微调数据集、框架、评测基准](https://zhuanlan.zhihu.com/p/678489834)

