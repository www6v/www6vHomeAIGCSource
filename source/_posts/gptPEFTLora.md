---
title: (实战)PEFT Lora 
date: 2023-01-05 12:04:14
tags:
  - PEFT
categories:
  - AIGC  
  - PEFT
---

<p></p>
<!-- more -->



## 目录
<!-- toc -->

# 基于LLaMA的SFT
+ 版本
  + deepspeed的版本  [3.1]
  + AutoGPTQ的版本  0.6.0 -> git下载到本地安装
+ 代码错误
  + use_flash_attention_2 相关的错误 [3.2]
+ 脚本 [3.3]
  - modescope 下载 shakechen/Llama-2-7b-chat-hf
  - 单卡训练
    1个epoch 差不多7小时



+ checkpoint 生成文件

{% asset_img 'llama-lora.png' %}

{% asset_img 'llama-lora1.png' %}

+ 模型生成文件

{% asset_img 'model1.png' %}

{% asset_img 'model2.png' %}



# 基于bloom的微调
+ 简单基础  [2]
  - 基座模型  
    Langboat/bloom-1b4-zh 
  - 数据集
    shibing624/alpaca-zh
  
+ 稍复杂[1]
  - 基座模型 
    bloomz-560m 
  - 数据集
    ought/raft

# Lora 参数 
+ LoraConfig [2]
``` python
LoraConfig( 
base_model_name_or_path='Langboat/bloom-1b4-zh', 
task_type=<TaskType.CAUSAL_LM: 'CAUSAL_LM'>, 
inference_mode=False, 
r=8, 
target_modules={'query_key_value'}, 
lora_alpha=32, 
lora_dropout=0.1, 
modules_to_save=None)
```

+ 参数说明 [1]
    - task_type：指定任务类型。如：条件生成任务（SEQ_2_SEQ_LM），因果语言建模（CAUSAL_LM）等。
    - inference_mode：是否在推理模式下使用Peft模型。
    - r： LoRA低秩矩阵的维数。关于秩的选择，通常，使用4，8，16即可。
    - lora_alpha： LoRA低秩矩阵的缩放系数，为一个常数超参，调整alpha与调整学习率类似。
    - lora_dropout：LoRA 层的丢弃（dropout）率，取值范围为[0, 1)。
    - target_modules：要替换为 LoRA 的模块名称列表或模块名称的正则表达式。针对不同类型的模型，模块名称不一样.

+ target_modules [1]
在 PEFT 中支持的模型默认的模块名如下所示：
``` python
TRANSFORMERS_MODELS_TO_LORA_TARGET_MODULES_MAPPING = {
    "t5": ["q", "v"],
    "mt5": ["q", "v"],
    "bart": ["q_proj", "v_proj"],
    "gpt2": ["c_attn"], #
    "bloom": ["query_key_value"], #
    "blip-2": ["q", "v", "q_proj", "v_proj"],
    "opt": ["q_proj", "v_proj"],
    "gptj": ["q_proj", "v_proj"],
    "gpt_neox": ["query_key_value"],
    "gpt_neo": ["q_proj", "v_proj"],
    "bert": ["query", "value"], #
    "roberta": ["query", "value"],
    "xlm-roberta": ["query", "value"],
    "electra": ["query", "value"],
    "deberta-v2": ["query_proj", "value_proj"],
    "deberta": ["in_proj"],
    "layoutlm": ["query", "value"],
    "llama": ["q_proj", "v_proj"],  #
    "chatglm": ["query_key_value"],  #
    "gpt_bigcode": ["c_attn"],
    "mpt": ["Wqkv"],
}
```

# 最佳实践
+ 秩r的大小[卢老师]
  - 模型如果是垂直类的大模型
    eg. 私有数据
    **r设置大点**
  - 模型如果是通用类的大模型
    eg. 运维大模型
    **r设置小点**
    
# 参考
### bloom
1. [大模型参数高效微调技术实战（五）-LoRA](https://zhuanlan.zhihu.com/p/649315197)
   [bloom Lora](https://github.com/www6v/llm-action/blob/main/train/peft/clm/peft_lora_clm.ipynb) git
   
2. [【手把手带你实战HuggingFace Transformers-高效微调篇】LoRA 原理与实战](https://www.bilibili.com/video/BV13w411y7fq/) V
    [bloom Lora-origin](https://github.com/www6v/transformers-code/blob/master/03-PEFT/21-lora/chatbot_lora.ipynb)  [bloom Lora-origin](https://colab.research.google.com/github/www6v/transformers-code/blob/master/03-PEFT/21-lora/chatbot_lora.ipynb) git   origin运行有问题
    [bloom Lora-modify](https://github.com/www6v/transformers-code/blob/master/03-PEFT/21-lora/chatbot_lora%5Bworkable%5D.ipynb)  [bloom Lora-modify](https://colab.research.google.com/drive/1SNy35_CJOobe4AxAecMZJo4LX1TjXvTm) 修改过可以在colab运行的代码

### LLaMA
3. [Llama2-Chinese](https://github.com/www6v/Llama2-Chinese/tree/ww-workable) 模型微调-> lora SFT
3.1 [requirements.txt](https://github.com/www6v/Llama2-Chinese/blob/ww-workable/requirements.txt)
3.2 [finetune_clm_lora.py](https://github.com/www6v/Llama2-Chinese/blob/ww-workable/train/sft/finetune_clm_lora.py#L460C18-L460C19)  注释掉第360行   
3.3 [train/sft/finetune_lora.sh](https://github.com/www6v/Llama2-Chinese/blob/ww-workable/train/sft/finetune_lora.sh)

1xx. [Using LangSmith to Support Fine-tuning](https://blog.langchain.dev/using-langsmith-to-support-fine-tuning-of-open-source-llms/)
    [LangSmith + LLaMA Fine-tuning Guide](https://colab.research.google.com/drive/1tpywvzwOS74YndNXhI8NUaEfPeqOc7ub?usp=sharing&ref=blog.langchain.dev#scrollTo=v1tOYeVGtQKJ)

### ChatGLM

1xx. 《13-基于 ChatGLM2的 Fine-tuning 实战》 AI 大模型全栈工程师培养计划  2期
	[train_lora.sh](https://github.com/www6v/fine-tuning-lab/blob/agiclass-v1/chatglm/train_lora.sh)  基于法律文本的chatglm的lora
	[train_lora.sh](https://github.com/www6v/fine-tuning-lab/blob/agiclass-v1/chatglm2/train_lora.sh)  基于法律文本的chatglm-2的lora
	[课件](https://github.com/www6v/fullStackLLM/blob/master/08-fine-tuning/peft/index.ipynb) 
	bili有相关的总结的视频

1xx. [ChatGLM-Tuning](https://github.com/mymusise/ChatGLM-Tuning) 卢老师推荐

### others
1xx. [Finetuning LLMs with LoRA and QLoRA: Insights from Hundreds of Experiments](https://lightning.ai/pages/community/lora-insights/) ***
     [几百次大模型LoRA和QLoRA 微调实践的经验分享](https://www.bilibili.com/video/BV16u4y1a7MH/) V