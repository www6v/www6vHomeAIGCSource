---
title: SpringBoot
date: 2019-09-20 15:02:28
tags:
  - 微服务
categories:
  - 中间件
  - spring 
  - springboot
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# Core
### 1.1 Spring Boot定义
**Spring Boot** is designed to get you up and running as quickly as possible, 
with **minimal** upfront **configuration** of Spring. 
Spring Boot takes an opinionated view of building production-ready applications.


### 1.2 Springboot 4个核心
Auto Configuration
Starter Dependency
Springboot CLI
Actuator（Runtime）

### 1.3 Springboot 特性
为Spring及第三方库提供自动配置;
无需生成代码或进行xml配置; 
简化了项目的构建配置;

方便地创建可独立运行的Spring应用程序;
直接内嵌的Tomcat， Jetty或者Undertow;
提供生产级特性;

约定优于配置(Convention Over Configuration) CoC

#  Config
### 2.1 Auto Configuration

```
组件
   @EnableXXX
        @Importer @ImportXXXSelector
   @Conditional
   @ConditionalOnClass
   @ConditionalOnBean
   ... 
```

```
开启自动配置
@EnableAutoConfiguration
@SpringBootApplication
```

```
实现原理 - 有条件的加载机制
@ConditionalOnClass
@ConditionalOnBean
@ConditionalOnMissingBean
@ConditionalOnProperty
...
```


### 2.2 Starter Dependency

+ 直接面向功能
+ 官方Starters spring-boot-starter-*

```
<parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.0.0.RELEASE</version>
</parent>

<!-- 使用方 -->
<!-- 统一管理依赖 --><!-- spring cloud的依赖 -->
<dependencyManagement></dependencyManagement>

<!-- 定义方 -->
Bill of Materials - bom
BOM本质上是一个普通的POM文件
```

+ 扩展自定义starter
... 

### 2.3 外部化配置加载顺序
```
 ...
 命令行参数（--server.port=9000）
 ...
 System.getProperties()
 操作系统环境变量
 ...
```


```
 jar包外的application-{profile}.properties 或 .yml
 jar包内的application-{profile}.properties 或 .yml
 jar包外的application.properties或 .yml
 jar包内的application.properties或 .yml
```

#  运行中的Springboot
### 3.1 Actuator
+ 目的： 监控并管理应用程序
+ 访问方式： HTTP, JMX
+ 依赖： spring-boot-starter-actuator

### 3.1 Actuator Endpoint
+ http访问
/actuator/<id>
+ 端口与路径
+ management.server.address=
+ management.server.port=
  

### 3.2 内嵌的Web容器
可选容器列表
+ spring-boot-starter-tomcat
+ spring-boot-starter-jetty
+ spring-boot-starter-undertow
+ spring-boot-starter-reactor-netty

端口
+ server.port
+ server.address

压缩

Tomcat特性配置
+ server.tomcat.max-connections=10000
+ server.tomcat.max-http-post-size
+ server.tomcat.max-threads


# 参考
1. 《玩转Spring全家桶》 67.68.71.73.75,79 丁雪峰 
2. 《黑马程序员SpringBoot教程，6小时快速入门Java微服务架构Spring Boot》 V

3. [SpringBoot面试题 (史上最全、持续更新、吐血推荐) ](https://www.cnblogs.com/crazymakercircle/p/14365487.html)  尼恩  未
4. [spring + spring mvc + tomcat 面试题（史上最全）](https://www.cnblogs.com/crazymakercircle/p/14465630.html) 尼恩 未
5. [SpringBoot 基础知识 核心知识 【收藏版】](https://www.cnblogs.com/crazymakercircle/p/13895735.html)  尼恩 未
