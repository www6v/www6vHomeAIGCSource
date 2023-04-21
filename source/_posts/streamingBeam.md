---
title: 流计算-Beam
date: 2022-04-21 14:59:09
tags:
  - flink
categories: 
  - 大数据 
  - 计算  
  - 流式计算 
  - Beam
---


<p></p>
<!-- more -->

# 组件
### PCollection [1]
+ Parallel Collection，意思是可并行计算的数据集
+ 特性
  - 无序的
  - 没有固定大小
    不一定有固定的边界
    可以是有界的，也可以是无界的
  - 不可变性  
  - **延迟执行（deferred execution）**的模式


### Transform [2]
+ 基本概念
``` Java
pcollection.apply(ParDo.of(new DoFn()))
```

+ Stateful Transform 和 side input/side output
``` Java
static class FindUserNameFn extends DoFn<String, String> {

  @ProcessElement

  public void processElement(@Element String userId, OutputReceiver<String> out) {

    out.output(database.FindUserName(userId));

  }
  
  Database database;
}
```

### Pipeline

## 参考
1. 《24 | PCollection：为什么Beam要如此抽象封装数据？ 》  蔡元楠
2. 《25 | Transform：Beam数据转换操作的抽象方法 》 蔡元楠