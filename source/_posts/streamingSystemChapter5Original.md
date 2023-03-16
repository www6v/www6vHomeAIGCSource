---
title: 《Streaming System》-Chapter 5. Exactly-Once and Side Effects
date: 2000-03-16 19:27:27
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
# **Why Exactly Once Matters**

It almost goes without saying that for many users, any risk of dropped records

or data loss in their data processing pipelines is unacceptable. Even so,

historically many general-purpose streaming systems made no guarantees

about record processing—all processing was “best effort” only. Other systems

provided at-least-once guarantees, ensuring that records were always

processed at least once, but records might be duplicated (and thus result in

inaccurate aggregations); in practice, many such at-least-once systems

performed aggregations in memory, and thus their aggregations could still be

lost when machines crashed. These systems were used for low-latency,

speculative results but generally could guarantee nothing about the veracity of

these results.

As Chapter 1 points out, this led to a strategy that was coined the *Lambda*

*Architecture*—run a streaming system to get fast, but inaccurate results.

Sometime later (often after end of day), a batch system runs to the correct

answer. This works only if the data stream is replayable; however, this was

true for enough data sources that this strategy proved viable. Nonetheless,

many people who tried this experienced a number of issues with the Lambda

Architecture:

- Inaccuracy

Users tend to underestimate the impact of failures. They often assume that

a small percentage of records will be lost or duplicated (often based on

experiments they ran), and are shocked on that one bad day when 10% (or

more!) of records are lost or are duplicated. In a sense, such systems

provide only “half” a guarantee—and without a full one, anything is

possible.

- Inconsistency

The batch system used for the end-of-day calculation often has different

data semantics than the streaming system. Getting the two pipelines to

produce comparable results proved more difficult than initially thought.

- Complexity

By definition, Lambda requires you to write and maintain two different

codebases. You also must run and maintain two complex distributed

systems, each with different failure modes. For anything but the simplest

of pipelines, this quickly becomes overwhelming.

- Unpredictability

In many use cases, end users will see streaming results that differ from the

daily results by an uncertain amount, which can change randomly. In

these cases, users will stop trusting the streaming data and wait for daily

batch results instead, thus destroying the value of getting low-latency

results in the first place.

- Latency

Some business use cases *require* low-latency correct results, which the

Lambda Architecture does not provide by design.

Fortunately, many Beam runners can do much better. In this chapter, we

explain how exactly-once stream processing helps users count on accurate

results and avoid the risk of data loss while relying on a single codebase and

API. Because a variety of issues that can affect a pipeline’s output are often

erroneously conflated with exactly-once guarantees, we first explain precisely

which issues are in and out of scope when we refer to “exactly once” in the

context of Beam and data processing.

{%  enddetails   %}





{% details 点击  原文  %}

# **Accuracy Versus Completeness**

Whenever a Beam pipeline processes a record for a pipeline, we want to

ensure that the record is never dropped or duplicated. However, the nature of

streaming pipelines is such that records sometimes show up late, after

aggregates for their time windows have already been processed. The Beam

SDK allows the user to configure how long the system should wait for late

data to arrive; any (and only) records arriving later than this deadline are

dropped. This feature contributes to *completeness*, not to accuracy: all records

that showed up in time for processing are accurately processed exactly once,

whereas these late records are explicitly dropped.

Although late records are usually discussed in the context of streaming

systems, it’s worth noting that batch pipelines have similar completeness

issues. For example, a common batch paradigm is to run a job at 2 AM over

all the previous day’s data. However, if some of yesterday’s data wasn’t

collected until after 2 AM, it won’t be processed by the batch job! Thus, batch

pipelines also provide accurate but not always complete results.

### **Side Effects**

One characteristic of Beam and Dataflow is that users inject custom code that

is executed as part of their pipeline graph. Dataflow does *not* guarantee that

this code is run only once per record,  whether by the streaming or batch

runner. It might run a given record through a user transform multiple times, or

it might even run the same record simultaneously on multiple workers; this is

necessary to guarantee at-least-once processing in the face of worker failures.

Only one of these invocations can “win” and produce output further down the

pipeline.

As a result, nonidempotent side effects are not guaranteed to execute exactly

once; if you write code that has side effects external to the pipeline, such as

contacting an outside service, these effects might be executed more than once

for a given record. This situation is usually unavoidable because there is no

way to atomically commit Dataflow’s processing with the side effect on the

external service. Pipelines do need to eventually send results to the outside

world, and such calls might not be idempotent. As you will see later in the

chapter, often such sinks are able to add an extra stage to restructure the call

into an idempotent operation first.

### **Problem Definition**

So, we’ve given a couple of examples of what we’re *not* talking about. What

do we mean then by exactly-once processing? To motivate this, let’s begin

with a simple streaming pipeline,  shown in Example 5-1.

*Example 5-1. A simple streaming pipeline*

```
Pipeline p = Pipeline.create(options);
// Calculate 1-minute counts of events per user.
PCollection<..> perUserCounts =
p.apply(ReadFromUnboundedSource.read())
.apply(new KeyByUser())
.Window.<..>into(FixedWindows.of(Duration.standardMinutes(1)))
.apply(Count.perKey());
// Process these per-user counts, and write the output somewhere.
perUserCounts.apply(new ProcessPerUserCountsAndWriteToSink());
// Add up all these per-user counts to get 1-minute counts of all events.
perUserCounts.apply(Values.<..>create())
.apply(Count.globally())
.apply(new ProcessGlobalCountAndWriteToSink());
p.run();
```

