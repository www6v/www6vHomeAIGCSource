---
title: (原理)Multi-Agents
date: 2023-01-21 19:34:23
tags:
  - Agents
categories:
  - AIGC  
  - Agents
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


# 协作型的 multi-agent 系统[1][2]
### 无序合作
当系统中有三个或三个以上的Agent时，每个Agent都可以自由地公开表达自己的观点和意见。他们可以提供反馈和建议，以修改与当前任务相关的反应。**整个讨论过程不受控制，没有特定的顺序，也没有引入标准化的协作工作流程**。我们把这种多Agent合作称为**无序合作**。

multi-Agent系统中引入一个专门的**协调Agent**，负责整合和组织所有Agent的响应，从而更新最终答案。

> **ChatLLM 网络**是这一概念的典范代表

### 有序合作
当系统中的Agent遵守特定规则时，例如按顺序逐一发表意见，下游Agent只需关注上游的产出。这样，任务完成效率就会大大提高，整个讨论过程也会变得井然有序。

> **CAMEL** 是**双Agent**合作系统的成功实施案例。
> **MetaGPT** 从软件开发中的**经典瀑布模型**中汲取灵感，**将Agent的输入/输出标准化为工程文档**。通过将先进的人类流程管理经验编码到Agent提示中，多个Agent之间的合作变得更有条理。然而，在 MetaGPT 的实践探索中，我们发现了Multi-Agent合作的潜在威胁。**如果不制定相应的规则，多个Agent之间的频繁互动会无限放大轻微的幻觉**。

# 竞争型的 multi-agent 系统[1][2]

当多个Agent在 “针锋相对”的状态下表达自己的论点时，一个**Agent可以从其他Agent那里获得大量外部反馈，从而纠正自己扭曲的想法**。

> **ChatEval**建立了一个基于角色扮演的多Agent裁判团队。


# 竞争型 vs 协作型

|            | 协作型     | 竞争型   |
| ---------- | ---------- | -------- |
| 系统目标   | 整体       | 个体     |
| 主流结构   | 中心化     | 去中心化 |
| agent 功能 | 相对分散   | 相对同质 |
| agent 关系 | 相互依赖   | 相互独立 |
| 是否自运行 | 否         | 是       |
| 系统资源   | 通常不共享 | 共享     |

{%  asset_img 'multi-agents.webp' %}
基于 LLM 的多个代理的交互场景。在合作互动中，代理以无序或有序的方式进行协作，以实现共同目标。在对抗式交互中，代理以针锋相对的方式展开竞争，以提高各自的性能。

# 参考
### survey
1xx. [基于大语言模型多智体的综述：进步和挑战](https://zhuanlan.zhihu.com/p/685286305) 综述
1xx. [万字综述：大语言模型多智能体(LLM Multi-Agents)进展与挑战](https://mp.weixin.qq.com/s?__biz=Mzg5NTc2OTcyOQ==&mid=2247488353&idx=2&sn=374e8671df71ce7c60d2570aacc9fcf6)

1xx. [LLM-Agent-Paper-List](https://github.com/WooooDyy/LLM-Agent-Paper-List) ***  git

2. [《综述：全新大语言模型驱动的Agent》](https://zhuanlan.zhihu.com/p/656676717)  *** 4.2

### xxx
1. [NLP（廿二）：LLM 时代的 multi-agent 系统](https://zhuanlan.zhihu.com/p/665644399?)

1xx. [MetaGPT-ICLR2024: 高效人类工作流(SOPs)融入多Agent协作，显著提升软件工程效率！](https://mp.weixin.qq.com/s?__biz=Mzg5NTc2OTcyOQ==&mid=2247487550&idx=1&sn=28c8147920595f385bec3d3b05911ae7)

1xx. [多Agent系统与任务规划、记忆管理和区块链](https://zhuanlan.zhihu.com/p/696039197)