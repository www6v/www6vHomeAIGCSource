---
title: eBPF
date: 2022-05-22 19:22:15
tags:
  - linux
categories:
  - linux 
  - kernel
  - eBPF
---

<p></p>
<!-- more -->

## 架构和组件[1][2]

{% asset_img  ebpf.png  eBPF技术架构图 %}

+ LLVM
LLVM编译出加载到内核中执行的汇编代码。
BPF是高级虚拟机, LLVM将C代码编译成BPF指令。

+ BPF验证器

+ JIT编译器
直接将BPF字节码转换为机器码，减少运行时的时间开销。

+ BPF 映射Map
负责在内核和用户空间之间共享数据
双向的数据共享, 可以分别从内核和用户空间写入和读取数据

## bpf运行时结构[2]
{% asset_img  bpf-runtime.png  bpf运行时各模块  %}
+ bpf虚拟机实现包括一个解释器和JIT编译器
+ JIT编译器负责生成处理器可直接执行的机器指令

## 参考
1. 《Linux内核观察技术BPF》
2. [高效入门eBPF](https://www.bilibili.com/video/BV1LX4y157Gp?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036) bilibili good - 西安邮电大学 贺东升
[高效入门eBPF](http://kerneltravel.net/blog/2021/ebpf_beginner/ebpf.pdf) 相关的ppt
3. [深入浅出 eBPF](https://www.ebpf.top/categories/BPF/) 未 
4. [BPF 学习路径总结](https://feisky.xyz/posts/2021-01-06-ebpf-learn-path/) 未
5. [The BSD Packet Filter:A New Architecture for User-level Packet Capture](https://www.tcpdump.org/papers/bpf-usenix93.pdf) bpf论文-1992

