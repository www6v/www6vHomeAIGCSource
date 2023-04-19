---
title: 《Streaming System》-第四章：高级窗口 [完整]
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


大家好！希望大家和我一样喜欢第三章节。水位线是一个很有趣的话题，Slava比地球上任何人都了解它们。现在我们已经对水位线有了更深入的了解，我想深入探讨一些与**“什么”**，**“何地”**，**“何时”**和**“如何”**相关的高级主题。

我们首先看一下***处理时间窗口***，这是一个有趣的组合，既涉及“在哪里”，又涉及“何时”，以更好地理解它与事件时间窗口的关系，并了解在哪些情况下采用这种方法是正确的。然后，我们深入了解一些更高级的事件时间窗口概念，详细了解***会话窗口***，最后通过探索三种不同类型的自定义窗口：***非对齐***固定窗口，***按键***固定窗口和***有界***会话窗口，为什么***广义自定义窗口***是一个有用的（且令人惊讶地简单）概念。


# 何时/何地：处理时间窗口

处理时间窗口对于两个原因都很重要：

- 对于某些用例，例如使用监控（例如，Web服务流量QPS），您希望在观察到它的同时分析传入的数据流，因此处理时间窗口是绝对正确的方法。

- 对于时间事件很重要的用例（例如，分析用户行为趋势、计费、评分等），处理时间窗口绝对不是正确的方法，识别这些情况非常关键。

  

因此，值得深入了解处理时间窗口和事件时间窗口之间的区别，特别是考虑到许多流处理系统中处理时间窗口的普遍性。

在像本书中所呈现的基于事件时间的窗口作为一级概念的模型中工作时，有两种方法可以使用以实现处理时间窗口：

+ 触发器 Triggers
   忽略事件时间（即使用跨越所有事件时间的全局窗口）并使用触发器在处理时间轴上提供该窗口的快照。
+ 进入时间 Ingress time
   将进入时间分配为数据的事件时间，随后使用常规事件时间窗口。这基本上就是Spark Streaming 1.x之类的东西所做的。

请注意，这两种方法或多或少是等效的，尽管它们在多阶段流水线的情况下略有不同：在触发器版本中，多阶段流水线将独立地在每个阶段切片处理时间“窗口”，因此例如，一个阶段的窗口*N*中的数据可能会在下一个阶段中代替窗口*N*-1或*N*+1;在进入时间版本中，在将数据合并到窗口*N*后，由于通过水位线（在Cloud Dataflow情况下）、微批边界（在Spark Streaming情况下）或其他协调因素在引擎级别涉及的进展同步，它将在整个流水线的持续时间内保留在窗口*N*中。



正如我一再指出的那样，处理时间窗口的一个重大缺点是当输入的观察顺序发生变化时，窗口的内容也会发生变化。为了更具体地说明这一点，我们将查看以下三种用例：*事件时间*窗口、通过触发器的*处理时间*窗口和通过进入时间的*处理时间*窗口。

每个将应用于两个不同的输入集（因此总共有六个变体）。两个输入集将是完全相同的事件（即相同的值，在相同的事件时间发生），但是观察顺序不同。第一个集将是我们一直看到的观察顺序，标为白色；第二个则将所有值在处理时间轴上向右移动，如图4-1所示，标为紫色。您可以简单地想象，如果风从东边吹而不是从西边吹（即底层的复杂分布式系统以稍微不同的顺序进行了处理），那么紫色示例就是另一种现实可能发生的方式。

{% dplayer "url=stsy_0401.mp4" %} 

*图4-1。在处理时间中移动输入观察顺序，保持值和事件时间不变*




### 事件时间窗口

为了建立一个基准，让我们先比较事件时间中固定窗口和基于启发式水位线的两种观察顺序。我们将重用示例2-7/图2-10中的早期/晚期代码，以获得图4-2中所示的结果。左边实质上是我们之前看到的；右边是第二个观察顺序的结果。这里需要注意的重要事情是，即使输出的总体形状不同（由于处理时间中的不同观察顺序），*四个窗口的最终结果仍然相同*：14、18、3和12。

{% dplayer "url=stsy_0402.mp4" %} 

*图4-2. 对相同输入的两个不同处理时间顺序的事件时间窗口*






### 触发器的处理时间窗口

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



