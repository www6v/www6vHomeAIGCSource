---
title: Streaming System-Chapter4
date: 2000-03-14 14:36:25
tags: 
  - Streaming System
categories: 
  - Streaming System
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


{% details 点击  原文  %}
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

  

因此，值得深入了解处理时间窗口和事件时间窗口之间的区别，特别是考虑到许多流媒体系统中处理时间窗口的普遍性。

在像本书中所呈现的基于事件时间的窗口作为一级概念的模型中工作时，有两种方法可以使用以实现处理时间窗口：

+ 触发器 Triggers
   忽略事件时间（即使用跨越所有事件时间的全局窗口）并使用触发器在处理时间轴上提供该窗口的快照。
+ 进入时间 Ingress time
   将进入时间分配为数据的事件时间，随后使用常规事件时间窗口。这基本上就是Spark Streaming 1.x之类的东西所做的。

请注意，这两种方法或多或少是等效的，尽管它们在多阶段流水线的情况下略有不同：在触发器版本中，多阶段流水线将独立地在每个阶段切片处理时间“窗口”，因此例如，一个阶段的窗口*N*中的数据可能会在下一个阶段中代替窗口*N*-1或*N*+1;在进入时间版本中，在将数据合并到窗口*N*后，由于通过水印（在Cloud Dataflow情况下）、微批边界（在Spark Streaming情况下）或其他协调因素在引擎级别涉及的进展同步，它将在整个流水线的持续时间内保留在窗口*N*中。



正如我一再指出的那样，处理时间窗口的一个重大缺点是当输入的观察顺序发生变化时，窗口的内容也会发生变化。为了更具体地说明这一点，我们将查看以下三种用例：*事件时间*窗口、通过触发器的*处理时间*窗口和通过进入时间的*处理时间*窗口。

每个将应用于两个不同的输入集（因此总共有六个变体）。两个输入集将是完全相同的事件（即相同的值，在相同的事件时间发生），但是观察顺序不同。第一个集将是我们一直看到的观察顺序，标为白色；第二个则将所有值在处理时间轴上向右移动，如图4-1所示，标为紫色。您可以简单地想象，如果风从东边吹而不是从西边吹（即底层的复杂分布式系统以稍微不同的顺序进行了处理），那么紫色示例就是另一种现实可能发生的方式。

{% dplayer "url=stsy_0401.mp4" %} 

*图4-1。在处理时间中移动输入观察顺序，保持值和事件时间不变*


{% details 点击   原文  %}

### **Event-Time Windowing**

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

### **事件时间窗口**

为了建立一个基准，让我们先比较事件时间中固定窗口和基于启发式水印的两种观察顺序。我们将重用示例2-7/图2-10中的早期/晚期代码，以获得图4-2中所示的结果。左边实质上是我们之前看到的；右边是第二个观察顺序的结果。这里需要注意的重要事情是，即使输出的总体形状不同（由于处理时间中的不同观察顺序），*四个窗口的最终结果仍然相同*：14、18、3和12。

{% dplayer "url=stsy_0402.mp4" %} 

*图4-2. 对相同输入的两个不同处理时间顺序的事件时间窗口*




{% details 点击   原文  %}
### **Processing-Time Windowing via Triggers**

Let’s now compare this to the two processing-time methods just described.

First, we’ll try the triggers method. There are three aspects to making

processing-time “windowing” work in this manner:

*Windowing*

We use the global event-time window because we’re essentially emulating

processing-time windows with event-time panes.

*Triggering*

We trigger periodically in the processing-time domain based on the

desired size of the processing-time windows.

*Accumulation*

We use discarding mode to keep the panes independent from one another,

thus letting each of them act like an independent processing-time

“window.”

The corresponding code looks something like Example 4-1; note that global

windowing is the default in Beam, hence there is no specific override of the

108windowing strategy.

*Example 4-1. Processing-time windowing via repeated, discarding panes of a*

*global event-time window*
```
PCollection<KV<Team, Integer>> totals = input
.apply(Window.triggering(Repeatedly(AlignedDelay(ONE_MINUTE)))
             .discardingFiredPanes())
.apply(Sum.integersPerKey());
```
When executed on a streaming runner against our two different orderings of

the input data, the results look like Figure 4-3. Here are some interesting notes

about this figure:

- Because we’re emulating processing-time windows via event-time

