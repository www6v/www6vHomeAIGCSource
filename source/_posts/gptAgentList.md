---
title: (Survey)Agent List
date: 2023-03-05 16:48:28
tags:
  - Agent
categories: 
  - AIGC
  - Agent  
---

<p></p>
<!-- more -->

[autogen]:https://img.shields.io/github/stars/microsoft/autogen.svg?style=flat-square
[CrewAI]:https://img.shields.io/github/stars/joaomdmoura/CrewAI.svg?style=flat-square
[ChatDev]:https://img.shields.io/github/stars/OpenBMB/ChatDev.svg?style=flat-square
[GenerativeAgents]:https://img.shields.io/github/stars/joonspk-research/generative_agents.svg?style=flat-square
[BabyAGI]:https://img.shields.io/github/stars/yoheinakajima/babyagi.svg?style=flat-square
[AutoGPT]:https://img.shields.io/github/stars/Torantulino/Auto-GPT.svg?style=flat-square
[XAgent]:https://img.shields.io/github/stars/OpenBMB/XAgent.svg?style=flat-square
[MetaGPT]:https://img.shields.io/github/stars/geekan/MetaGPT.svg?style=flat-square
[ResearchGPT]:https://img.shields.io/github/stars/assafelovic/gpt-researcher.svg?style=flat-square
[AgentVerse]:https://img.shields.io/github/stars/OpenBMB/AgentVerse.svg?style=flat-square
[GPTEngineer]:https://img.shields.io/github/stars/AntonOsika/gpt-engineer.svg?style=flat-square



# Agent（General）

