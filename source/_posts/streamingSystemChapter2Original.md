---
title: 《Streaming System》-Chapter 2. The What, Where, When, and How of Data Processing
date: 2000-03-17 22:08:13
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

# **Roadmap**

To help set the stage for this chapter, I want to lay out the five main concepts

that will underpin all of the discussions therein, and really, for most of the rest

of Part I. We’ve already covered two of them.

In Chapter 1, I first established the critical distinction between event time (the

time that events happen) and processing time (the time they are observed

during processing). This provides the foundation for one of the main theses

put forth in this book: if you care about both correctness and the context

within which events actually occurred, you must analyze data relative to their

inherent event times, not the processing time at which they are encountered

during the analysis itself.

I then introduced the concept of *windowing* (i.e., partitioning a dataset along

temporal boundaries), which is a common approach used to cope with the fact

that unbounded data sources technically might never end. Some simpler

examples of windowing strategies are *fixed* and *sliding* windows, but more

sophisticated types of windowing, such as *sessions* (in which the windows are

defined by features of the data themselves; for example, capturing a session of

activity per user followed by a gap of inactivity) also see broad usage.

In addition to these two concepts, we’re now going to look closely at three

more:

- Triggers

A trigger is a mechanism for declaring when the output for a window

should be materialized relative to some external signal. Triggers provide

flexibility in choosing when outputs should be emitted. In some sense,

you can think of them as a flow control mechanism for dictating when

results should be materialized. Another way of looking at it is that triggers

are like the shutter-release on a camera, allowing you to declare when to

take a snapshots in time of the results being computed.

Triggers also make it possible to observe the output for a window multiple

times as it evolves. This in turn opens up the door to refining results over

time, which allows for providing speculative results as data arrive, as well

as dealing with changes in upstream data (revisions) over time or data that

arrive late (e.g., mobile scenarios, in which someone’s phone records

various actions and their event times while the person is offline and then

proceeds to upload those events for processing upon regaining

connectivity).

- Watermarks

A watermark is a notion of input completeness with respect to event

times. A watermark with value of time *X* makes the statement: “all input

data with event times less than *X* have been observed.” As such,

watermarks act as a metric of progress when observing an unbounded data

source with no known end. We touch upon the basics of watermarks in

this chapter, and then Slava goes super deep on the subject in Chapter 3.

- Accumulation

An accumulation mode specifies the relationship between multiple results

that are observed for the same window. Those results might be completely

disjointed; that is, representing independent deltas over time, or there

might be overlap between them. Different accumulation modes have

different semantics and costs associated with them and thus find

applicability across a variety of use cases.

Also, because I think it makes it easier to understand the relationships

between all of these concepts, we revisit the old and explore the new within

the structure of answering four questions, all of which I propose are critical to

every unbounded data processing problem:

- *What* results are calculated? This question is answered by the types

of transformations within the pipeline. This includes things like

computing sums, building histograms, training machine learning

models, and so on. It’s also essentially the question answered by

classic batch processing

- *Where* in event time are results calculated? This question is answered

by the use of event-time windowing within the pipeline. This

includes the common examples of windowing from Chapter 1 (fixed,

sliding, and sessions); use cases that seem to have no notion of

windowing (e.g., time-agnostic processing; classic batch processing

also generally falls into this category); and other, more complex

types of windowing, such as time-limited auctions. Also note that it

can include processing-time windowing, as well, if you assign

ingress times as event times for records as they arrive at the system.

- *When* in processing time are results materialized? This question is

answered by the use of triggers and (optionally) watermarks. There

are infinite variations on this theme, but the most common patterns

are those involving repeated updates (i.e., materialized view

semantics), those that utilize a watermark to provide a single output

per window only after the corresponding input is believed to be

complete (i.e., classic batch processing semantics applied on a per

window basis), or some combination of the two.

- *How* do refinements of results relate? This question is answered by

the type of accumulation used: discarding (in which results are all

independent and distinct), accumulating (in which later results build

upon prior ones), or accumulating and retracting (in which both the

accumulating value plus a retraction for the previously triggered

value(s) are emitted).

We look at each of these questions in much more detail throughout the rest of

the book. And, yes, I’m going to run this color scheme thing into the ground

in an attempt to make it abundantly clear which concepts relate to which

question in the *What*/*Where*/*When*/*How* idiom. You’re welcome <winky

smiley/>.

{%  enddetails   %}