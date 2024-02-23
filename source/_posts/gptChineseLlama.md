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


### 将 LoRA 权重与基础模型合并
``` shell
python merge_llama_with_chinese_lora.py \
    --base_model /root/internLM/model/skyline2006/llama-7b \
    --tokenizer_path /root/internLM/Chinese-LLaMA-Alpaca-main/scripts/merge_tokenizer/merged_tokenizer_hf  \
    --lora_model /root/internLM/llamazh/output_dir/lora/ \
    --output_type huggingface \
    --output_dir /root/internLM/llamazh/pt_merged/book-merge-hf
```

``` shell
# 合并LLaMA和LoRA后的权重
$ ll -h /root/internLM/llamazh/pt_merged/book-merge-hf
total 13G
drwxr-xr-x 2 root root 4.0K Feb 23 10:48 ./
drwxr-xr-x 3 root root 4.0K Feb 23 10:47 ../
-rw-r--r-- 1 root root  598 Feb 23 10:47 config.json
-rw-r--r-- 1 root root  132 Feb 23 10:47 generation_config.json
-rw-r--r-- 1 root root 9.3G Feb 23 10:48 pytorch_model-00001-of-00002.bin
-rw-r--r-- 1 root root 3.6G Feb 23 10:48 pytorch_model-00002-of-00002.bin
-rw-r--r-- 1 root root  27K Feb 23 10:48 pytorch_model.bin.index.json
-rw-r--r-- 1 root root  411 Feb 23 10:47 special_tokens_map.json
-rw-r--r-- 1 root root 741K Feb 23 10:47 tokenizer.model
-rw-r--r-- 1 root root  727 Feb 23 10:47 tokenizer_config.json

# 原始llama权重
ll -h /root/internLM/model/skyline2006/llama-7b
total 13G
drwxr-xr-x 2 root root 4.0K Feb 21 20:04 ./
drwxr-xr-x 3 root root 4.0K Feb 21 19:38 ../
-rw-r--r-- 1 root root   43 Feb 21 19:38 .mdl
-rw------- 1 root root 3.6K Feb 21 20:04 .msc
-rw-r--r-- 1 root root   36 Feb 21 20:04 .mv
-rw------- 1 root root  11K Feb 21 19:39 LICENSE
-rw------- 1 root root 9.0K Feb 21 20:04 README.md
-rw------- 1 root root  22M Feb 21 19:38 alpaca_data.json
-rw------- 1 root root  427 Feb 21 19:38 config.json
-rw------- 1 root root  302 Feb 21 19:39 configuration.json
-rw------- 1 root root 1.2K Feb 21 19:39 default_offload_opt_param.json
-rw------- 1 root root  124 Feb 21 19:39 generation_config.json
-rw------- 1 root root 387M Feb 21 19:40 pytorch_model-00001-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:42 pytorch_model-00002-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:44 pytorch_model-00003-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:47 pytorch_model-00004-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:50 pytorch_model-00005-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:51 pytorch_model-00006-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:53 pytorch_model-00007-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:55 pytorch_model-00008-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:55 pytorch_model-00009-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:56 pytorch_model-00010-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:56 pytorch_model-00011-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:56 pytorch_model-00012-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:57 pytorch_model-00013-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:57 pytorch_model-00014-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:58 pytorch_model-00015-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:59 pytorch_model-00016-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:59 pytorch_model-00017-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:59 pytorch_model-00018-of-00033.bin
-rw------- 1 root root 387M Feb 21 19:59 pytorch_model-00019-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:00 pytorch_model-00020-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:00 pytorch_model-00021-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:00 pytorch_model-00022-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:01 pytorch_model-00023-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:01 pytorch_model-00024-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:01 pytorch_model-00025-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:01 pytorch_model-00026-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:02 pytorch_model-00027-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:02 pytorch_model-00028-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:02 pytorch_model-00029-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:03 pytorch_model-00030-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:03 pytorch_model-00031-of-00033.bin
-rw------- 1 root root 387M Feb 21 20:03 pytorch_model-00032-of-00033.bin
-rw------- 1 root root 501M Feb 21 20:04 pytorch_model-00033-of-00033.bin
-rw------- 1 root root  25K Feb 21 20:04 pytorch_model.bin.index.json
-rw------- 1 root root    2 Feb 21 20:04 special_tokens_map.json
-rw------- 1 root root 489K Feb 21 20:04 tokenizer.model
-rw------- 1 root root  141 Feb 21 20:04 tokenizer_config.json
```

### 指令精调


# 参考
1. [中文LLaMA&Alpaca大语言模型词表扩充+预训练+指令精调](https://zhuanlan.zhihu.com/p/631360711)
2. [Chinese-LLaMA-Alpaca](https://github.com/ymcui/Chinese-LLaMA-Alpaca/)
[中文文档](https://github.com/ymcui/Chinese-LLaMA-Alpaca/wiki)
[预训练脚本](https://github.com/ymcui/Chinese-LLaMA-Alpaca/wiki/%E9%A2%84%E8%AE%AD%E7%BB%83%E8%84%9A%E6%9C%AC)
3. [DataSet](https://github.com/shjwudp/shu)
4. [llama-7b](https://www.modelscope.cn/models/skyline2006/llama-7b/summary) 基础模型
