---
title: LLama-Factory
date: 2023-05-24 18:43:17
tags:
  - LLamaFactory
categories:
  - AIGC  
  - LLamaFactory
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 推理llama3[1]
### LLaMA-Factory 安装
``` shell
# 安装llamafactory-cli命令
git clone https://github.com/hiyouga/LLaMA-Factory.git
conda create -n llama_factory python=3.10
conda activate llama_factory
cd LLaMA-Factory
pip install -e .[metrics]
```

### 推理llama3
``` python
#模型下载
from modelscope import snapshot_download
model_dir = snapshot_download('LLM-Research/Meta-Llama-3-8B-Instruct')
```

``` shell
# 配置
$ vim examples/inference/llama3.yaml
model_name_or_path: /home/wei/models/model/LLM-Research/Meta-Llama-3-8B-Instruct
template: llama3

# 阿里云必须加这句，不然页面会报异常
$ export GRADIO_ROOT_PATH=/${JUPYTER_NAME}/proxy/7860/

# 启动
$ llamafactory-cli webchat examples/inference/llama3.yaml
```
+ Command
{% asset_img  'command.JPG' %}

+ WebUI
{% asset_img  'webui.JPG' %}



# Agent Tuning[2]

### 环境准备
``` shell
# source code
git clone -b v0.7.1  https://github.com/hiyouga/LLaMA-Factory.git
git switch -c v0.7.1
cd LLaMA-Factory

# package 安装
conda create -n llama_factory python=3.10
conda activate llama_factory
pip install llmtuner==0.5.1

# 环境变量
export CUDA_VISIBLE_DEVICES=0 # 使用第一块 GPU
export USE_MODELSCOPE_HUB=1 # 使用魔搭社区下载渠道

# 阿里云必须加这句，不然页面会报异常
$ export GRADIO_ROOT_PATH=/${JUPYTER_NAME}/proxy/7860/

# 启动
python -m llmtuner.webui.interface
```

### 训练流程
``` shell
# flash-attn 安装
pip install flash-attn --no-build-isolation

pip install modelscope -U
```



+ 训练脚本
``` shell
# 训练轮数 1.0

CUDA_VISIBLE_DEVICES=0 python src/train_bash.py \
    --stage sft \
    --do_train True \
    --model_name_or_path 01ai/Yi-6B \
    --finetuning_type lora \
    --template default \
    --flash_attn True \
    --dataset_dir data \
    --dataset glaive_toolcall,alpaca_gpt4_en,alpaca_gpt4_zh,oaast_sft_zh \
    --cutoff_len 1024 \
    --learning_rate 5e-05 \
    --num_train_epochs 1.0 \
    --max_samples 8000 \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --max_grad_norm 1.0 \
    --logging_steps 5 \
    --save_steps 100 \
    --warmup_steps 0 \
    --lora_rank 8 \
    --lora_dropout 0.1 \
    --lora_target all \
    --output_dir saves/Yi-6B/lora/yi-agent-6b \
    --fp16 True \
    --plot_loss True 
```

+ 训练配置
{% asset_img  'agentTuningUI.png' %}


+ 训练结果
{% asset_img  'agentTuningUI-result.png' %}

+ 效果展示
工具调用 - 查询天气
【1个epoch好像有点问题】
{% asset_img  'agentTuningUI-chat.png' %}


# 参考
1. [LLaMA-Factory QuickStart](https://zhuanlan.zhihu.com/p/695287607)

2. [单卡 3 小时训练专属大模型 Agent：基于 LLaMA Factory 实战](https://zhuanlan.zhihu.com/p/678989191)

1xx. [LLaMA-Factory微调多模态大语言模型教程](https://zhuanlan.zhihu.com/p/699777943)



