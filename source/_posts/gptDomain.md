---
title: 垂类大模型
date: 2023-01-04 10:13:10
tags:
  - 大模型
categories: 
  - AIGC
  - 大模型  
---

<p></p>
<!-- more -->


### 领域微调模型 [1]
+ 注入领域知识，分成三种：
  - 继续预训练注入
  - 微调注入以及
  - 外挂注入

### 关注点 [2]
+ **领域相关数据**  是Continue PreTrain的关键
+ **混合通用数据**以**缓解模型遗忘通用能力**
+ **领域模型Continue PreTrain**时可以同步加入**SFT数据**，即MIP，Multi-Task Instruction PreTraining
+ 仅用SFT做领域模型时，**资源有限**就用在**Chat模型基础上训练**，**资源充足**就在**Base模型上训练**。（**资源=数据+显卡**）
+在Chat模型上进行SFT时，请一定**遵循Chat模型原有的系统指令&数据输入格式**。
+ 领域评测集时必要内容，建议有两份，一份选择题形式自动评测、一份开放形式人工评测。


# 参考
1. [领域微调大模型入局的自我和解：领域微调大模型若一定要做，则务必想的若干个前提条件 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648401405&idx=1&sn=59baf4a22d9a9abeb42599ac91e11a79)
2. [领域大模型-训练Trick&落地思考](https://zhuanlan.zhihu.com/p/648798461)


1xx. [垂直领域大模型的一些思考及开源模型汇总](https://zhuanlan.zhihu.com/p/642611747)
1xx. [层出不穷的垂域微调大模型非最全汇总：12大领域、57个领域微调模型概述及对垂直行业问答的一些讨论 ](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648403459&idx=2&sn=0219fc098c208e36cd32940e71089fd2)
    [Awesome-Domain-LLM](https://github.com/www6v/Awesome-Domain-LLM)
1xx. [医疗金融法律大模型：从ChatDoctor到BloombergGPT/FinGPT/FinBERT、ChatLaw/LawGPT_zh](https://blog.csdn.net/v_JULY_v/article/details/131550529?spm=1001.2014.3001.5502)
1xx. [再谈垂直领域大模型及今日前沿速递：金融领域FinBERT、BloombergGPT以及法律领域微调模型LawGPT_zh](https://mp.weixin.qq.com/s?__biz=MzAxMjc3MjkyMg==&mid=2648400666&idx=1&sn=bc47e8c4eca6fc4baaded42fa3c6bd77)


1xx. {% post_link 'gptLeaderBoard' %} self