### 通过进入时间进行处理时间窗口化 |

最后，让我们看一下通过将输入数据的事件时间映射为它们的进入时间来实现的处理时间窗口。在代码方面，这里有四个值得一提的方面：

- 时间转移  Time-shifting
当元素到达时，它们的事件时间需要被覆盖为进入时间。我们可以通过提供一个新的DoFn来在Beam中实现这一点，该函数使用outputWithTimestamp方法将元素的时间戳设置为当前时间。

- 窗口化 Windowing
返回使用标准事件时间固定窗口。

- 触发器  Triggering
因为进入时间提供了计算完美水位线的能力，所以我们可以使用默认的触发器，在这种情况下，当水位线通过窗口的结束时隐式地触发一次。

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

在流引擎上执行的效果如图4-4所示。当数据到达时，它们的事件时间会更新以匹配它们的进入时间（即到达时的处理时间），从而向右水平偏移到理想的水位线线上。这里有一些关于这个图的有趣注释：

- 与其他处理时间窗口示例一样，当输入顺序改变时，我们会得到不同的结果，尽管输入的值和事件时间保持不变。
- 与其他示例不同，窗口再次在事件时间域中（因此沿着x轴）划分。尽管如此，它们并不是真正的事件时间窗口；我们只是将处理时间映射到事件时间域中，抹掉了每个输入的原始出现记录，并用一个新记录替换它，该记录代表了数据被管道首次观察到的时间。
- 尽管如此，由于水位线的存在，触发器的触发仍然会在与先前处理时间示例完全相同的时间发生。

此外，产生的输出值与该示例中的输出值相同，如预期的：左侧为12、18、18，右侧为7、36、5。

- 由于在使用进入时间时可以获得完美的水位线，因此实际水位线与理想水位线匹配，向右上方以1的斜率上升。

{% dplayer "url=stsy_0404.mp4" %} 
*图4-4。通过使用进入时间进行处理时间窗口，在相同输入的两个不同处理时间顺序上*

虽然看到了不同实现处理时间窗口的方法是有趣的，但其中的重要教训自第一章以来一直是我一直在强调的：事件时间窗口是无序的，至少在极限情况下（在输入完成之前，实际窗格可能会有所不同）；处理时间窗口则不是。**如果您关心事件实际发生的时间，您必须使用事件时间窗口，否则您的结果将毫无意义。**现在我将结束我的演讲。



#  何地：会话窗口

处理时间窗口已经够了。现在我们回到了经过验证的事件时间窗口，但现在我们将看看我最喜欢的动态数据驱动窗口之一：*会话*。

会话是一种特殊类型的窗口，可以捕获由不活动间隙终止的数据中的活动期间。它们在数据分析中特别有用，因为它们可以提供特定用户在特定时间段内参与某些活动的活动视图。这允许在会话中的活动之间进行关联，根据会话的长度推断参与水平等等。

从窗口的角度来看，会话有两个特别有趣的方面：

- 它们是*数据驱动的窗口*的例子：窗口的位置和大小是输入数据本身的直接结果，而不是基于一些预定义的时间模式，如固定窗口和滑动窗口。
- 它们也是*不对齐的窗口*的例子。也就是说，窗口并不适用于数据的所有部分，而只适用于特定的数据子集（例如，每个用户）。这与固定窗口和滑动窗口等对齐窗口形成对比，后者通常适用于数据的所有部分。

对于某些用例，可以提前使用共同标识符标记单个会话中的数据（例如，发出带有服务质量信息的心跳脉冲的视频播放器;对于任何给定的观看，所有脉冲都可以提前标记为单个会话ID）。在这种情况下，会话构建起来要容易得多，因为它基本上只是按键分组的一种形式。

然而，在更一般的情况下（即实际会话本身不是提前知道的情况下），会话必须仅从时间内的数据位置构建。处理无序数据时，这变得非常棘手。

图4-5展示了一个示例，其中五个独立记录被分组到具有60分钟间隙超时的会话窗口中。每个记录都开始于其自己的60分钟窗口中（原型会话）。合并重叠的原型会话会产生包含三个和两个记录的两个较大会话窗口。

{% asset_img  stsy_0405.png %}
*图4-5。未合并的原型会话窗口及其结果合并的会话*

