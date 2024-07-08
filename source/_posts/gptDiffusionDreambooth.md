---
title: Dreambooth
date: 2023-07-06 19:24:20
tags:
  - Diffusion
categories: 
  - AIGC
  - Diffusion 
---

<p></p>
<!-- more -->

# 实战[10]
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


# 参考
1xx. [DreamBooth 论文精读+通俗理解](https://blog.csdn.net/qq_45670134/article/details/133498728)
1xx. [DreamBooth Repo](https://dreambooth.github.io/)

### 实战
10. [使用 Diffusers 通过 Dreambooth 技术来训练 Stable Diffusion](https://huggingface.co/blog/zh/dreambooth)
   [Dreambooth Repo](https://github.com/huggingface/diffusers/tree/main/examples/dreambooth)











