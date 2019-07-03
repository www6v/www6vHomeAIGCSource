---
title: 设计原则
date: 2018-09-28 10:31:52
tags:
  - 基础
  - 设计原则
categories: 
  - 设计  
---

##### 1. 复杂度 简化本质复杂度，消除偶发复杂性. 
   有三个问题可能会产生偶发复杂度。
      第一个：由于日程或其他外部压力而导致临时大量削减代码。
      第二个是复制。
      第三个诱因是不可逆性，您做出的无法逆转的所有决定都将最终导致某种程度的偶发复杂度。 
   架构师： 去熵， 去复杂度。 

<!-- more -->   

##### 2. 开闭原则 
   1).对于扩展是开放的（Open for extension）。 
   2).对于修改是关闭的（Closed for modification）。

##### 3. Happy path & Sad path 代码执行路径： happy path 和 sad path分离。 
   测试用例： happy path用例。 sad path用例， 使用@Exception（Junit4）， fail（JUnit3）。

##### 4. 奥卡姆剃刀原理 
         如果对于一个现象有好几种解释, 那么最简单的解释往往是最正确的.

##### 5. 笛米特法则 
         只和最亲密的朋友讲话(talk only to your immediate friends). 任何对象都不需要知道与之交互的对象的任何细节.

##### 6. MongoDB设计哲学 
         Databases are specializing – the “one size fits all” approach no longer applies.

##### 7. 排队理论 
         Little's 定律 -> 应用 ： 线程池中多线程个数的确定。

##### 8. 康威定律  
         organizations which design systems ... are constrained to produce designs which are copies of the communication structures of these organizations

      衍生: 
         1).DDD context
         2).微服务模块划分

##### 9. SOLID

##### 10. CAP/BASE

##### 11. “KISS”原则 - Keep it simple and stupid
      衍生: 
         Rob Pike -  Simplicity is Complicated 

##### 12. Amdahl定律, 通用扩展定律(Universal Scalability Law, USL)

##### 13. Rule of least power（够用就好）的原则。

      这个原则是由 WWW 发明者 Tim Berners-Lee 提出的，它被广泛用于指导各种 W3C 标准制定


## 参考：

1. [对开发人员有用的定律、理论、原则和模式](https://github.com/www6v/hacker-laws-zh)
2. [滴滴杜欢：大型微服务框架设计实践](https://mp.weixin.qq.com/s/HSzqIC1pOdq8H12gCvYgRA)


