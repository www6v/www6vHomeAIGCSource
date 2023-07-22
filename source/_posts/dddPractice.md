---
title: DDD-落地实战 Practice
date: 2023-07-06 10:13:28
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

# DDD 落地
###  基于DDD应用架构的核心
分离业务复杂度和技术复杂度

### 设计思路 [4]
+ **贫血模型**
  - 实现
    **业务逻辑放到Service中**
  - 缺点 [7]
    **业务逻辑被埋没在存储业务中**
  - 贫血模型的**缺陷**  [21]
    - 无法保护模型对象的完整性和一致性
    - 对象操作的可发现性极差
    - 代码逻辑重复
    - 代码的健壮性差
    - 强依赖底层实现
  - **99%的代码都是基于贫血模型**  [21]
    - 数据库思维
    - 贫血模型“简单”
    - 脚本思维
  
+ **充血模型**
  -  实现
   **业务逻辑放到领域对象中(实体对象中有实现方法)**
  - 开闭原则
   保持了对象的封装性，使得领域模型在面临多态、继承等复杂结构时，易于变更
  - 适用场景
   类似继承、多态的情况
    在软件设计的过程中需要将一些类型或者编码进行转换
    更好地表现领域对象之间的关系
    “聚合”，也就是在真实世界中那些代表整体与部分的事
  
+ 比较
  - 贫血模型比充血模型更加**简单易行**
    - 贫血模型
      不需要  仓库、工厂、缓存，简单粗暴
  - 充血模型需要更强的**设计与协作能力**
    - 充血模型
      需要开发人员有更强的OOA/D能力、分析业务、业务建模与设计能力
      要有较强的团队协作能力
    - 贫血模型
      所有业务处理过程都交给Service完成
  - 贫血模型更容易应对**复杂的业务处理场景**
    
###  分层  [2]
+ 用户接口层(Controller层) 
+ Application层
+ Domain层
+ Infrastructure层

###  代码分层  [2]
  + Interface
    - assembler(DTO和领域对象的互转)
    - dto
    - facade（**粗粒度的调用接口**，将用户请求**委派**给一个或多个应用服务进行处理）

  + Application
    - event（pub， sub）（**事件处理相关的核心业务逻辑在领域层实现**）
    - service（应用服务）  
    
  + Domain
    - aggregate
      - entity
        - **聚合根** 
        - **实体**     
        - **值对象**   
        - **工厂模式（Factory）**
      - event 
        **事件实体**以及**与事件活动相关的业务逻辑代码**
      - repository
        所在聚合的查询或持久化领域对象的代码，通常包括仓储接口和仓储实现方法
        **Data Model只存在于数据层，而Domain Model在领域层，而链接了这两层的关键对象，就是Repository** [7]
      - service
        领域服务是多个实体组合出来的一段业务逻辑


  + Infrastructure
    - config
    - Util（开发框架、消息、数据库、缓存、文件、总线、网关、第三方类库、通用算法等基础代码，）

### 项目代码[20]

# 框架
+ Axon Framework
+ COLA [22]


# 参考
+ 2. 《13丨代码模型（上）：如何使用DDD设计微服务代码模型？》   欧创新
+ 4. 《04  领域模型是如何指导程序设计的？》 DDD 微服务落地实战-拉钩专栏
+ 7. 《24 直播：框架之上的业务分层》  体系课_Go高级工程师实战营(完结)



+ 20. [阿里技术专家详解DDD系列 第二讲 - 应用架构](https://zhuanlan.zhihu.com/p/343388831)
[refactor 之前的Transaction Script](https://github.com/www6v/jExamples/tree/master/src/main/java/ddd/transactionScript) git
[refactor 之后的DDD](https://github.com/www6v/jExamples/tree/master/src/main/java/ddd/refactor)
+ 21. [阿里技术专家详解DDD系列 第三讲 - Repository模式](https://zhuanlan.zhihu.com/p/348706530) 
+ 22. [COLA 4.0：应用架构的最佳实践](https://blog.csdn.net/significantfrank/article/details/110934799)  未