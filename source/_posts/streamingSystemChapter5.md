---
title:  《Streaming System》-第五章：精确一次和副作用
date: 2000-03-16 19:22:34
tags: 
  - Streaming System
categories: 
  - Streaming System
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->


# 为什么"精确一次"很重要

对于许多用户而言，数据处理管道中任何丢失记录或数据丢失的风险都是无法接受的。即使如此，历史上许多通用流处理系统也没有提供关于记录处理的任何保证——所有处理都只是“尽力而为”。其他系统提供了至少一次的保证，确保记录至少被处理一次，但记录可能会重复（从而导致不准确的聚合）；在实践中，许多此类至少一次的系统在内存中执行聚合，因此它们的聚合仍然可能会丢失，当机器崩溃时会出现这种情况。这些系统用于低延迟、推测性结果，但通常不能保证这些结果的准确性。

正如第1章所指出的那样，这导致了一种被称为“Lambda架构”的策略——运行一个流处理系统以获得快速但不准确的结果。稍后（通常是在一天结束后），批处理系统运行以得出正确的答案。这仅在数据流是可重放的情况下才有效；然而，对于足够多的数据源来说，这种策略是可行的。尽管如此，许多尝试使用这种策略的人都遇到了一些问题：

- 不准确

用户往往低估失败的影响。他们通常假设只有少量的记录会丢失或重复（通常基于他们运行的实验），并且在某一天10%（甚至更多！）的记录丢失或重复时感到震惊。在某种意义上，这些系统只提供了“一半”保证——没有完全的保证，任何事情都有可能发生。

- 不一致

用于每日计算的批处理系统通常具有与流处理系统不同的数据语义。让这两个管道产生可比较的结果比最初想象的更困难。

- 复杂

根据定义，Lambda要求您编写和维护两个不同的代码库。您还必须运行和维护两个具有不同故障模式的复杂分布式系统。对于除了最简单的管道之外的任何东西，这很快就变得不可承受。

- 不可预测性

在许多用例中，最终用户将看到与每日结果相差不确定量的流处理结果，这可能会随机变化。在这些情况下，用户将停止信任流处理数据，并等待每日批处理结果，从而破坏了首次获得低延迟结果的价值。

- 延迟

某些业务用例*需要*低延迟的正确结果，而Lambda架构本质上不提供这种结果。

幸运的是，许多Beam运行器可以做得更好。在本章中，我们将解释如何进行“仅一次”流处理，以帮助用户依赖单个代码库和API来保证准确的结果并避免数据丢失的风险。由于可能会影响管道输出的各种问题通常会错误地与“仅一次”保证混淆，因此我们首先解释了在Beam和数据处理的上下文中引用“仅一次”时，哪些问题是在范围内，哪些问题是在范围外。



# 准确性 vs. 完整性

每当 Beam 管道处理管道的记录时，我们希望确保记录从未被丢弃或重复。然而，流水线的本质是，有时记录会在晚些时候出现，此时它们的时间窗口聚合已经被处理完毕。Beam SDK 允许用户配置系统应该等待迟到的数据多长时间；任何晚于此截止日期到达的记录都会被丢弃。这个特性有助于*完整性*，而不是准确性：所有及时出现的记录都被准确地处理一次，而这些迟到的记录则被明确地删除。

虽然迟到的记录通常在流系统的上下文中讨论，但值得注意的是，批处理管道也存在类似的完整性问题。例如，通常的批次范例是在凌晨 2 点运行作业，处理前一天的所有数据。但是，如果昨天的某些数据直到凌晨 2 点后才被收集，那么批处理作业就不会处理这些数据！因此，批处理管道也提供了准确但不总是完整的结果。

###  副作用

Beam 和 Dataflow 的一个特点是，用户注入自定义代码作为其管道图的一部分。Dataflow 不保证该代码仅在流或批处理运行器中每个记录中运行一次。它可能会多次将给定记录通过用户转换运行，或者甚至可能同时在多个工作程序上运行同一记录；这是为了确保在工作程序出现故障时至少处理一次。这些调用中只有一个可以“获胜”，并在管道中进一步产生输出。