panes, the “windows” are delineated in the processing-time axis,

which means their effective width is measured on the y-axis instead

of the x-axis.

- Because processing-time windowing is sensitive to the order that

input data are encountered, the results for each of the “windows”

differs for each of the two observation orders, even though the events

themselves technically happened at the same times in each version.

On the left we get 12, 18, 18, whereas on the right we get 7, 36, 5.

*Figure 4-3. Processing-time “windowing” via triggers, over two different processing-time orderings of*

*the same inputs*
{% enddetails %}

### **触发器的处理时间窗口**

现在，我们将此与刚刚描述的两种处理时间方法进行比较。首先，我们将尝试触发器方法。 实现处理时间“窗口化”的方式有三个方面：|
                        
+ *窗口 Windowing*
   我们使用全局事件时间窗口，因为我们基本上是在使用事件时间窗格模拟处理时间窗口。

+ *触发 Triggering*
   我们在处理时间域中定期触发，基于所需处理时间窗口的大小。

+ *累积 Accumulation*
   我们使用丢弃模式使窗格彼此独立，从而使每个窗格像一个独立的处理时间“窗口”。

相应的代码看起来像示例4-1；请注意，全局窗口是Beam的默认设置，因此没有特定的窗口策略覆盖。

*示例4-1。通过重复，丢弃全局事件时间窗格的处理时间窗口*
```
PCollection<KV<Team, Integer>> totals = input
.apply(Window.triggering(Repeatedly(AlignedDelay(ONE_MINUTE)))
             .discardingFiredPanes())
.apply(Sum.integersPerKey());
```

在流处理运行器上针对输入数据的两种不同排序执行时，结果如图4-3所示。这里有一些有趣的注释：
- 因为我们是通过事件时间窗格模拟处理时间窗口，所以“窗口”在处理时间轴上被划分，这意味着它们的有效宽度在y轴上测量而不是x轴。
- 因为处理时间窗口对输入数据的遇到顺序很敏感，所以每个“窗口”的结果对于两个观察顺序中的每一个都不同，尽管事件本身在每个版本中都在技术上相同时发生。

在左侧，我们得到12、18、18，而在右侧，我们得到7、36、5。

{% dplayer "url=stsy_0403.mp4" %} 

*图4-3. 通过触发器的处理时间“窗口”，针对相同输入数据的两种不同处理时间排序*



{% details 点击   原文  %}


### **Processing-Time Windowing via Ingress Time**

Lastly, let’s look at processing-time windowing achieved by mapping the

event times of input data to be their ingress times. Code-wise, there are four

aspects worth mentioning here:

- *Time-shifting*

When elements arrive, their event times need to be overwritten with the

time of ingress. We can do this in Beam by providing a new DoFn that sets

the timestamp of the element to the current time via the

outputWithTimestamp method.

- *Windowing*

Return to using standard event-time fixed windowing.

- *Triggering*

Because ingress time affords the ability to calculate a perfect watermark,

we can use the default trigger, which in this case implicitly fires exactly

once when the watermark passes the end of the window.

- *Accumulation mode*

Because we only ever have one output per window, the accumulation

mode is irrelevant.

The actual code might thus look something like that in Example 4-2.

*Example 4-2. Processing-time windowing via repeated, discarding panes of a*

*global event-time window*

`PCollection<String> raw = IO.read().apply(ParDo.of(`

`new DoFn<String, String>() {`

`public void processElement(ProcessContext c) {`

`c.outputWithTimestmap(new Instant());`

`}`

`});`

`PCollection<KV<Team, Integer>> input =`

`raw.apply(ParDo.of(new ParseFn());`

`PCollection<KV<Team, Integer>> totals = input`

`.apply(Window.info(FixedWindows.of(TWO_MINUTES))`

`.apply(Sum.integersPerKey());`

Execution on a streaming engine would look like Figure 4-4. As data arrive,

their event times are updated to match their ingress times (i.e., the processing

times at arrival), resulting in a rightward horizontal shift onto the ideal

watermark line. Here are some interesting notes about this figure:

- As with the other processing-time windowing example, we get

different results when the ordering of inputs changes, even though

the values and event times for the input stay constant.

- Unlike the other example, the windows are once again delineated in

the event-time domain (and thus along the x-axis). Despite this, they

aren’t bonafide event-time windows; we’ve simply mapped

processing time onto the event-time domain, erasing the original

