---
title: Retrievers
date: 2022-12-31 06:25:34
tags:
  - AIGC
categories:
  - AIGC  
  - Retrievers
---

<p></p>
<!-- more -->


# Langchain Retrievers[10]
### MultiQueryRetriever
The MultiQueryRetriever automates the process of prompt tuning by using an LLM to **generate multiple queries from different perspectives for a given user input query**. 

### Contextual compression

### Ensemble Retriever 
The EnsembleRetriever takes a list of retrievers as input and ensemble the results of their get_relevant_documents() methods and **rerank the results based on the Reciprocal Rank Fusion algorithm**.
The most common pattern is to **combine a sparse retriever (like BM25) with a dense retriever (like embedding similarity)**, because their strengths are complementary. It is also known as “hybrid search”.

### MultiVector Retriever
The methods to create multiple vectors per document include:
    - Smaller chunks: split a document into smaller chunks, and embed those (this is ParentDocumentRetriever).
    - Summary: create a summary for each document, embed that along with (or instead of) the document.
    - Hypothetical questions: create hypothetical questions that each document would be appropriate to answer, embed those along with (or instead of) the document.

### Parent Document Retriever
chunks of data

### Self-querying
This allows the retriever to not only use the user-input query for **semantic similarity comparison** with the contents of stored documents but to also extract filters from the user query on **the metadata** of stored documents and to execute those filters.



# Langchian Retriever[10]

| Name                                                         | Index Type                   | Uses an LLM               | When to Use                                                  | Description                                                  |
| ------------------------------------------------------------ | ---------------------------- | ------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Vectorstore](https://python.langchain.com/docs/modules/data_connection/retrievers/vectorstore) | Vectorstore                  | No                        | If you are just getting started and looking for something quick and easy. | This is the **simplest method** and the one that is easiest to get started with. It involves creating embeddings for each piece of text. |
| [ParentDocument](https://python.langchain.com/docs/modules/data_connection/retrievers/parent_document_retriever) | Vectorstore + Document Store | No                        | If your pages have lots of smaller pieces of distinct information that are best indexed by themselves, but best retrieved all together. | This involves indexing **multiple chunks** for each document. Then you find the  chunks that are most similar in embedding space, but you retrieve the  **whole parent** document and **return** that (rather than individual chunks). |
| [Multi Vector](https://python.langchain.com/docs/modules/data_connection/retrievers/multi_vector) | Vectorstore + Document Store | Sometimes during indexing | If you are able to extract information from documents that you think is more relevant to index than the text itself. | This involves creating multiple vectors for each document. Each vector could be created in a **myriad of ways** - examples include **summaries of the text** and **hypothetical questions**. |
| [Self Query](https://python.langchain.com/docs/modules/data_connection/retrievers/self_query) | Vectorstore                  | Yes                       | If users are asking questions that are better answered by fetching  documents based on metadata rather than similarity with the text. | This uses an LLM to transform user input into two things: (1) a string to  look up semantically, (2) a **metadata filer** to go along with it. This is  useful because oftentimes questions are about the METADATA of documents  (not the content itself). |
| [Contextual Compression](https://python.langchain.com/docs/modules/data_connection/retrievers/contextual_compression) | Any                          | Sometimes                 | If you are finding that your retrieved documents contain too much irrelevant information and are distracting the LLM. | This puts a **post-processing step** on top of another retriever and extracts  only the most relevant information from retrieved documents. This can be done with embeddings or an LLM. |
| [Time-Weighted Vectorstore](https://python.langchain.com/docs/modules/data_connection/retrievers/time_weighted_vectorstore) | Vectorstore                  | No                        | If you have timestamps associated with your documents, and you want to retrieve the most recent ones | This fetches documents based on a combination of semantic similarity (as in  normal vector retrieval) and recency (looking at timestamps of indexed  documents) |
| [Multi-Query Retriever](https://python.langchain.com/docs/modules/data_connection/retrievers/MultiQueryRetriever) | Any                          | Yes                       | If users are asking questions that are complex and require multiple pieces of distinct information to respond | This uses an LLM to **generate multiple queries** from the original one. This is useful when the original query needs pieces of information about  multiple topics to be properly answered. By generating multiple queries, we can then fetch documents for each of them. |
| [Ensemble](https://python.langchain.com/docs/modules/data_connection/retrievers/ensemble) | Any                          | No                        | If you have multiple retrieval methods and want to try combining them. | This fetches documents from **multiple retrievers** and then **combines** them. |
| [Long-Context Reorder](https://python.langchain.com/docs/modules/data_connection/retrievers/long_context_reorder) | Any                          | No                        | If you are working with a long-context model and noticing that it's not  paying attention to information in the middle of retrieved documents. | This fetches documents from an underlying retriever, and then reorders them  so that the most similar are near the beginning and end. This is useful  because it's been shown that for longer context models they sometimes  don't pay attention to information in the middle of the context window. |



# langchain vs. llamaindex [1]

| langchain               | llamaindex                |
| ----------------------- | ------------------------- |
| Ensemble                | Hybrid Fusion             |
| Rewrite-Retrieve-Read   | Query Rewriting           |
|                         | AutoMerging               |
| ParentDocumentRetrieval | Small-to-Big Retrieval    |
|                         | Sentence Window Retrieval |

# 参考
1. [【高级RAG || 原理介绍】Llamaindex 5种高级RAG方法](https://www.bilibili.com/video/BV1qe411r78b/) V 
10. [retrievers](https://python.langchain.com/docs/modules/data_connection/retrievers)

