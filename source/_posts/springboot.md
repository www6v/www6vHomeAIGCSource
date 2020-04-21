---
title: springboot
date: 2019-09-20 15:02:28
tags:
  - 微服务
categories:
  - 分布式
  - 服务治理
  - 微服务
  - springboot
---

<p hidden></p>
<!-- more -->

**Spring Boot** is designed to get you up and running as quickly as possible, with **minimal** upfront **configuration** of Spring. Spring Boot takes an opinionated view of building production-ready applications.


## Springboot 4个核心
Auto Configuration
Starter Dependency
Springboot CLI
Actuator（Runtime）

## Springboot 特性
为Spring及第三方库提供自动配置;
无需生成代码或进行xml配置; 
简化了项目的构建配置;

方便地创建可独立运行的Spring应用程序;
直接内嵌的Tomcat， Jetty或者Undertow;
提供生产级特性;

约定优于配置(Convention Over Configuration) CoC



## Starter Dependency
```
<parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.0.0.RELEASE</version>
</parent>

<!-- spring cloud的依赖-->
<dependencyManagement>
</dependencyManagement>
```