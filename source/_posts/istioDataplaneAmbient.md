---
title: istio 数据平面-ambient 模式
date: 2022-07-02 12:20:15
tags:
  - serviceMesh
categories:
  - 云原生
  - serviceMesh
---

<p></p>
<!-- more -->

### Sidecar 模式的限制

### ambient 模式
+ Ambient Mode 的本质：
  它的本质是分离 sidecar proxy（Envoy）中的 L4 和 L7 功能，让一部分仅需要安全功能的用户可以最小阻力（低资源消耗、运维成本）地使用 Istio service mesh。
+ Ambient Mode 的意义：
 因为它 sidecar 模式兼容，用户在采纳 Ambient Mode 获得了 mTLS 和有限的可观察性及 TPC 路由等 L4 功能，之后可以更方便的过度到 sidecar mode 以获得完全的 L7 功能。这给用户采纳 Istio 提供了更多模式选择，优化了 Istio 采纳路径。


## 参考
1. [关于 Istio 推出 Ambient 数据平面模式的看法](https://jimmysong.io/blog/istio-ambient-mode/)  ***
2. [Istio 无 sidecar 代理数据平面 ambient 模式简介](https://lib.jimmysong.io/blog/introducing-ambient-mesh/)
3. [什么是 Ambient Mesh？](https://lib.jimmysong.io/blog/what-is-ambient-mesh/)