因此，不可重复的副作用不能保证仅执行一次；如果您编写具有外部副作用的代码（例如与外部服务联系），那么这些副作用可能会针对给定记录执行多次。这种情况通常是不可避免的，因为无法原子地提交 Dataflow 处理与外部服务上的副作用。管道确实需要最终将结果发送到外部世界，并且这些调用可能不是幂等的。正如本章后面将要介绍的那样，这样的终点通常可以添加一个额外的阶段，将调用重构为幂等操作。

###   问题定义

那么，我们已经给出了几个我们 *不* 讨论的例子。那么，我们究竟是什么意思呢？为了说明这一点，让我们从一个简单的流水线开始，如示例 5-1 所示。

*示例 5-1. 一个简单的流水线*
```
Pipeline p = Pipeline.create(options);
// 计算每个用户每分钟事件的计数。
PCollection<> perUserCounts =
       p.apply(ReadFromUnboundedSource.read())
        .apply(new KeyByUser())
        .Window.<..>into(FixedWindows.of(Duration.standardMinutes(1)))
        .apply(Count.perKey());
// 处理这些每个用户的计数，并将输出写到某个地方。
perUserCounts.apply(new ProcessPerUserCountsAndWriteToSink());
// 将所有这些每个用户的计数相加，以获取所有事件的 1 分钟计数。
perUserCounts.apply(Values.<..>create())
             .apply(Count.globally())
             .apply(new ProcessGlobalCountAndWriteToSink());
p.run();
```

此流水线计算两个不同的窗口聚合。第一个计算了每个用户在一分钟内发生了多少事件，第二个计算了每分钟总共有多少事件。两个聚合都写入了未指定的流式传输终点。

请记住，Dataflow 并行地在许多不同的工作程序上执行管道。在每个 GroupByKey（Count 操作在底层使用 GroupByKey）之后，具有相同键的所有记录都在同一台机器上进行处理，这是一种称为 *shuffle* 的过程。Dataflow 工作程序使用远程过程调用（RPC）在它们之间进行数据洗牌，确保给定键的记录最终都在同一台机器上。

图 5-1 显示了 Dataflow 在示例 5-1 的管道中创建的洗牌过程。Count.perKey 将每个用户的所有数据都洗牌到给定的工作程序上，而 Count.globally 将所有这些部分计数洗牌到单个工作程序上以计算全局总和。

{% asset_img stsy_0501.png  %}
*图 5-1. 管道中的洗牌*

为了准确地处理数据，此洗牌过程必须确保每个记录仅洗牌一次。正如您很快就会看到的那样，洗牌的分布式性质使这成为了一个具有挑战性的问题。

此管道还从外部世界读取和写入数据，因此 Dataflow 必须确保此交互不会引入任何不准确性。Dataflow 一直支持此任务 - 在技术可行的情况下，对于来源和终点，它称之为 Apache Spark 和 Apache Flink 的 *端到端完全一次*。

本章的重点将是以下三个方面：

- 洗牌 Shuffle
  Dataflow 如何保证每个记录仅洗牌一次。

- 来源 Sources
  Dataflow 如何保证每个来源记录仅处理一次。

- 终点 Sinks
  Dataflow 如何保证每个终点产生准确的输出。


# 确保洗牌操作的精确一次

正如刚才所解释的那样，Dataflow 的流式洗牌使用 RPC。现在，每当你有两台机器通过 RPC 通信时，你都应该认真考虑数据完整性。首先，RPC 可能因为许多原因而失败。网络可能会中断，RPC 可能在完成之前超时，或者接收服务器可能决定失败调用。为了保证记录在洗牌过程中不会丢失，Dataflow 使用了 *上游备份*。这意味着发送方将重试 RPC，直到它收到接收肯定收到的确认。Dataflow 还确保即使发送方崩溃，它也将继续重试这些 RPC。这保证了每条记录都至少被传递了一次。

现在，问题是这些重试可能会创建重复。大多数 RPC 框架（包括 Dataflow 使用的框架）提供了一个状态，表示成功或失败。在分布式系统中，您需要意识到，即使 RPC 看起来失败，它有时也可能会成功。有许多原因：与 RPC 超时的竞争条件，服务器的肯定确认尽管 RPC 成功但传输失败等等。发送方真正可以信任的唯一状态是成功状态。

