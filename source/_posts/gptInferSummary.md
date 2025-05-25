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
          【3】
  + 系统层优化
    + Batch
      【2】
    + PD 分离
      【3】    
  + 模型层优化 
    + 模型压缩
      + 量化
          【2】
          + PTQ
              【1】 
              + Weight Only 
                【2】
              + Weight&Activation
                【3】
                【1】
    + Sparse Attention
      【1】
+ 其他
  【1】



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



