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


``` shell
python3 merge_tokenizers.py \
  --llama_tokenizer_dir /root/internLM/model/skyline2006/llama-7b \
  --chinese_sp_model_file /root/internLM/Chinese-LLaMA-Alpaca-main/scripts/merge_tokenizer/chinese_sp.model
```


# 参考
1. [中文LLaMA&Alpaca大语言模型词表扩充+预训练+指令精调](https://zhuanlan.zhihu.com/p/631360711)
2. [Chinese-LLaMA-Alpaca](https://github.com/ymcui/Chinese-LLaMA-Alpaca/)
[中文文档](https://github.com/ymcui/Chinese-LLaMA-Alpaca/wiki)
[预训练脚本](https://github.com/ymcui/Chinese-LLaMA-Alpaca/wiki/%E9%A2%84%E8%AE%AD%E7%BB%83%E8%84%9A%E6%9C%AC)
3. [DataSet](https://github.com/shjwudp/shu)
4. [llama-7b](https://www.modelscope.cn/models/skyline2006/llama-7b/summary) 基础模型
