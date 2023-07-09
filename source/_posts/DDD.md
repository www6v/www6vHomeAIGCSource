---
title: DDD  领域驱动设计
date: 2020-05-22 09:54:58
tags:
  - DDD
categories:
  - 架构 
  - 应用架构 
  - DDD  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# 目标
+ DDD的精髓是降低**系统复杂度**
+ 规则

# 三个核心
### 统一语言

+ 核心领域词汇表
+ 统一语言重构迭代： 模型-》实现-》 重构-》 隐喻 -》 再到模型
+ 命名规范
+ DSL - Domain Specific Language

###  领域划分 
+ 领域
+ 子域
+ 边界上下文（Bounded Context）
+ 上下文映射（Context Mapping)
共享内核（Shared Kernel） 
防腐层（Anti-Corruption）： 类似adaptor、facade， 对内部领域模型的隔离和屏蔽。

###  领域模型 
+ 抽象： 
  是从具体事物抽取、概括出它们共同的方面、本质属性与关系等。

+ 领域建模方法论：
  UML用例分析、 UML用例分析法
  四色建模法
  [事件风暴](https://www.eventstorming.com/)

# 模式 [3]
{% asset_img  'ddd.png' %}


- **实体** [4]   
  **可变性**是实体的特点
- **值对象**  [4] 
  **不变性**是值对象的本质
-  service
 领域服务是多个实体组合出来的一段业务逻辑

- 聚合[5]
  真实世界中**整体与部分**的关系
  正是因为有这样的关系，在操作整体的时候，整体就封装了对部分的操作。
  所谓的整体与部分的关系，就是当整体不存在时，部分就变得没有了意义。
  - **每个聚合对应一个Repo interface** [7]
  - 对聚合内的**数据一致性**负责[7]
- 聚合根
   外部访问的唯一入口

# 架构
### 六边形架构
又被称之为**Ports and Adapters（端口和适配器架构）**


# 整洁架构 Clean Architecture
+ 核心观点 [7][8]
  - 不与框架绑定
    java-spring, Quarkus
  - 可测试
    mock- gomock, Testify
  - 不与UI绑定
  - 不与数据库绑定
    DDD 中的Repo
  - 不依赖任何外部代理

+ Go的实现 [9][10]

# 参考
1. 《DDD（Domain Driven Design)的精髓》  直播+ppt  阿里张建飞  钉钉2020.05.21视频
2. xxx
3. [领域驱动设计之领域模型](https://www.cnblogs.com/netfocus/archive/2011/10/10/2204949.html) *** 
4. 《04  领域模型是如何指导程序设计的？》 DDD 微服务落地实战-拉钩专栏
5. 《05  聚合、仓库与工厂：傻傻分不清楚》  DDD 微服务落地实战-拉钩专栏
6. {% post_link 'DomainLogicAndSQL' %}  self
7. 《24 直播：框架之上的业务分层》  体系课_Go高级工程师实战营(完结)
8. [The Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
9. [clean-architecture-go-v2](https://github.com/eminetto/clean-architecture-go-v2) git
10. [go-clean-arch](https://github.com/bxcodec/go-clean-arch)

### 资源
1. 《实现领域驱动设计》 B  *** 
2. 《领域专用语言实战》 B  没纸质
3. 《领域驱动设计精粹》B  没纸质 
4. 《中台架构与实现 : 基于DDD和微服务》 B  没纸质
5. [事件风暴和领域建模在阿里巴巴的落地实践](https://developer.aliyun.com/live/2874)  未
6. 《DDD实战课》 
7. 《mksz541-DDD（领域驱动设计）思想解读及优秀实践~4》 V  
8. 《lg2061-DDD 微服务落地实战-拉钩专栏》 V  ***   有代码



