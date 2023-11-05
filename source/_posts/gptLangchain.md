---
title: GPT - Langchain
date: 2022-11-02 10:45:06
tags:
  - GPT
categories: 
  - AI
  - Langchain  
---

<p></p>
<!-- more -->

# Basic
+ Model I/O 
  +  Prompts 
     + Prompt Template
     + Example Selectors [类比选择]
  + function call[2]
    
  
+ Retrieval
  + Document Loaders
  + Text Splitters
  + Retrievers-VectoreStoreRetriever
  + VectorStores
  + index

+ Memory

+ Chains
  + 2大类
    Chain interface[Legacy]
    LangChain Expression Language (LCEL)
  + Foundational
    + LLM
    + Sequential- SequentialChain
    + Router
    + Transformation
 
 + Agent
 
# Function Call
``` python
from langchain.chains.openai_functions.base import (
    create_openai_fn_chain,
    create_structured_output_chain,[2]
)
from langchain.chains.openai_functions.citation_fuzzy_match import (
    create_citation_fuzzy_match_chain,
)
from langchain.chains.openai_functions.extraction import (
    create_extraction_chain,
    create_extraction_chain_pydantic,
)
from langchain.chains.openai_functions.qa_with_structure import (
    create_qa_with_sources_chain,
    create_qa_with_structure_chain,
)
from langchain.chains.openai_functions.tagging import (
    create_tagging_chain,
    create_tagging_chain_pydantic,
)
```


#  应用[4]

+ Question & Answering Using Documents As Context[3]
+ Extraction[Kor]
+ Evaluation
+ Querying Tabular Data[sqlite]
+ Code Understanding
+ Interacting with APIs
+ Chatbots


# 参考

1. https://github.com/gkamradt/langchain-tutorials
2. [functioncall](https://github.com/www6v/pyExamples/blob/master/langchain/langchain-functioncall.py)
3. [qaOnDoc](https://github.com/www6v/pyExamples/blob/master/langchain/langchain-qaOnDoc.py)
4. [LangChain Cookbook Part 2: Use Cases](https://github.com/www6v/langchain-tutorials/blob/main/LangChain%20Cookbook%20Part%202%20-%20Use%20Cases.ipynb)

100. https://github.com/kyrolabs/awesome-langchain
101. https://github.com/Crossme0809/langchain-tutorials