提供一般会话支持的关键见解是，完整的会话窗口是一组较小、重叠的窗口的组合，每个窗口包含单个记录，序列中的每个记录与下一个记录之间的不活动间隙不大于预定义的超时时间。因此，即使我们以无序的方式观察会话中的数据，只要到达任何重叠的数据，我们就可以将其合并为最终的会话。

换个角度看，考虑到目前为止我们一直在使用的示例。如果我们指定了一个1分钟的会话超时时间，那么我们期望在图4-6中用虚线黑线划分出两个会话。每个会话都捕获用户的一次活动，会话中的每个事件都至少与会话中的另一个事件相隔不到一分钟。

{% asset_img  stsy_0406.png %}
*图4-6。我们要计算的会话*

为了看到窗口合并如何在遇到事件时随着时间建立这些会话，让我们看看它是如何运作的。我们将使用启用了缩回的早期/准时/后期引发的示例2-10，并将窗口更新为使用一分钟的间隙持续时间超时生成会话。示例4-3说明了这看起来像什么。

*例4-3。使用会话窗口和撤回的早期/准时/延迟触发*   
```
PCollection<KV<Team，Integer>>  totals=input
  .apply（Window.into（Sessions.withGapDuration（ONE_MINUTE）)
                .triggering（
                 AfterWatermark（）
                   .withEarlyFirings（AlignedDelay（ONE_MINUTE））
                   .withLateFirings（AfterCount（1））））
  .apply（Sum.integersPerKey（））;
```

在流引擎上执行，您将获得类似于图4-7所示的内容（请注意，我已经留下了用虚线黑线注释的预期最终会话以供参考）。

{% dplayer "url=stsy_0407.mp4" %}
*图4-7。使用会话窗口和缩回的早期和后期引发的流引擎*

这里有很多事情要做，所以我会向您介绍一些：

- 当遇到值为5的第一个记录时，它被放置在一个单个的原型会话窗口中，该窗口从该记录的事件时间开始，并跨越会话间隙持续时间的宽度；例如，在该数据发生的时间点之后一分钟。我们将来遇到的任何重叠窗口都应该是同一个会话的一部分，并将被合并为这样的窗口。
- 到达的第二个记录是7，由于它与5的窗口不重叠，因此同样被放置在自己的原型会话窗口中。
- 同时，水位线已经过去了第一个窗口的末尾，因此值为5的结果在12:06之前实现为准时结果。不久之后，第二个窗口也作为具有值7的推测结果实现，当处理时间达到12:06时。
- 我们接下来观察到一对记录3和4，其原型会话重叠。因此，它们被合并在一起，当12:07的早期触发器触发时，将发出一个值为7的单个窗口。
- 紧随其后的8，它与值为7的两个窗口重叠。因此，它们全部合并在一起，形成一个新的组合会话，值为22。当水位线通过该会话的末尾时，它会将值为22的新会话以及以前发出但后来合并到其中的值为7的两个窗口的缩回作为材料化。
- 当9到达时，它与值为5的原型会话和值为22的会话一起形成单个较大的会话，值为36。当水位线过去时，36和5和22窗口的缩回都会立即发出。

这是一些非常强大的东西。真正令人惊讶的是，在一个将流处理的维度分解为不同的、可组合的组件的模型中描述这样的东西是多么容易。最终，您可以更专注于有趣的业务逻辑，而不是将数据塑造成可用形式的细枝末节。

如果您不相信我，请查看这篇博客文章，了解如何在Spark Streaming 1.x上手动构建会话（请注意，这不是为了指责他们；Spark的人们已经在其他方面做得足够好，以至于有人确实费心记录构建特定类型的会话支持所需的内容在Spark 1.x之上；您无法对大多数其他系统做出同样的说法）。这非常复杂，他们甚至没有做正确的事件时间会话，也没有提供推测或后期引发或撤销。 [todo 后期引发 是否改成  后期触发 ]



---



# **何地**: 自定义窗口化

到目前为止，我们主要讨论了预定义的窗口化策略：固定、滑动和会话。标准类型的窗口可以获得很多收益，但是有很多真实世界的用例需要能够定义自定义窗口化策略，这真的可以挽救一天（我们将看到其中三个）。

今天大多数系统不支持自定义窗口化，就像Beam这样，因此我们专注于Beam方法。在Beam中，自定义窗口化策略由两个部分组成：