返回失败状态的 RPC 通常表示调用可能成功或可能失败。尽管特定的错误代码可以传达明确的失败，但许多常见的 RPC 失败（如超过截止时间）是模棱两可的。在流式洗牌的情况下，重试真正成功的 RPC 意味着将记录传递两次！Dataflow 需要某种方式来检测和删除这些重复项。

在高层次上，该任务的算法非常简单（见图 5-2）：每个发送的消息都带有唯一的标识符。每个接收器存储已经被看到和处理的所有标识符的目录。每次接收到记录时，它的标识符将在此目录中查找。如果找到了，则将记录作为重复项丢弃。因为 Dataflow 是建立在可扩展的键/值存储之上的，所以该存储用于保存去重目录。

{%  asset_img  stsy_0502.png  %}
*图 5-2. 检测洗牌中的重复项*

# 解决确定性问题

但是，在现实世界中使此策略起作用需要非常小心。一种即时的纹理是 Beam 模型允许用户代码产生不确定的输出。这意味着 ParDo 可以在相同的输入记录上执行两次（由于重试），但每次重试都会产生不同的输出。期望的行为是只有其中一个输出将提交到管道中；但是，所涉及的不确定性使得难以保证两个输出具有相同的确定性 ID。更棘手的是，ParDo 可以输出多条记录，因此这些重试可能会产生不同数量的输出！

那么，为什么我们不简单地要求所有的用户处理都是确定性的呢？我们的经验是，在实践中，许多管道需要不确定的转换。而且，管道作者往往没有意识到他们编写的代码是不确定的。例如，考虑一个转换，它在 Cloud Bigtable 中查找补充数据，以便丰富其输入数据。这是一个不确定的任务，因为外部值可能在转换的重试之间发生变化。任何依赖于当前时间的代码也是不确定的。我们还看到需要依赖随机数生成器的转换。即使用户代码是纯确定性的，任何允许晚数据的事件时间聚合都可能具有不确定性的输入。

Dataflow 通过使用检查点使非确定性处理实际上变得确定性。每个转换的输出都与其唯一 ID 一起检查点到稳定存储中，然后再交付给下一个阶段。在洗牌传递中的任何重试都只是重放已检查点的输出 - 用户的不确定性代码不会在重试时再次运行。换句话说，用户的代码可能会运行多次，但只有其中一个运行可以“赢”。此外，Dataflow 使用一致存储，使其可以防止将重复项写入稳定存储。



# 性能

为了实现精确一次的洗牌交付，每个接收器键中都存储了一个记录 ID 目录，以便于每个到达的记录都可以查找到已经看到的 ID 目录，以确定是否为重复记录。每个步骤的每个输出都会被检查点到存储器中，以确保生成的记录 ID 是稳定的。然而，除非小心实现，否则这个过程会大大降低管道的性能，因为会创建大量的读写。因此，为了使 Dataflow 用户的精确一次处理可行，必须减少 I/O，特别是防止对每个记录进行 I/O。

Dataflow 通过两种关键技术实现了这个目标：图优化和 Bloom 过滤器。

### 图优化

在执行管道图之前，Dataflow 服务对管道图运行一系列优化。其中一项优化是“融合”，即服务将许多逻辑步骤融合成一个单独的执行阶段。图 5-3 显示了一些简单的示例。


{% asset_img  stsy_0503.png  %}
*图 5-3. 示例优化：融合*

所有融合的步骤都作为一个进程单元运行，因此不需要为它们中的每一个存储精确一次数据。在许多情况下，融合会将整个图缩减到几个物理步骤，大大减少了数据传输所需的数据量（并节省了状态使用）。

Dataflow 还通过在发送数据到主分组操作之前在本地执行部分组合操作（例如 Count 和 Sum）来优化关联和可交换的组合操作，如图 5-4 所示。这种方法可以大大减少交付的消息数量，因此也减少了读写的数量。

{% asset_img  stsy_0504.png  %}
*图 5-4. 示例优化：组合器提升*

### Bloom 过滤器

上述优化是改善精确一次性能的一般技术。针对严格改善精确一次处理的优化，我们转向 Bloom 过滤器。

