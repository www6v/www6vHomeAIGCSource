---
title: Flink-Watermark & Window
date: 2022-03-29 23:43:42  
tags:
  - flink
categories: 
  - 大数据 
  - 计算  
  - 流式计算 
  - flink
---


<p></p>
<!-- more -->



#  Watermark [3]

###  定义 作用

• Watermark 用于标记 Event-Time 的前进过程；
• Watermark 跟随 DataStream Event-Time 变动，并自身携带 TimeStamp；
• Watermark 用于表明所有较早的事件已经（可能）到达；
• Watermark 本身也属于特殊的事件；

###  目的
用于处理乱序和延迟事件.   

### 类型
+ 完美的Watermark
在顺序事件中没有太大的意义
{% asset_img   perfectWaterwark.JPG %}

+ 启发式的Watermark
EG    W(11) =  15 - maxOutOfOrderness(4)
    W(7) = 11 - maxOutOfOrderness(4)    
{% asset_img   heuristicWatermark.JPG %}

+ 迟到事件
迟到事件被丢弃  不计算在窗口中
{% asset_img  lateEvent.JPG  %}

###  Watermark触发时机 [2]

1. Watermark时间 > window_end_time
   如果当前的watermark已经大于或等于窗口的最大时间戳（即窗口的endTime），那么就会触发窗口计算，并输出结果。
2. 在[window_start_time, window_end_time)区间中有数据存在(左闭右开)

## 参考

1. muke体系课 - 大数据工程师
2. [Flink Window触发机制](https://www.jianshu.com/p/2a26a26d6599) *
3. 《Flink核心技术与实战》  极客时间  第三章 *** 



