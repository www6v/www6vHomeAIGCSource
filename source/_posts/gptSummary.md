---
title:  AIGC 汇总
date: 2022-11-16 15:02:55
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

## Basic
+ {% post_link 'ai' %} 
+ {% post_link 'aiOverview' %}
+ {% post_link 'aiMachineLearning' %}

## DeepLearning
+ {% post_link 'aiDeepLearning' %}
+ {% post_link 'gptPytorch' %} 
+ {% post_link 'gptGPU' %} 

## NLP
+ {% post_link 'gptNLPTask' %}  
+ {% post_link 'gptDocSimilarity' %}  
+ {% post_link 'gptDialogue' %}  

## Model
+ 基础
  + {% post_link 'gptLargeModelSurvey' %}
  + {% post_link 'gptLargeModel' %} 
  + {% post_link 'gptTransformer' %} 
  + {% post_link 'gptTransformerCode' %}  
  + {% post_link 'gptEmbedding' %}   
  + {% post_link 'gptTemperature' %}  
+ 基座模型
  + {% post_link 'gptFamily' %}  
  + {% post_link 'gptLlama' %}   
  + {% post_link 'gptLlamaFamily' %}   
  + {% post_link 'gptChatGLM' %}   
  + {% post_link 'gptLeaderBoard' %}  
+ {% post_link 'gptImpossibleTriangle' %} 
+ {% post_link 'gptEmergent' %}   
+ {% post_link 'gptHallucination' %}    
+ {% post_link 'gptEval' %}     

## Training & Inference
+ 训练
  + {% post_link 'gptLargeModelTraining' %}
  + {% post_link 'gptLargeModelTrainingPractice' %} 
  + {% post_link 'gptContinualPretraining' %}  
  + {% post_link 'gptChineseLlama' %}   
  + {% post_link 'gptPrecision' %} 
  + 分布式
    + {% post_link 'gptTrainParallelism' %}    
    + {% post_link 'gptTrainZeroDeepspeed' %}    
    + {% post_link 'gptTrainDeepspeedPractice' %}    
+ 推理 
  + {% post_link 'gptInferFramework' %} 
  + {% post_link 'gptInferFrameworkPractice' %} 
  + {% post_link 'gptInfervLLM' %}  
  + {% post_link 'gptInference' %}
+ 模型压缩
  + {% post_link 'gptQuantization' %} 
  + {% post_link 'gptQuantizationWeight' %} 
  + {% post_link 'gptQuantizationPractice' %}  
+ 平台
  + {% post_link 'gptLLamaFactory' %} 


## Data *
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


## FineTuning
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


## Multimodal *
+ Survey
  + {% post_link 'gptMultimodal' %} 
  + {% post_link 'gptMultimodalSurvey' %}
+ Train  *
  + {% post_link 'gptMultimodalPretrain' %}  
  + {% post_link 'gptMultimodalInstructTuning' %} 
+ 系列
  + {% post_link 'gptMultimodalSeries' %}   
  + backbone 
	+ {% post_link 'gptMultimodalCLIP' %}  
	+ {% post_link 'gptMultimodalSAM' %}   
	+ {% post_link 'gptMultimodalVit' %}   
	+ {% post_link 'gptMultimodalBlip' %}    
  + chat
    + {% post_link 'gptMultimodalLlava' %}  
    + {% post_link 'gptMultimodalMinigpt4' %}   

## RAG *
+ Overview
  + {% post_link 'gptRAG' %}
  + {% post_link 'gptRAGModularRAG' %} 
  + {% post_link 'gptRAGPerformance' %}
+ 实战
  + {% post_link 'gptRAGPractice' %}
  + {% post_link 'gptRAGOptimize' %}
  + {% post_link 'gptRAGFramework' %} 
  + {% post_link 'gptRAGchatchat' %}   
+ 案例 
  + {% post_link 'gptRAGOpenAI' %} 
  + {% post_link 'gptRAGBaichuan' %}   
+ phase 
  + {% post_link 'gptQueryTransformation' %}  
  + {% post_link 'gptRAGRouting' %} 
  + {% post_link 'gptRAGIndex' %}   
  + {% post_link 'gptRAGRerank' %}   
  + {% post_link 'gptRAGSelfReflective' %} 
+ Multimodal RAG  *
  + {% post_link 'gptRAGMultimodal' %}  
  + {% post_link 'gptRAGMultimodalPractice' %}   
  + {% post_link 'gptDocumentAI' %}   

## Agent *
+ Overview
  + {% post_link 'gptAgent' %}
  + {% post_link 'gptAgentCategory' %}
  + {% post_link 'gptAgentList' %}  
  + {% post_link 'gptAgentPractice' %} 
  + {% post_link 'gptAgentChallenge' %} 
+ Reflection
  + {% post_link 'gptAgentReflection' %}  
+ Planning
  + {% post_link 'gptAgentPlanning' %}     
  + {% post_link 'gptAgentPlanAndExecute' %}
+ Multi-agent collaboration
  + {% post_link 'gptMultiAgents' %}  
  + {% post_link 'gptMultiAgentsPractice' %}   
+ Tool use  *
  + {% post_link 'gptFunctionCall' %} 
  + {% post_link 'gptAgentTool' %}  
  + {% post_link 'gptAgentToolGorilla' %}   
  + {% post_link 'gptAgentTuning' %}   
  + {% post_link 'gptAgentToolformer' %}  
+ Multimodal Agent  *
  + {% post_link 'gptAgentMultimodal' %}  
  + {% post_link 'gptAgentWeb' %}   

## Application
+ {% post_link 'gpt' %}
+ {% post_link 'gptLLMOps' %} 
+ {% post_link 'gptVectorStore' %}
+ {% post_link 'gptNL2SQL' %} 
+ 垂类模型
  + {% post_link 'gptDomain' %} 
  + {% post_link 'gptDomainFinance' %}   
  + {% post_link 'gptDomainMed' %}   
  + {% post_link 'gptDomainLaw' %}    

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























