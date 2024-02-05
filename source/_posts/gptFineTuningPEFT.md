---
title:  PEFT 实战
date: 2022-12-20 11:25:22
tags:
  - PEFT
categories:
  - AIGC  
  - PEFT
---

<p></p>
<!-- more -->

# Huggingface  PEFT中的任务[1]

```
class TaskType(str, enum.Enum):
    SEQ_CLS = "SEQ_CLS"  # 3. 序列分类任务
    SEQ_2_SEQ_LM = "SEQ_2_SEQ_LM"  # 2. 条件生成任务
    CAUSAL_LM = "CAUSAL_LM"  #  1. 因果语言建模任务
    TOKEN_CLS = "TOKEN_CLS"  #  4. Token 分类任务
    QUESTION_ANS = "QUESTION_ANS"
    FEATURE_EXTRACTION = "FEATURE_EXTRACTION"
```

### 1. 因果语言建模任务（Causal Language Modeling）
  因果语言建模任务（CLM），在这种建模方法中，模型试图预测给定上下文中的下一个单词，该上下文通常包括在当前单词之前的所有单词。

### 2. 条件生成任务（Conditional Generation）
  条件生成任务（Conditional Generation），根据给定的输入（可能是文本、图片等）生成符合条件的输出。
  条件生成的应用包括但不限于机器翻译、文本摘要、图像描述等。这些任务通常需要模型在输入和输出之间建立复杂的映射关系。

> 因果语言建模任务  vs.  条件生成任务 
  因果语言建模主要关注于生成连贯、自然的文本，而条件生成关注于生成满足特定条件或任务要求的文本。这两种建模方法在某些场景下可能会互相使用和结合，以实现更复杂的自然语言处理任务。


### 3. 序列分类任务（Sequence Classification）

  序列分类（Sequence Classification），对整个句子进行分类。如: 获取评论的情绪，检测电子邮件是否为垃圾邮件，确定句子在语法上是否正确或两个句子在逻辑上是否相关等

### 4. Token 分类任务（Token Classification）
  Token 分类任务（Token Classification），对句子中的每个词进行分类。如: 识别句子的语法成分（名词、动词、形容词）或命名实体（人、地点、组织）。


# 参考
1. [大模型参数高效微调技术实战（一）-PEFT概述](https://zhuanlan.zhihu.com/p/651744834)
100. [LLM微调实战](https://github.com/www6v/llm-action#llm%E5%BE%AE%E8%B0%83%E5%AE%9E%E6%88%98) 李国东 