- 窗口分配
  这将每个元素放置在初始窗口中。在极限情况下，这允许将每个元素放置在唯一的窗口中，这是非常强大的。

- （可选）窗口合并
  这允许窗口在分组时间合并，这使窗口随时间演变成为可能，我们早先在会话窗口中看到了这种情况。

为了让您了解窗口化策略真正的简单性以及自定义窗口支持的实用性，我们将详细查看Beam中固定窗口和会话的股票实现，然后考虑一些需要自定义变化的实际用例。在这个过程中，我们将看到创建自定义窗口化策略的简单程度，以及当您的用例不太适合标准方法时，缺乏自定义窗口化支持的限制性有多大。

###  固定窗口的变化

首先，让我们看看相对简单的固定窗口策略。固定窗口的股票实现与您想象的一样简单，包括以下逻辑：

- 分配
  根据其时间戳和窗口的大小和偏移参数，将元素放入相应的固定窗口中。

- 合并
  没有。

代码的缩写版本如示例4-4所示。

*示例4-4. 简写的FixedWindows实现*
```
public class FixedWindows extends WindowFn<Object, IntervalWindow> {
  private final Duration size;
  private final Duration offset;
  public Collection<IntervalWindow> assignWindow(AssignContext c) {
    long start = c.timestamp().getMillis() - c.timestamp()
                  .plus(size)
                  .minus(offset)
                  .getMillis() % size.getMillis();
    return Arrays.asList(IntervalWindow(new Instant(start), size));
}
}
```
请记住，这里展示代码的重点并不是教您如何编写窗口化策略（尽管了解它们并指出它们有多简单很好）。实际上，它有助于对比支持某些相对基本用例的相对容易和困难的相对性，分别使用和不使用自定义窗口化。现在让我们考虑两种固定窗口主题的变化。



---

**未对齐的固定窗口**

默认的固定窗口实现的一个特征是窗口在所有数据中都是对齐的。在我们的运行例子中，给定任何一个团队的从中午到下午1点的窗口与所有其他团队的相应窗口对齐，这些窗口也从中午到下午1点延伸。在您想要在其他维度（例如在团队之间）比较相似窗口的用例中，这种对齐非常有用。然而，它带来了一个相当微妙的成本。所有从中午到下午1点的活动窗口在大约相同的时间内变成完整的，这意味着每小时系统都会面临大量窗口的实现负载。

为了看到我的意思，让我们看一个具体的例子（示例4-5）。我们将从大多数示例中使用的分数总和管道开始，使用固定的两分钟窗口和单个水位线触发器。

*示例4-5. 水位线完整性触发器（与示例2-6相同）*

```
PCollection<KV<Team, Integer>> totals = input
  .apply(Window.into(FixedWindows.of(TWO_MINUTES))
                .triggering(AfterWatermark()))
  .apply(Sum.integersPerKey());
```

但在这种情况下，我们将并行查看来自相同数据集的两个不同键（见图4-8）。我们将看到这两个键的输出都对齐，因为窗口在所有键上都是对齐的。因此，每次水位线通过窗口的末尾时，我们就会获得*N*个窗格的实现，其中*N*是在该窗口中有更新的键的数量。在这个例子中，当*N*开始以千计、百万或更多来排序时，这种同步的突发性可能会变得有问题。

{% dplayer "url=stsy_0408.mp4" %} 
*图4-8. 对齐的固定窗口*

在不需要跨窗口比较的情况下，通常更希望在时间上均匀地分布窗口完成负载。这使系统负载更可预测，可以减少处理峰值负载的资源预配要求。然而，在大多数系统中，如果系统不支持它们，非对齐的固定窗口是不可用的。但是，通过自定义窗口支持，将默认固定窗口实现进行相对简单的修改即可提供非对齐的固定窗口支持。我们想要做的是继续保证所有被分组在一起的元素的窗口（即具有相同键的元素）具有相同的对齐方式，同时放宽跨不同键的对齐限制。默认的固定窗口策略的代码更改如示例4-6所示。

