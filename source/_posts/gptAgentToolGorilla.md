---
title: (原理)Gorilla
date: 2023-04-08 07:58:38
tags:
  - agent
categories:
  - AIGC  
  - agent
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 方法论[1]
### 数据集收集 
**API文档**
- HuggingFace平台托管和提供了约203,681个模型。然而，其中许多模型的文档质量较差，缺乏依赖项，模型卡中没有信息等问题。
- 为了筛选出质量较好的模型，从每个领域选择了前20个模型。考虑了多模态数据领域的7个领域，CV领域的8个领域，NLP领域的12个领域，音频领域的5个领域，表格数据领域的2个领域和强化学习领域的2个领域。
- 经过筛选，从HuggingFace获得了总共925个模型。从TensorFlow Hub获得了801个模型，并从Torch Hub获得了95个模型。
- 这些模型的信息被转换为**JSON对象**，其中包含了领域（domain）、框架（framework）、功能（functionality）、API名称（api_name）、API调用（api_call）、API参数（api_arguments）、环境要求（environment_requirements）、示例代码（example_code）、性能（performance）和描述（description）等字段。
- 选择这些字段是为了将其泛化到机器学习领域之外的其他领域，包括RESTful API调用。
**总而言之**，通过筛选和整理，从HuggingFace、TensorFlow Hub和Torch Hub等平台获取了**总共1,645个模型**的信息，并将其以**JSON对象**的形式进行了记录和描述。这些信息包括模型的领域、框架、功能、API调用示例、性能等，以便在机器学习和其他领域中使用和参考。


**指令生成 （Instruction Generation ）**
- 在**self-instruct**范例[42]的指导下，使用GPT-4生成了合成指令数据。
- 提供了三个上下文示例和一个参考API文档，要求模型生成调用API的真实世界用例。
- 明确指示模型在创建指令时不要使用任何API名称或提示。
- 为每个三个模型中心构建了六个示例（**指令-API对**），共计18个点，这些数据是手动生成或修改的。
- 对于**1,645个**API数据点中的每一个，从相应的六个指令示例中随机选择3个，生成**总共10个指令-API对**。
- 强调只需要使用GPT-4生成指令，可以与开源替代方案（如LLaMA、Alpaca等）进行交换。
**总而言之**，通过使用GPT-4生成指令，并结合上下文示例和参考API文档，在每个模型中心构建了六个示例，共计18个点。这些示例被用于**生成1,645个API数据点中的每一个的指令-API对，生成总共10个对应关系**。与开源替代方案相比，GPT-4的指令生成功能被应用在这个过程中。

### Gorilla
**带有约束的API调用（API Call with Constraints）**
- API调用通常具有固有的**约束**，这些约束要求LLM不仅理解API调用的功能，还要**根据不同的约束参数对调用进行分类**。
- 机器学习API调用中常见的约束集是参数大小和准确性的下限。这些约束要求LLM能够根据提示理解和回答问题，例如根据提示选择参数少于10M的图像分类模型，并且至少保持70%的ImageNet准确率。
- **对LLM来说，理解和推理出请求中嵌入的各种约束是一个巨大的挑战**。LLM需要细致地理解用户的功能描述，并能够正确地处理伴随这些调用的复杂约束。
- 这个挑战凸显了在实际API调用中对LLM的复杂要求。仅仅理解API调用的基本功能是不够的，**模型还必须能够应对伴随这些调用的约束，如参数大小和准确性要求**。
总而言之，在机器学习API调用中，LLM面临着理解和处理约束的挑战。除了理解API调用的基本功能外，LLM还需要能够识别和满足伴随调用的约束要求，如参数大小和准确性的下限。这需要模型具备更细致的理解和推理能力，以满足实际API调用的复杂需求。

# 参考
1. [Gorilla：与大规模API相连的大型语言模型](https://zhuanlan.zhihu.com/p/640697382) ***

1xx. [Gorilla：链接海量API的大型语言模型](https://apposcmf8kb5033.pc.xiaoe-tech.com/live_pc/l_64a7d5afe4b09d7237a04b5b) V
1xx. [大猩猩（Gorilla）🦍，连接大量 API 的大型语言模型，能成为未来AI应用的核心么？](https://zhuanlan.zhihu.com/p/632583909) ***


1xx. [gorilla](https://github.com/ShishirPatil/gorilla) git
1xx. [Gorilla: Large Language Model Connected with Massive APIs](https://gorilla.cs.berkeley.edu/)
1xx. [Gorilla blog](https://gorilla.cs.berkeley.edu/blog.html)
1xx. [Gorilla: Large Language Model Connected with Massive APIs](https://ar5iv.labs.arxiv.org/html/2305.15334) paper