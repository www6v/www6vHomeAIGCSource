---
title: 领域逻辑和SQL
date: 2018-03-17 10:00:45
tags:
  - 应用架构
  - SQL
  - DDD
categories: 
  - 架构
  - 领域建模   
---
                                   
在企业应用中， 业务逻辑是复杂和庞杂的。 这些业务逻辑应该是被显示， 还是被隐藏， 这是一种选择。 在工作流中， 业务逻辑被从模块中剥离出来， 形成上层的粗粒度的业务流程。 在模块内部， 业务逻辑应该放在内存中， 还是在SQL中， 这也是一种选择。

<!--more-->

拨开项目的DAO层， 你可能会看到大量的SQL字符串， 业务逻辑就隐藏在这里。在有的项目你会看到hibernate之类的ORM框架， PO对象作为一种承载业务逻辑的机制。
 
大量复杂的SQL拼接， 在SQL中放入业务逻辑与企业应用架构的分层原则相违背。OO的本质是抽象和分离， 各司其责。 领域逻辑更符合OO的精神。
 
领域逻辑中的ORM不仅是一种可重用的对象装载方式， 也是一种虚拟化技术。对象与数据库的映射机制由ORM管控，对象装载和业务逻辑的分离， 表对于对象来说是透明的。就像JVM， 硬件对于Java工程师来说是透明的一样。
 
在Domain Logic和SQL之间， 中庸的是Trasaction Script（事务脚本），它根据过程组织业务逻辑，每个过程处理来自表现层的一个单一请求。事务脚本简单的可以看成Domain Logic和Native SQL的结合。
 
Native SQL的拥护者会提到SQL的性能优势。在多表查询中，Domain Logic确实没有Native SQL快。 在一条SQL即一个事务情况下，Native SQL会快些。 但在Domain Logic中， framework会使用cache做局部性的优化， 并且cache的对象是能够跨多个事务复用的（hibernate二级缓存）， 缓存策略也是可配置的。Framework并且提供Lazy load机制，在使用时加载对象， 进一步提升性能。
 
Domain Logic可以在可理解的代码上做性能的改进，找到那占用了80%时间的20%的代码。 Native SQL可以在高性能的代码上做理解性的改进， 但sql中的逻辑是隐式的， 笔者认为要做到后者不易。 维护占到了软件生命周期的很大一部分， 应该先关注可修改性， 再关注性能。性能的第一原则是“不要提早优化”。
 
在长生命周期的企业软件中，需求的迭代和代码的迭代是常态。 改变可能是人们把业务逻辑放在内存中， 使用Domain Logic的主要原因。
 
过度复杂的sql拼接让人很难理解， 面条代码， 逻辑不连贯现象容易形成。 在Domain Logic的基础上， DSL（Domain Specific Language）提供了连贯接口， 业务清晰一目了然。
当然在理解程度上， 有人更适应SQL， 有人更适应Domain Logic， 这也是仁者见仁了。
 
Native SQL中的sql的重用比Domain Logic中对象的重用更困难。 如果想重用一段SQL，在SQL中嵌入了判断逻辑，SQL的复杂度又就增加了。数据库视图是表的接口，可以定义一个视图， query重用定义好的视图。但视图有局限性， 只有select操作， 没有update操作， 如果有DML要求， 还需要定义存储过程。
 
使用视图和存储过程提供的封装是不完全的。 在企业应用中，数据会来源于多个数据源， 多个数据库， xml文件，nosql数据库， 遗留系统等。 在这个情况中，数据存取的完全封装确实只能在应用的分层中实现。
 
Domain Logic提供了抽象层次和模块化的机制， 对象装载和实际业务的分离， 好的对象装载机制会零入侵业务逻辑，如果Annotation用的是JSR标准， 把hibernate替换成OpenJPA也比较容易。
 
Domain Logic要求对framework有好的把握， 一定的驾驭能力， 问题的解决能力。 Domain Logic里的对象有更多的约束条件，更多的模式， 比如一对一，多对一，多对多。  SQL相对更容易掌握， 代码直接可控。
 
如果想要有可移植性，请不要使用sql。 各个语言都有自己的方言， 语法有略微的不同。Id的增长方式不同，有sequence， 有自增的， 有全局的。Mysql有limit关键字，oracle有rowid和rownum, db2有ROW_NUMBER() over(). 如果有数据库移植的需求， 已经写的Native SQL就会有大的改动。
 
 
## 参考：
[Domain Logic and SQL](http://martinfowler.com/articles/dblogic.html)    



