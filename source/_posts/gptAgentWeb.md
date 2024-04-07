---
title: (原理)Web Agent
date: 2023-03-05 10:30:03
tags:
  - agent
categories:
  - AIGC  
  - agent
---

<p></p>
<!-- more -->

# web scenarios [1]
在网络场景中，代表用户执行特定任务被称为Web导航问题[390]。代理程序解释用户指令，将其分解为多个基本操作，并与计算机进行交互。这通常涉及到填写表单、在线购物和发送电子邮件等网络任务。代理程序需要具备理解复杂网络场景中的指令的能力，适应变化（如嘈杂的文本和动态HTML网页），并推广成功的操作[391]。通过这种方式，代理程序可以在处理未知任务时实现可访问性和自动化[435]，最终使人类免于与计算机用户界面的重复交互。

通过强化学习训练的代理程序可以有效地模仿人类行为，使用预定义的操作，如键入、搜索、导航到下一页等。它们在基本任务（如在线购物[392]和搜索引擎检索[90]）中表现良好，这些任务已经得到广泛探索。然而，没有语言模型能力的代理程序可能难以适应现实世界互联网中更真实和复杂的场景。在动态、内容丰富的网页上，如在线论坛或在线业务管理[391]，代理程序常常面临性能方面的挑战。

为了实现代理程序与更真实的网页之间的成功交互，一些研究人员[393；394]开始利用语言模型的强大HTML读取和理解能力。通过设计提示，他们试图使代理程序理解整个HTML源代码，并预测更合理的下一步操作。Mind2Web[389]结合了为HTML进行微调的多个语言模型，使它们能够在现实世界的场景中总结冗长的HTML代码[388]并提取有价值的信息。此外，WebGum[390]通过使用包含HTML截屏的多模态语料库，赋予代理程序视觉感知能力。它同时进行了语言模型和视觉编码器的微调，加深了代理程序对网页的全面理解。

Performing specific tasks on behalf of users in a web scenario is known as the web navigation problem [390]. Agents interpret user instructions, break them down into multiple basic operations, and interact with computers. This often includes web tasks such as filling out forms, online shopping, and sending emails. Agents need to possess the ability to understand instructions within complex web scenarios, adapt to changes (such as noisy text and dynamic HTML web pages), and generalize successful operations [391]. In this way, agents can achieve accessibility and automation when dealing with unseen tasks in the future [435], ultimately freeing humans from repeated interactions with computer UIs. 



Agents trained through reinforcement learning can effectively mimic human behavior using predefined actions like typing, searching, navigating to the next page, etc. They perform well in basic tasks such as online shopping [392] and search engine retrieval [90], which have been widely explored. However, agents without LLM capabilities may struggle to adapt to the more realistic and complex scenarios in the real-world Internet. In dynamic, content-rich web pages such as online forums or online business management [391], agents often face challenges in performance. 



In order to enable successful interactions between agents and more realistic web pages, some researchers [393; 394] have started to leverage the powerful HTML reading and understanding abilities of LLMs. By designing prompts, they attempt to make agents understand the entire HTML source code and predict more reasonable next action steps. Mind2Web [389] combines multiple LLMs fine-tuned for HTML, allowing them to summarize verbose HTML code [388] in real-world scenarios and extract valuable information. Furthermore, WebGum [390] empowers agents with visual perception abilities by employing a multimodal corpus containing HTML screenshots. It simultaneously fine-tunes the LLM and a visual encoder, deepening the agent’s comprehensive understanding of web pages.

# papers [2]

**In web scenarios**
- [2023/10] **OpenAgents: An Open Platform for Language Agents in the Wild.** *XLang Lab (The University of Hong Kong) arXiv.* [[paper](https://arxiv.org/abs/2310.10634)] [[project page](https://docs.xlang.ai)] [[code](https://github.com/xlang-ai/OpenAgents)] [[demo](https://chat.xlang.ai)]  ***
- [2023/07] **WebArena: A Realistic Web Environment for Building Autonomous Agents.** *Shuyan Zhou (CMU) et al. arXiv.* [[paper](https://arxiv.org/abs/2307.13854)] [[code](https://webarena.dev/)] *
- [2023/07] **A Real-World WebAgent with Planning, Long Context Understanding, and Program Synthesis.** *Izzeddin Gur (DeepMind) et al. arXiv.* [[paper](https://arxiv.org/abs/2307.12856)]
- [2023/06] **SYNAPSE: Leveraging Few-Shot Exemplars for
Human-Level Computer Control.** *Longtao Zheng (Nanyang Technological University) et al. arXiv.* [[paper](https://arxiv.org/abs/2306.07863)] [[code](https://github.com/ltzheng/synapse)] *
- [2023/06] **Mind2Web: Towards a Generalist Agent for the Web.** *Xiang Deng (The Ohio State University) et al. arXiv.* [[paper](https://arxiv.org/abs/2306.06070)] [[code](https://osu-nlp-group.github.io/Mind2Web/)] ***
- [2023/05] **Multimodal Web Navigation with Instruction-Finetuned Foundation Models.** *Hiroki Furuta (The University of Tokyo) et al. arXiv.* [[paper](https://arxiv.org/abs/2305.11854)]
- [2023/03] **Language Models can Solve Computer Tasks.** *Geunwoo Kim (University of California) et al. arXiv.* [[paper](https://arxiv.org/abs/2303.17491)] [[code](https://github.com/posgnu/rci-agent)]
- [2022/07] **WebShop: Towards Scalable Real-World Web Interaction with Grounded Language Agents.** *Shunyu Yao (Princeton University) et al. arXiv.* [[paper](https://arxiv.org/abs/2207.01206)] [[code](https://webshop-pnlp.github.io/)] *
- [2021/12] **WebGPT: Browser-assisted question-answering with human feedback.** *Reiichiro Nakano (OpenAI) et al. arXiv.* [[paper](https://arxiv.org/abs/2112.09332)]
- [2023/05] **Agents: An Open-source Framework for Autonomous Language Agents.** *Wangchunshu Zhou (AIWaves) et al. arXiv.* [[paper](https://arxiv.org/pdf/2309.07870.pdf)] [[code](https://github.com/aiwaves-cn/agents)]  ***

# 参考
1. 《The Rise and Potential of Large Language Model Based Agents: A Survey》、
2. [The Rise and Potential of Large Language Model Based Agents: A Survey](https://github.com/woooodyy/llm-agent-paper-list) git
1xx. [Multimodal Web Navigation with Instruction-Finetuned Foundation Models](https://sites.google.com/view/mm-webnav/)
1xx. [Google DeepMind｜具备规划长程上下文理解和程序合成能力的真实世界WebAgent](https://hub.baai.ac.cn/view/28104)
1xx. [LLMs-Agent 论文: WebAgent, 2023, Izzeddin Gur et al., Google DeepMind.](https://zhuanlan.zhihu.com/p/662146234)
1xx. [OpenAgents](https://github.com/www6v/OpenAgents)


### web  agent
1xx. [WebVoyager：借助强大多模态模型，开创全新的网络智能体 [译]](https://baoyu.io/translations/ai-paper/2401.13919-webvoyager-building-an-end-to-end-web-agent-with-large-multimodal-models)