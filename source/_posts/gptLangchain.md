---
title: Langchain
date: 2022-11-02 10:45:06
tags:
  - GPT
categories: 
  - AIGC
  - Langchain  
---

<p></p>
<!-- more -->

# Basic
+ Model I/O  
  + Language models  [10]        
     + LLM
     + Chat Model
     + Embedding [7]
  +  Prompts 
     + Prompt Template
     + Few-shot example
     + Example Selectors [类比选择]
       关键字  相似度  长度
  + Output parsers
  + function call[2]
    
  
+ Retrieval
  + Document Loaders
  + Text Splitters
  + Retrievers-VectoreStoreRetriever
  + VectorStores
  + index

+ Memory [10]
  - 帮语言模型补充上下文
  - ConversationBufferMemory
  - ConversationBufferWindowMemory
    窗口
  - ConversationSummaryMemory
  - VectorStoreRetrieverMemory
  
+ Chains
  + 2大类
    - Chain interface[Legacy]
    - LangChain Expression Language (LCEL)
      LCEL is a declarative way to compose chains.
  + Foundational
    + LLM
    + Sequential- SequentialChain
    + Router
    + Transformation
  
 + Agent
   - Plan-and-execute agents
   
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



#  Chains [1] [8][9]

``` python
chain = load_summarize_chain(llm, chain_type="stuff", verbose=True)

chain = load_summarize_chain(llm, chain_type="map_reduce", verbose=True)

chain = load_summarize_chain(llm, chain_type="refine", verbose=True)

chain = load_qa_chain(llm, chain_type="map_rerank", verbose=True, return_intermediate_steps=True)
```



| 链类型     | 整合方法                                                   | 优缺点                                        |
| ---------- | ---------------------------------------------------------- | --------------------------------------------- |
| stuff      | 将所有内容放入一个提示中，输入LLM                          | 简单、廉价、效果好/ 对输入文本有一定token限制 |
| Map_reduce | 每个问题和文本块单独给语言模型，并将答案汇总生成最终结果   | 输入任意数量文本，且并行处理/ 速度慢，费token |
| Refine     | 迭代处理多个文本，基于前一个文档答案构建下一个答案         | 用于组合信息，依次构建答案/ 速度慢，费token   |
| Map_rerank | 每个文档单独调用LLM,并要求返回一个得分，然后选择最高的得分 | 需要告诉模型评分的规则/ 费token               |

{% asset_img   chains-type.jpg %}





# 参考

1. https://github.com/gkamradt/langchain-tutorials
2. [functioncall](https://github.com/www6v/pyExamples/blob/master/langchain/langchain-functioncall.py)
3. [qaOnDoc](https://github.com/www6v/pyExamples/blob/master/langchain/langchain-qaOnDoc.py)
4. [LangChain Cookbook Part 2: Use Cases](https://github.com/www6v/langchain-tutorials/blob/main/LangChain%20Cookbook%20Part%202%20-%20Use%20Cases.ipynb)
    10.公开课
5. https://github.com/kyrolabs/awesome-langchain
6. https://github.com/Crossme0809/langchain-tutorials
7. [微信向量检索分析一体化数仓探索：OLAP For Embedding](https://cloud.tencent.com/developer/article/2352088)
8. [吴恩达短课_LangChain](https://zhuanlan.zhihu.com/p/666656208)
9. [精华笔记：吴恩达 x LangChain 《使用LangChain构建与数据对话的聊天机器人》（下）](https://zhuanlan.zhihu.com/p/651216604)
100. [一文入门最热的LLM应用开发框架LangChain](https://cloud.tencent.com/developer/article/2313918) 未
101. [大模型LangChain框架基础与使用示例](https://cloud.tencent.com/developer/article/2331337) 未

