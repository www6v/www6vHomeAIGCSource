---
title: 《Streaming System》-Chapter4. Advanced Windowing
date: 2000-03-14 22:07:51
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



{% details   点击   原文 %}

# ***Where\*: Session Windows**

Enough with processing-time windowing. Let’s now go back to tried-and-true

event-time windowing, but now we’re going to look at one of my favorite

features: the dynamic, data-driven windows called *sessions*.

Sessions are a special type of window that captures a period of activity in the

data that is terminated by a gap of inactivity. They’re particularly useful in

data analysis because they can provide a view of the activities for a specific

user over a specific period of time during which they were engaged in some

activity. This allows for the correlation of activities within the session,

drawing inferences about levels of engagement based on the lengths of the

sessions, and so on.

From a windowing perspective, sessions are particularly interesting in two

ways:

- They are an example of a *data-driven window*: the location and sizes

of the windows are a direct consequence of the input data

themselves, rather than being based on some predefined pattern

within time, as are fixed and sliding windows.

- They are also an example of an *unaligned window*; that is, a window

that does not apply uniformly across the data, but instead only to a

specific subset of the data (e.g., per user). This is in contrast to

aligned windows like fixed and sliding windows, which typically

apply uniformly across the data.

For some use cases, it’s possible to tag the data within a single session with a

common identifier ahead of time (e.g., a video player that emits heartbeat

pings with quality-of-service information; for any given viewing, all of the

pings can be tagged ahead of time with a single session ID). In this case,

sessions are much easier to construct because it’s basically just a form of

grouping by key.

However, in the more general case (i.e., where the actual session itself is not

known ahead of time), the sessions must be constructed from the locations of

the data within time alone. When dealing with out-of-order data, this becomes

particularly tricky.

Figure 4-5 shows an example of this, with five independent records grouped

together into session windows with a gap timeout of 60 minutes. Each record

starts out in a 60-minute window of its own (a proto-session). Merging

together overlapping proto-sessions yields the two larger session windows

containing three and two records, respectively.

*Figure 4-5. Unmerged proto-session windows, and the resultant merged sessions*

They key insight in providing general session support is that a complete

session window is, by definition, a composition of a set of smaller,

overlapping windows, each containing a single record, with each record in the

sequence separated from the next by a gap of inactivity no larger than a

predefined timeout. Thus, even if we observe the data in the session out of

order, we can build up the final session simply by merging together any

overlapping windows for individual data as they arrive.

To look at this another way, consider the example we’ve been using so far. If

we specify a session timeout of one minute, we would expect to identify two

sessions in the data, delineated in Figure 4-6 by the dashed black lines. Each

of those sessions captures a burst of activity from the user, with each event in

the session separate by less than one minute from at least one other event in

the session.

*Figure 4-6. Sessions we want to compute*

To see how the window merging works to build up these sessions over time

as events are encountered, let’s look at it in action. We’ll take the early/late

code with retractions enabled from Example 2-10 and update the windowing

to build sessions with a one-minute gap duration timeout instead. Example 4-

3 illustrates what this looks like.

*Example 4-3. Early/on-time/late firings with session windows and retractions*

```
PCollection<KV<Team, Integer>> totals = input
.apply(Window.into(Sessions.withGapDuration(ONE_MINUTE))
.triggering(
AfterWatermark()
.withEarlyFirings(AlignedDelay(ONE_MINUTE))
.withLateFirings(AfterCount(1))))
.apply(Sum.integersPerKey());
```

Executed on a streaming engine, you’d get something like that shown in

Figure 4-7 (note that I’ve left in the dashed black lines annotating the

expected final sessions for reference).

*Figure 4-7. Early and late firings with session windows and retractions on a streaming engine*

There’s quite a lot going on here, so I’ll walk you through some of it:

- When the first record with value 5 is encountered, it’s placed into a

single proto-session window that begins at that record’s event time

and spans the width of the session gap duration; for example, one

minute beyond the point at which that datum occurred. Any windows

we encounter in the future that overlap this window should be part of

the same session and will be merged into it as such.

- The second record to arrive is the 7, which similarly is placed into its

own proto-session window, given that it doesn’t overlap with the

window for the 5.

- In the meantime, the watermark has passed the end of the first

window, so the value of 5 is materialized as an on-time result just

before 12:06. Shortly thereafter, the second window is also

materialized as a speculative result with value 7, right as processing

time hits 12:06.

- We next observe a pair of records 3 and 4, the proto-sessions for

which overlap. As a result, they are merged together, and by the time

the early trigger for 12:07 fires, a single window with value 7 is

emitted.

- When the 8 arrives shortly thereafter, it overlaps with both of the

windows with value 7. All three are thus merged together, forming a

new combined session with value 22. When the watermark then

passes the end of this session, it materializes both the new session

with value 22 as well as retractions for the two windows of value 7

that were previously emitted, but later incorporated into it.

- A similar dance occurs when the 9 arrives late, joining the proto

session with value 5 and session with value 22 into a single larger

session of value 36. The 36 and the retractions for the 5 and 22

windows are all emitted immediately by the late data trigger.

This is some pretty powerful stuff. And what’s really awesome is how easy it

is to describe something like this within a model that breaks apart the

dimensions of stream processing into distinct, composable pieces. In the end,

you can focus more on the interesting business logic at hand, and less on the

minutiae of shaping the data into some usable form.

If you don’t believe me, check out this blog post describing how to manually

build up sessions on Spark Streaming 1.x (note that this is not done to point

fingers at them; the Spark folks had just done a good enough job with

everything else that someone actually bothered to go to the trouble of

documenting what it takes to build a specific variety of sessions support on

top of Spark 1.x; you can’t say the same for most other systems out there).

It’s quite involved, and they’re not even doing proper event-time sessions, or

providing speculative or late firings, or retractions.
{% enddetails %}