在健康的管道中，大多数到达的记录不是重复的。我们可以利用这个事实通过 Bloom 过滤器大大提高性能，Bloom 过滤器是一种紧凑的数据结构，允许快速的集合成员检查。Bloom 过滤器具有非常有趣的属性：它们可以返回错误的正结果，但永远不会返回错误的负结果。如果过滤器说“是的，元素在集合中”，我们知道元素很可能在集合中（可以计算出概率）。但是，如果过滤器说一个元素不在集合中，那就一定不在。这个功能非常适合这个任务。

Dataflow 的实现方式是这样的：每个 worker 都会保留它看到的每个 ID 的 Bloom 过滤器。每当出现一个新的记录 ID，它就在过滤器中查找。如果过滤器返回 false，则此记录不是重复的，worker 可以跳过更昂贵的稳定存储查找。只有当 Bloom 过滤器返回 true 时，才需要进行第二次查找，但只要过滤器的假阳性率低，这一步很少需要。

然而，Bloom 过滤器往往会随着时间的推移而填满，随着这种情况的发生，假阳性率会增加。此外，我们还需要通过扫描存储的 ID 目录来构建每次 worker 重新启动时的 Bloom 过滤器。

有助于解决这个问题的是，Dataflow 为每个 10 分钟范围创建一个单独的 Bloom 过滤器，而不是创建一个单一的 Bloom 过滤器。当记录到达时，Dataflow 基于系统时间戳查询相应的过滤器。这一步可以防止 Bloom 过滤器饱和，因为随着时间的推移，过滤器会被垃圾回收，同时它也限制了启动时需要扫描的数据量。图 5-5 说明了这个过程：记录到达系统并根据到达时间委派到 Bloom 过滤器。没有任何记录命中第一个过滤器是重复的，所有它们的目录查找都被过滤了。记录 r1 重复，因此需要进行目录查找以验证它确实是重复的；r4 和 r6 的情况也是如此。记录 r8 不是重复的，但由于其 Bloom 过滤器中的假阳性，会生成一个目录查找（该查找将确定 r8 不是重复的，并应该被处理）。

{% asset_img  stsy_0505.png  %}
*图 5-5. 精确一次的 Bloom 过滤器*

### 垃圾回收

每个 Dataflow worker 持久存储它看到的唯一记录 ID 目录。由于 Dataflow 的状态和一致性模型是按键分的，因此每个键存储传递到该键的记录目录。我们不能永远存储这些标识符，否则所有可用存储将最终填满。为了避免这个问题，需要对已确认的记录 ID 进行垃圾回收。

实现此目标的一种策略是，发送方为跟踪仍在传输中的最早序列号（对应于未确认的记录传递）标记每个记录，并为目录中具有早期序列号的任何标识符进行垃圾回收，因为所有早期记录都已经被确认。

然而，有一个更好的选择。如前所述，Dataflow 已经标记每个记录的系统时间戳，用于分桶精确一次的 Bloom 过滤器。因此，Dataflow 不是使用序列号来垃圾回收精确一次目录，而是基于这些系统时间戳计算垃圾回收水印（这是第 3 章讨论的处理时间水印）。这种方法的一个好处是，因为此水印基于在给定阶段中等待的物理时间量（不像数据水印，它基于自定义事件时间），因此它提供了哪些管道部分是慢的直觉。这些元数据是 Dataflow WebUI 中显示的系统滞后度指标的基础。

如果一条记录到达并且带有旧的时间戳，并且我们已经为此时刻进行了垃圾回收标识符会怎么样？这可能是由于我们称为“网络残留”的影响，其中旧消息在网络内部停留了无限期的时间，然后突然出现。垃圾回收的低水印不会提前，直到记录传递已被确认，因此我们知道这条记录已经被成功处理。这些网络残留显然是重复的，并被忽略。





# 数据源的精确一次

Beam 提供了一个用于将数据读入 Dataflow 管道的源 API。如果处理失败并且需要确保源产生的每个唯一记录仅被处理一次，则 Dataflow 可能会从源中重试读取。

对于大多数源，Dataflow 会在透明的情况下处理此过程；这些源是*确定性的*。例如，考虑一个从文件中读取数据的源。文件中的记录始终会按照确定性顺序出现在确定性字节位置上，无论该文件读取多少次。文件名和字节位置唯一标识每个记录，因此服务可以自动生成每个记录的唯一 ID。提供类似确定性保证的另一个源是 Apache Kafka；每个 Kafka 主题都被分成一组固定的分区，分区中的记录始终具有确定性顺序。这些确定性源将在 Dataflow 中无缝工作，没有重复项。