| Agent（General） | 类型 | 描述 | Code |
| --- | --- | --- | --- |
|**AutoGen** [video](https://www.bilibili.com/video/BV1DH4y1Z7Ep) paper ***|Multi Agent|customizable, **conversable**,  **seamlessly allow human participation** [微软]|[code](https://github.com/microsoft/autogen)![GitHub Badge][autogen]|
|**MetaGPT** paper***|Multi Agent-role base|覆盖软件公司全生命流程|[code](https://github.com/geekan/MetaGPT)![GitHub Badge][MetaGPT]|
|**CrewAI**[video](https://www.bilibili.com/video/BV12C4y1Y7xm)|Multi Agent|流程定义更灵活|[code](https://github.com/joaomdmoura/CrewAI)![GitHub Badge][CrewAI]|
|**BabyAGI**|**plan and execute**||[code](https://github.com/yoheinakajima/babyagi)![GitHub Badge][BabyAGI]|
|**AutoGPT**|General||[code](https://github.com/Torantulino/Auto-GPT)![GitHub Badge][AutoGPT]|
| **LangGraph** [video](https://www.bilibili.com/video/BV1VN4y1n7bt/) *** | flow engineering          |                                                              |                                                              |
|**XAgent** [video](https://www.bilibili.com/video/BV1D34y1M74F)|**双循环，人可参与**|autogpt，babyagi - 没法收敛，有时候会不可控<br/>metagpt，chatdev sop优化- 有一定的局限性，通用性不够好[面壁智能]|[code](https://github.com/OpenBMB/XAgent)![GitHub Badge][XAgent]|
| Agents [video](https://www.bilibili.com/video/BV1C8411k7UL) paper | single agent\|multi agent | 基于SOP                                                      | [code](https://github.com/aiwaves-cn/agents)                 |
|                                                              |                           |                                                              |                                                              |
|MiniAGI [video](https://www.bilibili.com/video/BV1Hh4y1k7Jz)||simple general-purpose autonomous agent based on the OpenAI API|[code](https://github.com/muellerberndt/mini-agi)|
|AL Legion||An LLM-powered autonomous agent platform|[code](https://github.com/eumemic/ai-legion)|


# Agent(tool/assistant) 

| Agent(tool/assistant)                                        | 类型                           | 描述                                                         | Code                                                         |
| ------------------------------------------------------------ | ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **ResearchGPT** ***                                          | plan and execute               | 融合论文拆解+网络爬虫                                        | [code](https://github.com/assafelovic/gpt-researcher)![GitHub Badge][ResearchGPT] |
| WorkGPT                                                      | tools                          | A GPT agent framework for invoking APIs                      | [code](https://github.com/team-openpm/workgpt)               |
| **AgentTuning**[video](https://www.bilibili.com/video/BV1E84y197Cj/)  paper | 指令微调Agent                  | [清华]                                                       | [code](https://github.com/THUDM/AgentTuning)                 |
| **ModelScope-Agent** [video](https://www.bilibili.com/video/BV1u34y137if) | tools, MSAgent-Bench 训练agent | [阿里魔塔]                                                   | [code](https://github.com/modelscope/modelscope-agent)       |
| open-interpreter                                             | os agent                       | A natural language interface for computers                   | [code](https://github.com/KillianLucas/open-interpreter)     |
| Qwen-Agent [video](https://www.bilibili.com/video/BV1c34y1P7Yg) |                                | Agent framework and applications built upon Qwen, featuring Function Calling, Code Interpreter, RAG, and Chrome extension | [code](https://github.com/QwenLM/Qwen-Agent)                 |
|AutoGPT-Plugins||Auo-GPT插件|[code](https://github.com/Significant-Gravitas/Auto-GPT-Plugins)|
| GPTEngineer                                                  | code  assistant | **自动**工具构建和代码生成                                   | [code](https://github.com/AntonOsika/gpt-engineer)![GitHub Badge][GPTEngineer] |
| Aider                                                        | code  assistant | **交互式**                                                   | [code](https://github.com/paul-gauthier/aider)               |

# Agent(simulation)   
| Agent(simulation)                                            | 类型                | 描述                                                         | Code                                                         |
| ------------------------------------------------------------ | ------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Hyperwriteai [video](https://www.bilibili.com/video/BV1BZ421B7ar/)[website](https://www.hyperwriteai.com/personal-assistant)*** | web agent, os agent |                                                              | [code](https://github.com/OthersideAI/self-operating-computer) |
| **MultiON** [video](https://www.bilibili.com/video/BV1mt421W7sw/)*** | web agent           |                                                              |                                                              |
| webarena paper                                               | web agent           | WebArena: A Realistic Web Environment for Building Autonomous Agents  网络拟真环境，可用于自主智能体的测试，支持在线购物，论坛，代码仓库etc | [code](https://github.com/web-arena-x/webarena)              |
| MiniWoB++：                                                  | web agent           | a web interaction benchmark for reinforcement learning       | [code](https://github.com/Farama-Foundation/miniwob-plusplus) |
| **OpenAgents** [video](https://www.bilibili.com/video/BV1wM41197N7/) paper*** | web agent           | [港大]                                                       | [code](https://github.com/xlang-ai/OpenAgents)               |
| Mobile-Agent [video](https://www.bilibili.com/video/BV1Xv42117hh/) | app agent           | [阿里]                                                       |                                                              |
| **AppAgent** [video](https://www.bilibili.com/video/BV1De411S7ka) [paper] | app agent           | [腾讯]                                                       |                                                              |
| CAMEL                                                        |                     | CAMEL: Communicative Agents for “Mind” Exploration of Large Language Model Society | [code](https://github.com/camel-ai/camel)                    |
| **Generative Agents**                                        |                     | 斯坦福AI小镇                                                 | [code](https://github.com/joonspk-research/generative_agents)![GitHub Badge][GenerativeAgents] |
| AgentVerse                                                   |                     | 多模型交互环境                                               | [code](https://github.com/OpenBMB/AgentVerse)![GitHub Badge][AgentVerse] |
| GPTeam                                                       | Multi Agent         | 多智能体交互                                                 | [code](https://github.com/101dotxyz/GPTeam)                  |
| **ChatDev**[video](https://www.bilibili.com/video/BV1334y1T7K5/) | Multi Agent         | 虚拟软件公司[面壁智能]                                       | [code](https://github.com/OpenBMB/ChatDev)![GitHub Badge][ChatDev] |
| GPT PILOT                                                    |                     | **交互式**                                                   |                                                              |
| DevOpsGPT                                                    |                     | 自动                                                         |                                                              |


# Agent

| Agent                                                        | 类型                           | 描述                                                         | Code                                                     |
| ------------------------------------------------------------ | ------------------------------ | ------------------------------------------------------------ | -------------------------------------------------------- |
| TaskingAI [video](https://www.bilibili.com/video/BV1gp4y1m75S/) | LLMOps                         |                                                              | [code](https://github.com/TaskingAI/TaskingAI)           |
| DIFY [video](https://www.bilibili.com/video/BV14V411Q7wP/)   | LLMOps                         |                                                              |                                                          |
| **AutoGen Studio** [video](https://www.bilibili.com/video/BV1fi4y1i7g7/) *** | LLMOps                         |                                                              |                                                          |
| L3AGI [video](https://www.bilibili.com/video/BV1s94y1K7fP)   | LLMOps                         |                                                              |                                                          |
| agenta                                                       | LLMOps | The all-in-one LLM developer platform: prompt management, evaluation, human feedback, and deployment all in one place. | [code](https://github.com/Agenta-AI/agenta)              |
| SuperAGI | LLMOps |  |  |
| N8N [video](https://www.bilibili.com/video/BV1vT4y1h7UM/)    | work flow                      |                                                              |                                                          |
| TaskWeaver [video](https://www.bilibili.com/video/BV16C4y1c7rd) |                                | 以代码为中心[微软]                                    |                                                          |
| ProAgent [video](https://www.bilibili.com/video/BV1eu4y1b7DN) | work flow                      | [清华]                                                     |                                                          |
| Prompt flow [video](https://www.bilibili.com/video/BV1aG411m7A4/) |                                | [微软]                                                     |                                                          |
| AgentGPT [video](https://www.bilibili.com/video/BV1V94y1s7uT) | agent store, agent template    |                                                              |                                                          |
| Bisheng *                                                    |                                | dify+flowise的结合体                                         |                                                          |







+ AutoLabel - 自助数据标注

# 参考

[awesome-ai-agents](https://github.com/www6v/awesome-ai-agents) git list

[DecryptPrompt](https://github.com/www6v/DecryptPrompt)  ***  git list

[AIGCLINK](https://space.bilibili.com/471000665/video?tid=0&pn=1&keyword=&order=pubdate) V