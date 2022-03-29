---
title: Flink中的Watermark & Window
date: 2022-03-29 23:43:42  
tags:
  - flink
categories: 
  - 大数据 
  - 流式计算 
  - flink
---


<p></p>
<!-- more -->


##  Watermark

##### Watermark触发时机
1. Watermark时间 > window_end_time
   如果当前的watermark已经大于或等于窗口的最大时间戳（即窗口的endTime），那么就会触发窗口计算，并输出结果。
2. 在[window_start_time, window_end_time)区间中有数据存在(左闭右开)

## 参考：
1. muke体系课 - 大数据工程师
2. [Flink Window触发机制](https://www.jianshu.com/p/2a26a26d6599)




