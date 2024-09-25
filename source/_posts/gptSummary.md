---
title:  AIGC 汇总
date: 2023-11-16 15:02:55
tags:
  - AIGC
categories: 
  - AIGC
  - 汇总  
top:
  true
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

## Basic
+ {% post_link 'ai' %} 
+ {% post_link 'aiOverview' %}
+ {% post_link 'aiMachineLearning' %}

## DeepLearning
+ {% post_link 'aiDeepLearning' %}
+ **{% post_link 'gptPytorch' %}** 


## NLP
+ {% post_link 'gptNLPTask' %}  
+ {% post_link 'gptDocSimilarity' %}  
+ {% post_link 'gptDialogue' %}  

## Model *
+ Backbone 
  + **{% post_link 'gptTransformer' %}** 
  + {% post_link 'gptTransformerCode' %}  
  + {% post_link 'gptEmbedding' %}   
  + {% post_link 'gptTemperature' %}  
+ Foundation Models
  + {% post_link 'gptLargeModelSurvey' %}
  + {% post_link 'gptLargeModel' %} 
  + {% post_link 'gptFamily' %}  
  + {% post_link 'gptChatGLM' %}    
  + LLaMA
  	+ **{% post_link 'gptLlama' %}**   
  	+ {% post_link 'gptLlamaFamily' %}   
  	+ **{% post_link 'gptLlama3-1' %}**  
  + {% post_link 'gptLeaderBoard' %}  
+ {% post_link 'gptImpossibleTriangle' %} 
+ {% post_link 'gptEmergent' %}   
+ {% post_link 'gptHallucination' %}    
+ {% post_link 'gptEval' %}     

## Training  *
+ 训练
  + {% post_link 'gptLargeModelTraining' %}
  + {% post_link 'gptLargeModelTrainingPractice' %} 
  + {% post_link 'gptContinualPretraining' %}  
  + {% post_link 'gptChineseLlama' %}   
  + 分布式 
    + **{% post_link 'gptTrainParallelism' %}** 
    + **{% post_link 'gptTrainCommunication' %}**     
    + **{% post_link 'gptTrainPipelineParallelism' %}** 
    + **{% post_link 'gptTrainTensorParallelism' %}**
    + DP
      + **{% post_link 'gptTrainZeroDeepspeed' %}** 
      + **{% post_link 'gptTrainDistributedPractice' %}**
      + **{% post_link 'gptTrainDDP' %}** 
      + **{% post_link 'gptTrainFSDP' %}**  
  + 低精度
    + **{% post_link 'gptLowPrecision' %}**    
    + **{% post_link 'gptPrecision' %}**    
  
## Inference *
+ 框架
  + {% post_link 'gptInferFramework' %} 
  + {% post_link 'gptInferFrameworkPractice' %} 
  + vLLM
    + **{% post_link 'gptInfervLLM' %}** 
    + **{% post_link 'gptInfervLLMPractice' %}**  
  + {% post_link 'gptInferTensorRT' %} 
  + Ray
    + {% post_link 'gptInferRay' %}   
    + {% post_link 'gptInferRayPractice' %}   
+ 优化
  + {% post_link 'gptInference' %}
  + **{% post_link 'gptInferenceSurvey' %}**
  + **{% post_link 'gptInferenceSurvey1' %}** 
  + 系统层优化
    + KVCache
      + **{% post_link 'gptInferKVCache' %}**  
      + **{% post_link 'gptInferKVCacheOptimize' %}**
      + Compress  
        + **{% post_link 'gptInferKVCacheStreamingLLM' %}**   Window 
        + **{% post_link 'gptInferKVCacheQuantization' %}** Quantization  
    + **{% post_link 'gptFlashAttention' %}** 
    + 调度
      + **{% post_link 'gptInferContinuousBatching' %}** 
      + **{% post_link 'gptInferChunkedPrefill' %}** 
  + 模型层优化 
    + 模型压缩
      + **{% post_link 'gptQuantization' %}** 
      + **{% post_link 'gptQuantizationWeight' %}** 
      + **{% post_link 'gptQuantizationPractice' %}**  

## Data 
+ List
  + {% post_link 'gptDataSet' %} 
  + {% post_link 'gptDataSetPretrainList' %} 
  + {% post_link 'gptDatasetSFTList' %}  
  + {% post_link 'gptDatasetMulitmodal' %}   
+ DataProcess
  + {% post_link 'gptDatasetSurvey' %} 
  + {% post_link 'gptDataProcess' %}  
  + {% post_link 'gptDataProcessPractice' %}  
  + {% post_link 'gptDataProcessAnnotation' %}
+ Data Management
    + {% post_link 'gptDataManagement' %}  
    + Pretrain  
      + {% post_link 'gptDataRefinedWeb' %}  
      + {% post_link 'gptTrainTokenizer' %}  
    + SFT 
      - Data Quality
        - Instruction Quality
          + {% post_link 'gptDataSFTQuality' %} 
        - Instruction Diversity
          + {% post_link 'gptSelfInstruct' %} 
        - Instruction Complexity  
          + {% post_link 'gptDataWizard' %} 
      - Task composition
        + {% post_link 'gptDatasetSFT' %}   
      + {% post_link 'gptDataSFTScaling' %}  
      + {% post_link 'gptDataSelection' %} 


## FineTuning *
+ PEFT
  + {% post_link 'gptFineTuning' %} 
  + {% post_link 'gptFineTuningWhen' %}  
  + {% post_link 'gptFineTuningPEFT' %}  
+ Soft Prompt
  + {% post_link 'gptPromptTuning' %} 
  + {% post_link 'gptPEFTPtuning' %}  
  + {% post_link 'gptPEFTPtuningPractice' %}  
  + {% post_link 'gptPromptTuningPractice' %}   
+ Lora
  + {% post_link 'gptPEFTLora' %} 
  + {% post_link 'gptPEFTQLora' %} 
+ Instruct Tuning *
  + {% post_link 'gptInstructTuning' %}  
  + {% post_link 'gptInstructTuningSurvey' %}  
+ BERT
  + {% post_link 'gptFineTuningBert' %}    

## LLOps 
+ **{% post_link 'gptLLamaFactory' %}**
+ **{% post_link 'gptGPUComputing' %}** 
+ {% post_link 'gptGPU' %} 


## Prompt
  + {% post_link 'gptPromptEngineering' %}
  + {% post_link 'gptCOT' %} 
  + {% post_link 'gptPromptCode' %}
  + {% post_link 'gptPrompt' %}

## Langchain
+ {% post_link 'gptLangchain' %}
+ {% post_link 'gptRetrievers' %} 
+ {% post_link 'gptLangchainAgent' %} 

## Study
+ {% post_link 'gptStudy' %}
+ {% post_link 'aiStudyResouce' %} 

## Research
+ {% post_link 'gptPaperTools' %} 
+ {% post_link 'gptStudyPaper' %}
+ {% post_link 'gptSurveyList' %} 
+ {% post_link 'gptAgentPaper' %}  