record of occurrence for each input and replacing it with a new one

that instead represents the time the datum was first observed by the

pipeline.

- Despite this, thanks to the watermark, trigger firings still happen at

exactly the same time as in the previous processing-time example.

Furthermore, the output values produced are identical to that

example, as predicted: 12, 18, 18 on the left, and 7, 36, 5 on the right.

- Because perfect watermarks are possible when using ingress time,

the actual watermark matches the ideal watermark, ascending up and

to the right with a slope of one.

*Figure 4-4. Processing-time windowing via the use of ingress time, over two different processing-time*

*orderings of the same inputs*

Although it’s interesting to see the different ways you can implement

processing-time windowing, the big takeaway here is the one I’ve been

harping on since the first chapter: event-time windowing is order-agnostic, at

least in the limit (actual panes along the way might differ until the input

becomes complete); processing-time windowing is not. *If you care about the*

*times at which your events actually happened, you must use event-time*

*windowing or your results will be meaningless.* I will get off my soapbox

now.

{% enddetails %}



### 通过进入时间进行处理时间窗口化 |

最后，让我们看一下通过将输入数据的事件时间映射为它们的进入时间来实现的处理时间窗口。在代码方面，这里有四个值得一提的方面：

- 时间转移  Time-shifting
当元素到达时，它们的事件时间需要被覆盖为进入时间。我们可以通过提供一个新的DoFn来在Beam中实现这一点，该函数使用outputWithTimestamp方法将元素的时间戳设置为当前时间。

- 窗口化 Windowing
返回使用标准事件时间固定窗口。

- 触发器  Triggering
因为进入时间提供了计算完美水印的能力，所以我们可以使用默认的触发器，在这种情况下，当水印通过窗口的结束时隐式地触发一次。

- 累积模式 Accumulation mode
因为我们每个窗口只有一个输出，所以累积模式是无关紧要的。

实际代码可能看起来像Example 4-2中的代码。
*Example 4-2. 通过重复、丢弃全局事件时间窗口的窗格来实现处理时间窗口*

```
PCollection<String> raw = IO.read().apply(ParDo.of(
    new DoFn<String， String>() {
        public void processElement(ProcessContext c) {
        c.outputWithTimestmap(new Instant());
    }
});
PCollection<KV<Team， Integer>> input =
	raw.apply(ParDo.of(new ParseFn());
PCollection<KV<Team， Integer>> totals = input
	.apply(Window.info(FixedWindows.of(TWO_MINUTES))
	.apply(Sum.integersPerKey());
```

在流引擎上执行的效果如图4-4所示。当数据到达时，它们的事件时间会更新以匹配它们的进入时间（即到达时的处理时间），从而向右水平偏移到理想的水印线上。这里有一些关于这个图的有趣注释：

- 与其他处理时间窗口示例一样，当输入顺序改变时，我们会得到不同的结果，尽管输入的值和事件时间保持不变。
- 与其他示例不同，窗口再次在事件时间域中（因此沿着x轴）划分。尽管如此，它们并不是真正的事件时间窗口；我们只是将处理时间映射到事件时间域中，抹掉了每个输入的原始出现记录，并用一个新记录替换它，该记录代表了数据被管道首次观察到的时间。
- 尽管如此，由于水印的存在，触发器的触发仍然会在与先前处理时间示例完全相同的时间发生。

此外，产生的输出值与该示例中的输出值相同，如预期的：左侧为12、18、18，右侧为7、36、5。

- 由于在使用进入时间时可以获得完美的水印，因此实际水印与理想水印匹配，向右上方以1的斜率上升。

{% dplayer "url=stsy_0404.mp4" %} 
*图4-4。通过使用进入时间进行处理时间窗口，在相同输入的两个不同处理时间顺序上*

虽然看到了不同实现处理时间窗口的方法是有趣的，但其中的重要教训自第一章以来一直是我一直在强调的：事件时间窗口是无序的，至少在极限情况下（在输入完成之前，实际窗格可能会有所不同）；处理时间窗口则不是。**如果您关心事件实际发生的时间，您必须使用事件时间窗口，否则您的结果将毫无意义。**现在我将结束我的演讲。


## Draft Here
{% draft %}
参考
[Streaming Systems｜ 第四章：高级窗口](https://zhuanlan.zhihu.com/p/568497474)
{% enddraft %}