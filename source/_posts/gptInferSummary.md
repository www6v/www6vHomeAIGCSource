---
title: MLSys  汇总
date: 2023-12-11 11:13:42
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



## Inference *
+ 框架
  【5】
+ 框架vLLM
  + vLLM
  【9】
+ 优化
  【3】
  + 系统层优化
    + Attention Opt.
        + FlashAttention    
            【3】
    + SpeculativeDecoding
      【5】   
    + Memory Management
        + KVCache
          + **{% post_link 'gptInferKVCache' %}**  
          + **{% post_link 'gptInferKVCacheOptimize' %}**
          + Compress  
            + **{% post_link 'gptInferKVCacheQuantization' %}** Quantization  
  + 系统层优化
    + Batch
      + **{% post_link 'gptInferContinuousBatching' %}** 
      + **{% post_link 'gptInferChunkedPrefill' %}** 
    + PD 分离
      + **{% post_link 'gptInferDistServe' %}** 
      + **{% post_link 'gptInferMooncake' %}**  
      + **{% post_link 'gptInferLlumnix' %}**     
  + 模型层优化 
    + 模型压缩
      + 量化
          + **{% post_link 'gptQuantizationSurvey' %}**   
          + **{% post_link 'gptQuantization' %}** 
          + PTQ
              + **{% post_link 'gptQuantizationWeight' %}** 
              + Weight Only 
              	+ **{% post_link 'gptQuantizationGPTQ' %}**
              	+ **{% post_link 'gptQuantizationAWQ' %}**
              + Weight&Activation
              	+ **{% post_link 'gptQuantizationInt8' %}**              
              	+ **{% post_link 'gptQuantizationSmoothQuant' %}** 
              	+ **{% post_link 'gptQuantizationFP8' %}** 
          + **{% post_link 'gptQuantizationPractice' %}** 
    + Sparse Attention
      + **{% post_link 'gptInferKVCacheStreamingLLM' %}**  
+ 其他
  + **{% post_link 'gptTemperature' %}**  



## Training  *
+ 分布式 
    + **{% post_link 'gptTrainParallelism' %}**
    + DP
      + **{% post_link 'gptTrainZeroDeepspeed' %}** 
      + **{% post_link 'gptTrainDistributedPractice' %}**
      + **{% post_link 'gptTrainDDP' %}** 
      + **{% post_link 'gptTrainFSDP' %}**
    + TP 
    	+ **{% post_link 'gptTrainTensorParallelism' %}**      
    + PP     
    	+ **{% post_link 'gptTrainPipelineParallelism' %}**
    + 混合并行
    	+ **{% post_link 'gptTrainMegatron' %}**  
    	+ **{% post_link 'gptTrainHybridParallel' %}**   
+ 低精度
    + **{% post_link 'gptLowPrecision' %}**    
    + **{% post_link 'gptPrecision' %}**    

## LLOps 
+ MaaS
	+ **{% post_link 'gptMaaSMonitor' %}**
	+ **{% post_link 'gptLLMOpsPaaS' %}** 
+ **{% post_link 'gptLLamaFactory' %}**
+ **{% post_link 'gptGPUComputing' %}** 
+ {% post_link 'gptLLMOps' %} 
+ GPU
  + **{% post_link 'gptGPUk8s' %}** 
  + **{% post_link 'gptGPUMetrics' %}** 
  + {% post_link 'gptGPU' %}  


## MLSys
+ **{% post_link 'gptMLSysCUDA' %}** 
+ **{% post_link 'gptTrainCommunication' %}** 
+ **{% post_link 'gptParameterServer' %}**  



