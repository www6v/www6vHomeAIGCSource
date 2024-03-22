---
title: (实战)量化
date: 2024-03-22 10:18:01
tags:
  - 量化
categories: 
  - AIGC
  - 量化  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 实战-PTQ[1]
###  量化与8bit模型训练
``` python
import torch
model = AutoModelForCausalLM.from_pretrained("D:/Pretrained_models/modelscope/Llama-2-7b-ms", low_cpu_mem_usage=True, 
                                             torch_dtype=torch.half, device_map="auto", load_in_8bit=True)
```

# 实战2-量化推理 量化推理 [8]
+ Training的模型
{% asset_img 'dirs.png' %}

+ 合并后的模型
{% asset_img 'dir.png' %}

+ 4bit量化推理
{% asset_img 'xtuner-chat.png' %}

> Training的时候要用tmux
``` shell
$ tmux new -s finetune
$ tmux attach -t finetune
$ ctcl +b , D
```

> 16bit量化推理慢,  要用4bit量化推理


# 参考
1.  [ 量化与8bit模型训练](https://www.bilibili.com/video/BV1EN411g7Yn/) V
    [【手把手带你实战HuggingFace Transformers-低精度训练篇】量化与8bit模型训练](https://www.bilibili.com/video/BV1EN411g7Yn/)
   [llama2_lora_8bit.ipynb](https://github.com/www6v/transformers-code/blob/master/04-Kbit%20Training/26-8bits_training/llama2_lora_8bit.ipynb)
   
8. [internLM fine-tuning on xtuner](https://github.com/www6v/tutorial/tree/main/xtuner)   
   [(4)XTuner 大模型单卡低成本微调实战](https://www.bilibili.com/video/BV1yK4y1B75J/) V   