*示例4-6. 简略的UnalignedFixedWindows实现*
```
public class UnalignedFixedWindows
    extends WindowFn<KV<K, V>, IntervalWindow> {
  private final Duration size;
  private final Duration offset;
  public Collection<IntervalWindow> assignWindow(AssignContext c) {
    long perKeyShift = hash(c.element().key()) % size;
    long start = perKeyShift + c.timestamp().getMillis()
                   - c.timestamp()
                      .plus(size)
                      .minus(offset)
    return Arrays.asList(IntervalWindow(new Instant(start), size));
   }
}
```

通过这个改变，所有元素的窗口*具有相同的键*是对齐的，但是元素*具有不同键*的窗口（通常）是不对齐的，因此在成本上分散了窗口完成负载，但这也使得跨键的比较变得不那么有意义。我们可以将我们的管道切换到使用新的窗口策略，如示例4-7所示。

*示例4-7. 使用单个水位线触发器的非对齐固定窗口*
```
PCollection<KV<Team, Integer>> totals = input
  .apply(Window.into(UnalignedFixedWindows.of(TWO_MINUTES))
               .triggering(AfterWatermark()))
  .apply(Sum.integersPerKey());
```

然后，您可以通过比较与之前相同数据集的不同固定窗口对齐方式来查看图4-9的结果（在这种情况下，我选择了两个对齐之间的最大相位移，以最清楚地说明好处，因为在大量键的随机选择相位将产生类似的效果）。

{% dplayer "url=stsy_0409.mp4" %} 
*图4-9. 非对齐的固定窗口*

请注意，我们没有在同时发出多个键的多个窗格的情况。相反，窗格以更均匀的节奏单独到达。这是另一个例子，在用例允许的情况下，在一个维度上进行权衡（跨键比较的能力）以换取另一个维度上的好处（减少峰值资源预配要求）。当您试图尽可能高效地处理大量数据时，这种灵活性至关重要。

现在让我们看一下固定窗口的第二个变体，它与正在处理的数据更紧密地联系在一起。



---
**每个元素/键固定窗口**

我们的第二个例子来自于Cloud Dataflow的早期采用者之一。这家公司为其客户生成分析数据，但每个客户都可以配置其要聚合指标的窗口大小。换句话说，每个客户都可以定义其固定窗口的特定大小。

只要可用窗口大小的数量本身固定，支持这样的用例并不太困难。例如，您可以想象提供选择30分钟、60分钟和90分钟固定窗口的选项，然后为每个选项运行一个单独的管道（或管道分支）。虽然不是理想的解决方案，但也不是太糟糕。但是，随着选项数量的增加，这很快就变得难以处理，在提供支持真正任意的窗口大小的极限情况下（这是该客户的用例所需的），完全是不切实际的。

幸运的是，因为每个客户处理的记录已经用于描述聚合所需窗口大小的元数据进行了注释，因此支持任意的每个用户固定窗口大小就像从股票固定窗口实现中更改了几行代码一样简单，如示例4-8所示。

*示例4-8。修改（和缩写）支持每个元素窗口大小的FixedWindows实现*
```
public class PerElementFixedWindows<T extends HasWindowSize%gt;
    extends WindowFn<T, IntervalWindow> {
  private final Duration offset;
  public Collection<IntervalWindow> assignWindow(AssignContext c) {
    long perElementSize = c.element().getWindowSize();
    long start = perKeyShift + c.timestamp().getMillis()
                   - c.timestamp()
                      .plus(size)
                      .minus(offset)
                      .getMillis() % size.getMillis();
    return Arrays.asList(IntervalWindow(
        new Instant(start), perElementSize));
  }
}
```
通过这个改变，每个元素都被分配到一个固定大小的窗口中，该大小由元素本身携带的元数据所规定。将管道代码更改为使用此新策略再次很简单，如示例4-9所示。

*示例4-9。单个水位线触发器的每个元素固定窗口大小*
```
PCollection<KV<Team, Integer>> totals = input
  .apply(Window.into(PerElementFixedWindows.of(TWO_MINUTES))
               .triggering(AfterWatermark()))
  .apply(Sum.integersPerKey());
```
然后查看此管道的实际执行情况（图4-10），很容易看出键A的元素都具有两分钟的窗口大小，而键B的元素具有一分钟的窗口大小。

{% dplayer "url=stsy_0410.mp4" %} 
*图4-10。每个键的自定义大小固定窗口*

