---
title: Streaming System Chapter4
date: 2000-03-14 14:36:25
tags: 
  - Streaming System
categories: 
  - Streaming System
---

<p></p>
<!-- more -->

{% details 点击 %}
# ***When\*/\*Where\*: Processing-Time Windows**

Processing-time windowing is important for two reasons:

- For certain use cases, such as usage monitoring (e.g., web service

traffic QPS), for which you want to analyze an incoming stream of

data as it’s observed, processing-time windowing is absolutely the

appropriate approach to take.

- For use cases for which the time that events happened is important

(e.g., analyzing user behavior trends, billing, scoring, etc.),

processing-time windowing is absolutely the wrong approach to take,

and being able to recognize these cases is critical.

As such, it’s worth gaining a solid understanding of the differences between

processing-time windowing and event-time windowing, particularly given the

prevalence of processing-time windowing in many streaming systems today. —

When working within a model for which windowing as a first-class notion is

strictly event-time based, such as the one presented in this book, there are two

methods that you can use to achieve processing-time windowing: —

Triggers

​	Ignore event time (i.e., use a global window spanning all of event time)

​	and use triggers to provide snapshots of that window in the processing

​	time axis.

Ingress time

​	Assign ingress times as the event times for data as they arrive, and use

​	normal event-time windowing from there on. This is essentially what

​	something like Spark Streaming 1.x does.

Note that the two methods are more or less equivalent, although they differ

slightly in the case of multistage pipelines: in the triggers version, a

multistage pipeline will slice the processing-time “windows” independently at

each stage, so, for example, data in window *N* for one stage might instead end

up in window *N*–1 or *N*+1 in the following stage; in the ingress-time version,

after a datum is incorporated into window *N*, it will remain in window *N* for

the duration of the pipeline due to synchronization of progress between stages

via watermarks (in the Cloud Dataflow case), microbatch boundaries (in the

Spark Streaming case), or whatever other coordinating factor is involved at

the engine level. —

As I’ve noted to death, the big downside of processing-time windowing is

that the contents of the windows change when the observation order of the

inputs changes. To drive this point home in a more concrete manner, we’re

going to look at these three use cases: *event-time* windowing, *processing-time*

windowing via triggers, and *processing-time* windowing via ingress time. —

Each will be applied to two different input sets (so six variations total). The

two inputs sets will be for the exact same events (i.e., same values, occurring

at the same event times), but with different observation orders. The first set

will be the observation order we’ve seen all along, colored white; the second

one will have all the values shifted in the processing-time axis as in Figure 4-

1, colored purple. You can simply imagine that the purple example is another

way reality could have happened if the winds had been blowing in from the

east instead of the west (i.e., the underlying set of complex distributed

systems had played things out in a slightly different order). —



*Figure 4-1. Shifting input observation order in processing time, holding values, and event-times*

*constant*
{% enddetails %}

# ***何时/何地***：处理时间窗口**

处理时间窗口对于两个原因都很重要：

- 对于某些用例，例如使用监控（例如，Web服务流量QPS），您希望在观察到它的同时分析传入的数据流，因此处理时间窗口是绝对正确的方法。

- 对于时间事件很重要的用例（例如，分析用户行为趋势、计费、评分等），处理时间窗口绝对不是正确的方法，识别这些情况非常关键。

  

因此，值得深入了解处理时间窗口和事件时间窗口之间的区别，特别是考虑到许多流媒体系统中处理时间窗口的普遍性。——

在像本书中所呈现的基于事件时间的窗口作为一级概念的模型中工作时，有两种方法可以使用以实现处理时间窗口：——

+ 触发器 Triggers
   忽略事件时间（即使用跨越所有事件时间的全局窗口）并使用触发器在处理时间轴上提供该窗口的快照。
+ 进入时间 Ingress time
   将进入时间分配为数据的事件时间，随后使用常规事件时间窗口。这基本上就是Spark Streaming 1.x之类的东西所做的。

请注意，这两种方法或多或少是等效的，尽管它们在多阶段流水线的情况下略有不同：在触发器版本中，多阶段流水线将独立地在每个阶段切片处理时间“窗口”，因此例如，一个阶段的窗口*N*中的数据可能会在下一个阶段中代替窗口*N*-1或*N*+1;在进入时间版本中，在将数据合并到窗口*N*后，由于通过水印（在Cloud Dataflow情况下）、微批边界（在Spark Streaming情况下）或其他协调因素在引擎级别涉及的进展同步，它将在整个流水线的持续时间内保留在窗口*N*中。——



正如我一再指出的那样，处理时间窗口的一个重大缺点是当输入的观察顺序发生变化时，窗口的内容也会发生变化。为了更具体地说明这一点，我们将查看以下三种用例：*事件时间*窗口、通过触发器的*处理时间*窗口和通过进入时间的*处理时间*窗口。——

每个将应用于两个不同的输入集（因此总共有六个变体）。两个输入集将是完全相同的事件（即相同的值，在相同的事件时间发生），但是观察顺序不同。第一个集将是我们一直看到的观察顺序，标为白色；第二个则将所有值在处理时间轴上向右移动，如图4-1所示，标为紫色。您可以简单地想象，如果风从东边吹而不是从西边吹（即底层的复杂分布式系统以稍微不同的顺序进行了处理），那么紫色示例就是另一种现实可能发生的方式。——

{% dplayer "url=stsy_0401.mp4" %} 

*图4-1。在处理时间中移动输入观察顺序，保持值和事件时间不变*


{% details 点击 %}
# **Event-Time Windowing**

To establish a baseline, let’s first compare fixed windowing in event time

with a heuristic watermark over these two observation orderings. We’ll reuse

the early/late code from Example 2-7/Figure 2-10 to get the results shown in

Figure 4-2. The lefthand side is essentially what we saw before; the righthand

side is the results over the second observation order. The important thing to

note here is that even though the overall shape of the outputs differs (due to

the different orders of observation in processing time), *the final results for the*

*four windows remain the same*: 14, 18, 3, and 12.

*Figure 4-2. Event-time windowing over two different processing-time orderings of the same inputs*
{% enddetails %}

# **事件时间窗口**

为了建立一个基准，让我们先比较事件时间中固定窗口和基于启发式水印的两种观察顺序。我们将重用示例2-7/图2-10中的早期/晚期代码，以获得图4-2中所示的结果。左边实质上是我们之前看到的；右边是第二个观察顺序的结果。这里需要注意的重要事情是，即使输出的总体形状不同（由于处理时间中的不同观察顺序），*四个窗口的最终结果仍然相同*：14、18、3和12。

{% dplayer "url=stsy_0402.mp4" %} 

*图4-2. 对相同输入的两个不同处理时间顺序的事件时间窗口*