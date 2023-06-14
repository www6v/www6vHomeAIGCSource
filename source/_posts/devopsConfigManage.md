---
title: DevOps  配置管理
date: 2022-06-14 12:14:28
tags:
  - devops
categories:
  - devops  
  - 配置管理
---

<p></p>
<!-- more -->

##### 配置管理 [5]
+ 四个理念
  - 版本变更标准化，
  - 将一切纳入版本控制，
  - 全流程可追溯和
  - 单一可信数据源

## 配置管理的时机[1]

+ 构建阶段
  不推荐
+ 部署阶段
+ 启动阶段
+ 运行时阶段
+ 发布阶段


## 实现方式[1]
+ Spring Boot 的 Profile 形式
  - 配置类
    ``` Java 
    @Profile("dev") 
    ```
  - 配置文件
    ``` YAML
    #开发环境
    application-dev.properties
    #测试环境
    application-test.properties
    #生产环境
    application-prod.properties
    ```
    ``` YAML
    spring.profiles.active=prod
    ```
+ 基于 Git 的配置管理
  通常情况下，Git 库中的分支不会合并
  
+ 配置管理系统   
  Apollo， Nacos
  
+ 配置管理数据库 CMDB。

## 参考
1. 《09 -配置管理：实现一包到底的必胜手段》  lg2064-DevOps 落地笔记-拉钩专栏
2. [10 | 配置管理：最容易被忽视的DevOps工程实践基础]() 石雪峰