这确实不是您可以合理期望系统为您提供的东西；窗口大小偏好存储的性质对于尝试构建到标准API中来说过于特定于用例，因此不合理。尽管如此，正如该客户的需求所展示的那样，这样的用例确实存在。这就是自定义分窗提供的灵活性如此强大的原因。



---

###  会话窗口的变化

为了真正体现自定义窗口的实用性，让我们看一个最后的例子，这是会话的变化。会话窗口比固定窗口更加复杂。它的实现包括以下内容：

- 分配
  每个元素最初被放置到一个原型会话窗口中，该窗口从元素的时间戳开始，并延伸到间隙持续时间。

- 合并
  在分组时间，所有符合条件的窗口都被排序，之后任何重叠的窗口都被合并在一起。

会话代码的简略版（手动从多个辅助类合并而来）看起来像示例4-10所示。

*示例4-10。简略的会话实现*
```
public class Sessions extends WindowFn<Object, IntervalWindow> {
  private final Duration gapDuration;
  public Collection<IntervalWindow> assignWindows(AssignContext c) {
    return Arrays.asList(
    new IntervalWindow(c.timestamp(), gapDuration));
  }
  public void mergeWindows(MergeContext c) throws Exception {
    List<IntervalWindow> sortedWindows = new ArrayList<>();
    for (IntervalWindow window : c.windows()) {
      sortedWindows.add(window);
    }
    Collections.sort(sortedWindows);
    List<MergeCandidate> merges = new ArrayList<>();
    MergeCandidate current = new MergeCandidate();
    for (IntervalWindow window : sortedWindows) {
      if (current.intersects(window)) {
         current.add(window);
       } else {
         merges.add(current);
         current = new MergeCandidate(window);
      }
     }
     merges.add(current);
     for (MergeCandidate merge : merges) {
       merge.apply(c);
     }
   }
}
```

与以前一样，看代码的重点不在于教你如何实现自定义窗口函数，甚至不在于sessions的实现看起来像什么；它真正的目的是展示您可以通过自定义窗口轻松支持新用途。

---
**有界会话**

我曾多次遇到的一个自定义用例是有界会话：这些会话不允许超过某个特定大小，无论是在时间、元素计数或其他维度上。这可能是由于语义原因，也可能只是一种垃圾邮件保护练习。然而，考虑到限制类型的变化（一些用例关心事件时间内的总会话大小，一些关心元素总数，一些关心元素密度等），为有界会话提供干净简洁的API很困难。让用户实现其自己的自定义窗口逻辑更加实用，以适应其特定的用例。一个这样的用例示例，其中会话窗口受时间限制，可能类似于示例4-11（省略我们将在此处使用的部分构建器样板）。

*示例4-11。缩写会话实现*
```
public class BoundedSessions extends WindowFn<Object, IntervalWindow> {
  private final Duration gapDuration;
  private final Duration maxSize;
  public Collection<IntervalWindow> assignWindows(AssignContext c) {
    return Arrays.asList(
      new IntervalWindow(c.timestamp(), gapDuration));
  }
  private Duration windowSize(IntervalWindow window) {
    return window == null
      ? new Duration(0)
      : new Duration(window.start(), window.end());
  }
  public static void mergeWindows(
    WindowFn<?, IntervalWindow>.MergeContext c) throws Exception {
    List<IntervalWindow> sortedWindows = new ArrayList<>();
    for (IntervalWindow window : c.windows()) {
      sortedWindows.add(window);
    }
    Collections.sort(sortedWindows);
    List<MergeCandidate> merges = new ArrayList<>();
    MergeCandidate current = new MergeCandidate();
    for (IntervalWindow window : sortedWindows) {
      MergeCandidate next = new MergeCandidate(window);
      if (current.intersects(window)) {
        current.add(window);
        if (windowSize(current.union) <= (maxSize - gapDuration))
           continue;
        // Current window exceeds bounds, so flush and move to next
        next = new MergeCandidate();
       }
       merges.add(current);
       current = next;
     }
     merges.add(current);
     for (MergeCandidate merge : merges) {
       merge.apply(c);
     }
   }
}
```
像以前一样，将我们的管道（在本例中是早期/准时/延迟版本的Example2-7）更新为使用此自定义窗口策略是微不足道的，如示例4-12所示。