然而，并非所有的源都如此简单。例如，Dataflow 管道的一个常见源是 Google Cloud Pub/Sub。Pub/Sub 是一个*不确定性源*：多个订阅者可以从 Pub/Sub 主题中拉取，但接收给定消息的订阅者是不可预测的。如果处理失败，Pub/Sub 将重新发送消息，但消息可能会被发送到与最初处理它们的不同工作程序以及以不同的顺序。这种不确定性行为意味着 Dataflow 需要协助检测重复项，因为服务无法确定地分配记录 ID 来稳定重试。 （我们稍后在本章中将深入研究 Pub/Sub 的一个更详细的案例研究）。

由于 Dataflow 无法自动分配记录 ID，因此需要非确定性源通知系统记录 ID 应该是什么。Beam 的 Source API 提供了 UnboundedReader.getCurrentRecordId 方法。如果源为每个记录提供唯一 ID 并通知 Dataflow 它需要去重，则具有相同 ID 的记录将被过滤掉。

# Sinks的精确一次

在某个时候，每个管道都需要将数据输出到外部世界，而下沉只是执行此操作的变换。请记住，将数据传送到外部是副作用，我们已经提到过 Dataflow 不保证副作用的精确一次应用。那么，下沉如何保证输出仅被传递一次呢？

最简单的答案是，Beam SDK 的一些内置下沉作为一部分提供。即使多次执行，这些下沉也经过精心设计以确保它们不会产生重复项。在可能的情况下，鼓励管道作者使用其中一个内置下沉。

但是，有时内置功能是不足的，您需要编写自己的功能。最好的方法是确保您的副作用操作是幂等的，并因此能够在重放时具有鲁棒性。但是，副作用 DoFn 的某些组件经常是不确定性的，因此可能会在重放时发生更改。例如，在窗口聚合中，窗口中的记录集也可能是不确定性的！

具体而言，窗口可能会尝试使用元素 e0、e1、e2 触发，但是在提交窗口处理之前（但在将这些元素作为副作用发送之前），工作程序会崩溃。当工作程序重新启动时，窗口将再次触发，但现在会出现延迟元素 e3。因为此元素出现在提交窗口之前，所以它不被计算为延迟数据，因此 DoFn 再次使用元素 e0、e1、e2、e3 调用。然后将它们发送到副作用操作。在这种情况下，幂等性无济于事，因为每次发送了不同的逻辑记录集。

还有其他方法可以引入不确定性。解决此风险的标准方法是依赖于 Dataflow 目前保证 DoFn 的输出版本只有一个可以通过洗牌边界。通过内置的 Reshuffle 变换使用此保证的简单方法。示例 5-2 中呈现的模式确保副作用操作始终接收确定性记录以进行输出。

*示例5-2.Reshuffle 示例*

```
c.apply(Window.<..>into(FixedWindows.of(Duration.standardMinutes(1))))
 .apply(GroupByKey.<..>.create())
 .apply(new PrepareOutputData())
 .apply(Reshuffle.<..>of())
 .apply(WriteToSideEffect());
```

前面的管道将下沉分为两个步骤：PrepareOutputData 和 WriteToSideEffect。PrepareOutputData 输出对应于幂等写入的记录。如果我们只是一个接一个地运行它们，整个过程可能会在失败时重播，PrepareOutputData 可能会产生不同的结果，并且两者都将作为副作用写入。当我们在两者之间添加 Reshuffle 时，Dataflow 保证不会发生这种情况。

当然，Dataflow 仍然可能多次运行 WriteToSideEffect 操作。副作用本身仍然需要是幂等的，否则下沉将接收到重复项。例如，在数据存储中设置或覆盖值的操作是幂等的，并且即使多次运行，也会生成正确的输出。将值附加到列表的操作不是幂等的；如果多次运行操作，则每次都会附加相同的值。

虽然 Reshuffle 提供了一种实现对 DoFn 的稳定输入的简单方法，但 GroupByKey 同样有效。但是，目前有一个提案，可以消除添加 GroupByKey 以实现 DoFn 稳定输入的需要。相反，用户可以使用特殊注释@RequiresStableInput注释WriteToSideEffect，系统将确保该变换的稳定输入。