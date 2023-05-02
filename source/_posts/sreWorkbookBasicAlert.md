---
title: SRE 五大根基-报警
date: 2022-05-02 18:51:42
tags: 
  - sre
categories:
  - 稳定性
  - sre
---

<p></p>
<!-- more -->



### 告警设定考量

- 精准率
  减少误告警
- 查全率
  减少漏告警
{% asset_img  'precision-recall.JPG' %}  

+ 检测用时
  过长  影响错误预算
+ 重置用时
  过长  增长内存和IO开销
  
### 告警设定方法

+ 基础
  - 方法1  目标错误率 >= SLO阈值
+ window
  - 方法2  延长报警时间窗口
  - 方法3  延长告警触发前的持续时间 
+ 燃烧率   
  - 方法4 根据燃烧率发出告警
  - 方法5 基于多个燃烧率的告警
  - 方法6 基于多个窗口 多个燃烧率的告警
  
## 参考
[《Google SRE工作手册》第四期基于SLO的告警配置及实践分享](https://www.bilibili.com/video/BV1ov4y197N1/)


