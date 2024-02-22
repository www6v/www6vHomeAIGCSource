---
title: Chinese LLaMA 实战 
date: 2023-02-21 21:27:19
tags:
  - train
categories:
  - AIGC
  - train
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 环境搭建

``` shell
$ pip install transformers==4.28.1 sentencepiece==0.1.97 google protobuf deepspeed -i https://pypi.tuna.tsinghua.ed
u.cn/simple  --trusted-host pypi.tuna.tsinghua.edu.cn


$ git clone https://github.com/huggingface/peft.git
$ git checkout 13e53fc
$ pip install . -i https://pypi.tuna.tsinghua.edu.cn/simple  --trusted-host pypi.tuna.tsinghua.edu.cn

$ pip install torch==1.13.1
```
# 代码、模型、数据集准备
### 代码准备
``` shell
# 3e2f2529
git clone https://github.com/ymcui/Chinese-LLaMA-Alpaca.git
```
> 注意: 一定要用 commitid =3e2f2529的代码， 用最新代码会有很多异常

### 模型权重 及 Tokenizer 准备 [4]

### 数据集准备 [3]

# 词表扩充
``` shell
$ python3 merge_tokenizers.py \
  --llama_tokenizer_dir /root/internLM/model/skyline2006/llama-7b \
  --chinese_sp_model_file /root/internLM/Chinese-LLaMA-Alpaca-main/scripts/merge_tokenizer/chinese_sp.model
```

# 模型训练细节
### 第二阶段预训练

``` 
# 修改运行脚本run_pt.sh

lr=2e-4
lora_rank=8
lora_alpha=32
lora_trainable="q_proj,v_proj,k_proj,o_proj,gate_proj,down_proj,up_proj"
modules_to_save="embed_tokens,lm_head"
lora_dropout=0.05

pretrained_model=/root/internLM/model/skyline2006/llama-7b #
chinese_tokenizer_path=/root/internLM/Chinese-LLaMA-Alpaca-main/scripts/merge_tokenizer/merged_tokenizer_hf  #
dataset_dir=/root/internLM/shu-master/books  #
data_cache=/root/cache/books #
per_device_train_batch_size=1
per_device_eval_batch_size=1
training_steps=100
gradient_accumulation_steps=1
output_dir=/root/internLM/llamazh/output_dir #
RANDOM=100 #


deepspeed_config_file=ds_zero2_no_offload.json

```
具体执行过程如下所示：
sh run_pt.sh 

{% asset_img  '1.png' %}
{% asset_img  '2.png' %}
{% asset_img  '3.png' %}

模型输出文件：
{% asset_img  'result.png' %}

# 参考
1. [中文LLaMA&Alpaca大语言模型词表扩充+预训练+指令精调](https://zhuanlan.zhihu.com/p/631360711)
2. [Chinese-LLaMA-Alpaca](https://github.com/ymcui/Chinese-LLaMA-Alpaca/)
[中文文档](https://github.com/ymcui/Chinese-LLaMA-Alpaca/wiki)
[预训练脚本](https://github.com/ymcui/Chinese-LLaMA-Alpaca/wiki/%E9%A2%84%E8%AE%AD%E7%BB%83%E8%84%9A%E6%9C%AC)
3. [DataSet](https://github.com/shjwudp/shu)
4. [llama-7b](https://www.modelscope.cn/models/skyline2006/llama-7b/summary) 基础模型