*示例4-12。通过早期/准时/延迟API进行早期、准时和延迟触发*
```
PCollection<KV<Team, Integer>> totals = input
  .apply(Window.into(BoundedSessions
                       .withGapDuration(ONE_MINUTE)
                       .withMaxSize(THREE_MINUTES))
               .triggering(
                 AfterWatermark()
                   .withEarlyFirings(AlignedDelay(ONE_MINUTE))
                   .withLateFirings(AfterCount(1))))
   .apply(Sum.integersPerKey());
```
并在我们的运行示例上执行，它可能看起来像图4-11。


{% dplayer "url=stsy_0411.mp4" %} 
*图4-11。每个键的自定义大小的固定窗口*

请注意，值为36且跨越[12:00.26,12:05.20)的大会话，在未经界限的会话实现中从图2-7中现在被分成两个较短的长度为2分钟和2分53秒的会话。

鉴于目前很少有系统提供自定义窗口支持，值得指出的是，如果使用仅支持无界会话实现的系统来实现这样的东西，将需要更多的工作量。您唯一的真正手段就是编写会话分组逻辑之后的代码，该代码查看生成的会话并在超过长度限制时将其切分。这将需要在事后分解会话的能力，这将取消增量聚合的好处（我们在第7章中更详细地查看），增加成本。它还会消除任何希望通过限制会话长度获得的垃圾邮件保护好处，因为会话首先需要增长到其完整大小，然后才能被切割或截断。

### 非一刀切

我们现在已经看过三个现实世界的用例，每个用例都是数据处理系统通常提供的窗口类型的微妙变化：不对齐的固定窗口、每个元素的固定窗口和有界会话。在所有三种情况下，我们都看到了通过自定义窗口支持这些用例的简单性，以及在没有它的情况下支持这些用例需要多么困难（或昂贵）。虽然目前自定义窗口在整个行业中尚未得到广泛支持，但它是一项在构建需要尽可能高效地处理大量数据的复杂实际用例的数据处理管道时提供所需灵活性的功能。


#  摘要

高级窗口是一个复杂而多样化的主题。 在本章中，我们涵盖了三个高级概念：

- 处理时间窗口
  我们看到这与事件时间窗口有关，强调了它在本质上有用的地方，并且最重要的是，通过特别强调事件时间窗口提供的结果稳定性来确定那些不行的地方。

- 会话窗口
  我们首次介绍了合并窗口策略的动态类，并看到系统为我们提供了一个如此强大的结构，您可以简单地将其放置在适当的位置。

- 自定义窗口
  在这里，我们看了三个现实世界的自定义窗口示例，这些示例在仅提供静态存储窗口策略的系统中难以实现或不可能实现，但在支持自定义窗口的系统中实现相对容易：
  - *不对齐的固定窗口*，当与固定窗口一起使用水位线触发器时，可以提供更均匀的输出时间分布。
  - *每个元素固定窗口*，可以提供灵活性，动态选择每个元素的固定窗口大小（例如，提供可定制的每个用户或每个广告活动窗口大小），以更好地定制管道语义以适应所涉及的用例。
  - *有界会话窗口*，限制给定会话的大小增长；例如，为了抵消垃圾邮件尝试或将延迟置于由管道实现的已完成会话上。

在与Slava深入水位线的第3章并在此进行高级窗口的广泛调查后，我们已经超越了多个维度中强大的流处理的基础知识。 随着这一点，我们结束了对Beam模型的专注，因此结束了本书的第一部分。

接下来是Reuven的第5章，介绍一致性保证，仅一次处理和副作用，之后我们开始进入第二部分“流和表格”，第6章。

---

1. 据我所知，Apache Flink是唯一支持自定义窗口的系统，其程度达到了Beam的程度。 公平地说，由于可以提供自定义窗口驱逐器的能力，因此其支持甚至超过了Beam的支持。 头爆炸。
2. 我实际上并不知道此类系统目前是否存在。
3. 这自然意味着使用键入数据，但是因为窗口与按键分组密切相关，所以该限制并不特别繁重。
4. 事实上，元素本身并不一定知道窗口大小；您可以轻松查找并缓存适当的窗口大小，以获取所需的维度；例如，按用户或按用户缓存适当的窗口大小。




## Draft Here

{% draft %}
参考
[Streaming Systems｜ 第四章：高级窗口](https://zhuanlan.zhihu.com/p/568497474)
{% enddraft %}