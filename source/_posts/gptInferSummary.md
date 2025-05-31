---
title: MLSys  汇总(archived)
date: 2000-12-11 11:13:42
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
    + 【1】
    + DP
      【4】
    + TP 
    	【1】    
    + PP     
    	【1】
    + 混合并行
       【2】 
+ 低精度
  【2】    

## LLOps 
+ MaaS
	  [2]
	
	  [3]
	
+ GPU
   [3]


## MLSys
+ **{% post_link 'gptMLSysCUDA' %}** 
+ **{% post_link 'gptTrainCommunication' %}** 
+ **{% post_link 'gptParameterServer' %}**  



