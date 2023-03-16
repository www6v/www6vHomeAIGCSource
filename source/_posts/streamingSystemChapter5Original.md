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