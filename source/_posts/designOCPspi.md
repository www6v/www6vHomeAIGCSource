---
title: 开闭原则 - SPI
date: 2023-04-02 18:37:42
tags:
  - 设计原则
categories:
  - 架构 
  - 设计原则
---

<p></p>
<!-- more -->



## 开闭原则（Open Closed Principle）
*open for extension, but closed for modification*

## 开闭原则实现 - SPI
+ SPI
  - Java SPI
  - Dubbo SPI
    ```ExtensionLoader```
  - Spring SPI
    ```
    @FunctionalInterface
    @Order(Ordered.LOWEST_PRECEDENCE)
    public interface MyBeanPostProcessor extends BeanPostProcessor {
       // define your methods here
    }
    ```

## 参考
[Java SPI机制以及和Dubbo/Spring SPI对比 ](https://www.cnblogs.com/mpyidudu/p/15808383.html)

[面试官问烂的Dubbo中SPI机制的源码解析](https://www.bilibili.com/video/BV1zp4y1q7fg/) *** 未 
[源码级深度理解 Java SPI](https://zhuanlan.zhihu.com/p/580004065)  未 
[剖析 SPI 在 Spring 中的应用](https://zhuanlan.zhihu.com/p/529674338) 未 