This pipeline computes two different windowed aggregations. The first counts

how many events came from each individual user over the course of a minute,

and the second counts how many total events came in each minute. Both

aggregations are written to unspecified streaming sinks.

Remember that Dataflow executes pipelines on many different workers in

parallel. After each GroupByKey (the Count operations use GroupByKey under

the covers), all records with the same key are processed on the same machine

following a process called *shuffle*. The Dataflow workers shuffle data

between themselves using Remote Procedure Calls (RPCs), ensuring that

records for a given key all end up on the same machine.

Figure 5-1 shows the shuffles that Dataflow creates for the pipeline in

Example 5-1.  The Count.perKey shuffles all the data for each user onto a

given worker, whereas the Count.globally shuffles all these partial counts

to a single worker to calculate the global sum.

*Figure 5-1. Shuffles in a pipeline*

For Dataflow to accurately process data, this shuffle process must ensure that

every record is shuffled exactly once. As you will see in a moment, the

distributed nature of shuffle makes this a challenging problem.

This pipeline also both reads and writes data from and to the outside world, so

Dataflow must ensure that this interaction does not introduce any

inaccuracies. Dataflow has always supported this task—what Apache Spark

and Apache Flink call *end-to-end exactly once*—for sources and sinks

whenever technically feasible.

The focus of this chapter will be on three things:

- Shuffle

How Dataflow guarantees that every record is shuffled exactly once.

- Sources

How Dataflow guarantees that every source record is processed exactly

once.

- Sinks

How Dataflow guarantees that every sink produces accurate output.

{%  enddetails   %}





{% details 点击  原文  %}

# **Ensuring Exactly Once in Shuffle**

As just explained, Dataflow’s streaming shuffle uses RPCs. Now, any time

you have two machines communicating via RPC, you should think long and

hard about data integrity. First of all, RPCs can fail for many reasons. The

network might be interrupted, the RPC might time out before completing, or

the receiving server might decide to fail the call. To guarantee that records are

not lost in shuffle, Dataflow employs *upstream backup*. This simply means

that the sender will retry RPCs until it receives positive acknowledgment of

receipt. Dataflow also ensures that it will continue retrying these RPCs even if

the sender crashes. This guarantees that every record is delivered *at least*

*once*.

Now, the problem is that these retries might themselves create duplicates.

Most RPC frameworks, including the one Dataflow uses, provide the sender

with a status indicating success or failure. In a distributed system, you need to

be aware that RPCs can sometimes succeed even when they have appeared to

fail. There are many reasons for this: race conditions with the RPC timeout,

positive acknowledgment from the server failing to transfer even though the

RPC succeeded, and so on. The only status that a sender can really trust is a

successful one.

An RPC returning a failure status generally indicates that the call might or

might not have succeeded. Although specific error codes can communicate

unambiguous failure, many common RPC failures, such as Deadline

Exceeded, are ambiguous. In the case of streaming shuffle, retrying an RPC

that really succeeded means delivering a record twice! Dataflow needs some

way of detecting and removing these duplicates.

At a high level, the algorithm for this task is quite simple (see Figure 5-2):

every message sent is tagged with a unique identifier. Each receiver stores a

catalog of all identifiers that have already been seen and processed. Every

time a record is received, its identifier is looked up in this catalog. If it is

found, the record is dropped as a duplicate. Because Dataflow is built on top

of a scalable key/value store, this store is used to hold the deduplication

catalog.

*Figure 5-2. Detecting duplicates in shuffle*

# **Addressing Determinism**

Making this strategy work in the real world requires a lot of care, however.

One immediate wrinkle is that the Beam Model allows for user code to

produce nondeterministic output. This means that a ParDo can execute twice

on the same input record (due to a retry), yet produce different output on each

retry. The desired behavior is that only one of those outputs will commit into

the pipeline; however, the nondeterminism involved makes it difficult to

guarantee that both outputs have the same deterministic ID. Even trickier, a

ParDo can output multiple records, so each of these retries might produce a

different number of outputs!

So, why don’t we simply require that all user processing be deterministic?

Our experience is that in practice, many pipelines require nondeterministic

transforms And all too often, pipeline authors do not realize that the code they

wrote is nondeterministic. For example, consider a transform that looks up

supplemental data in Cloud Bigtable in order to enrich its input data. This is a

nondeterministic task, as the external value might change in between retries

of the transform. Any code that relies on current time is likewise not

deterministic. We have also seen transforms that need to rely on random

number generators. And even if the user code is purely deterministic, any

event-time aggregation that allows for late data might have nondeterministic

inputs.

Dataflow addresses this issue by using checkpointing to make

nondeterministic processing effectively deterministic. Each output from a

transform is checkpointed, together with its unique ID, to stable storage

*before* being delivered to the next stage.  Any retries in the shuffle delivery

simply replay the output that has been checkpointed—the user’s

nondeterministic code is not run again on retry. To put it another way, the

user’s code may be run multiple times but only one of those runs can “win.”

Furthermore, Dataflow uses a consistent store that allows it to prevent

duplicates from being written to stable storage.

{%  enddetails   %}