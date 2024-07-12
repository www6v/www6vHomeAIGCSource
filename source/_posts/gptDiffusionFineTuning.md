---
title: (实战) SD fine-tuning
date: 2023-07-06 19:24:20
tags:
  - Diffusion
categories: 
  - AIGC
  - Diffusion 
---

<p></p>
<!-- more -->

# 对比总结[1]

| 训练方法             | 方法                                                         | 局限性                                                       |
| :------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| Text Inversion       | 使用提供的一组图片**训练一个新单词的Embedding** ，并将其与词汇表中的已有单词关联起来，这个新单词即为这组图片概念的指代。 | 训练过程只对应 Embedding，扩散模型没有新知识输入，所以也无法产生新的内容。 |
| Full FineTune        | **最朴素**的方式，使用图片+ 标注的数据集，进行迭代训练，数据集标注可以选择BLIP来生成。训练直接对原模型的所有权重进行调整。 | 容易过拟合，导致生成图片的多样性不够，结果难以控制。模型体积大，不便于传播。 |
| Dreambooth           | 提供代表某个新概念（instance） 对应的一组图像，并使用**罕见字符（identifier） **进行概念Mapping，训练过程充分考虑**原有相关主题（class）生成**，避免过拟合。训练直接对**原模型的所有权重进行调整**。 | 训练过程只针对新概念 （instance），**多样性差**。如果需要多概念生成，需要多次训练。模型体积大，不便于传播。 |
| LoRA（w Dreambooth） | 冻结预训练模型参数，在每个Transformer块插入**可训练层**，不需要完整调整 UNet 模型的全部参数。**训练结果只保留新增的网络层，模型体积小**。 | **训练效果不如Dreambooth**                                   |

# Dreambooth实战[10]
### Dreambooth on  Diffusers
``` python
### download pic
from huggingface_hub import snapshot_download

local_dir = "./dog"
snapshot_download(
    "diffusers/dog-example",
    local_dir=local_dir, repo_type="dataset",
    ignore_patterns=".gitattributes",
)

### training 
###  在modelscope上运行有问题，连不上huggingface
export MODEL_NAME="CompVis/stable-diffusion-v1-4"
export INSTANCE_DIR="dog"
export OUTPUT_DIR="path-to-save-model"

accelerate launch train_dreambooth.py \
  --pretrained_model_name_or_path=$MODEL_NAME  \
  --instance_data_dir=$INSTANCE_DIR \
  --output_dir=$OUTPUT_DIR \
  --instance_prompt="a photo of sks dog" \
  --resolution=512 \
  --train_batch_size=1 \
  --gradient_accumulation_steps=1 \
  --learning_rate=5e-6 \
  --lr_scheduler="constant" \
  --lr_warmup_steps=0 \
  --max_train_steps=400 \
  --push_to_hub

```

# ControlNet[20]

# 参考
1. [Stable Diffusion 微调及推理优化](https://cloud.tencent.com/developer/article/2302436)
1xx. [【论文串读】Stable Diffusion模型微调方法串读](https://www.bilibili.com/video/BV19h4y1475y/) V

### Dreambooth
10. [使用 Diffusers 通过 Dreambooth 技术来训练 Stable Diffusion](https://huggingface.co/blog/zh/dreambooth)
      [Dreambooth Repo](https://github.com/huggingface/diffusers/tree/main/examples/dreambooth)
    1xx. [DreamBooth 论文精读+通俗理解](https://blog.csdn.net/qq_45670134/article/details/133498728)
    1xx. [DreamBooth Repo](https://dreambooth.github.io/)


### ControlNet  
20. [ControlNet Repo](https://github.com/lllyasviel/ControlNet) git













