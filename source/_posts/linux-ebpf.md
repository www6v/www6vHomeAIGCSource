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

## 目录
<!-- toc -->

## 历史
转折点 2014年 - ebpf扩展到用户空间


## 架构和组件[1][2]

{% asset_img  ebpf.png  eBPF技术架构图 %}

+ 架构
  - **数据(Map 用户态控制和加载)与功能分离(bpf内核字节码)**

+ LLVM
  - LLVM编译出加载到内核中执行的汇编代码。
  - BPF是高级虚拟机, LLVM将C代码编译成BPF指令。

+ BPF验证器

+ JIT编译器
直接将BPF字节码转换为机器码，减少运行时的时间开销。

+ BPF 映射Map
  - 负责在内核和用户空间之间共享数据
  - 双向的数据共享, 可以分别从内核和用户空间写入和读取数据


## bpf运行时结构[2]
{% asset_img  bpf-runtime.png  bpf运行时各模块  %}

+ bpf虚拟机实现包括一个解释器和JIT编译器
  + JIT编译器负责生成处理器可直接执行的机器指令
  + 指令集[4]
      - 从cBPF的33个扩展到87个
      - 最大指令数，初始值4096，现在放大到了100万条
  + 11个寄存器

+ bpf辅助函数

+ 跟踪支持的事件
  + 动态跟踪
    - kprobes/kretprobes
      内核中 , 数量多,非稳定ABI, fentry/fexit替代
    - uprobes/uretprobes
      用户态
  + 内核静态跟踪
    - tracepoints 
      静态探针, 静态内核跟踪点
      稳定ABI, 数量和场景可能受限


## eBPF的应用场景和对应的工具[4]
+ 观察和跟踪
  + memleak
    内存使用情况
  + bcc
    + execsnoop - 系统调用，观察短时临时进程
  + pwru
    网络数据包的路径
  + profile
    火焰图  
  + kubectl trace  
+ 网络
  + Cilium eBPF Datapath 短路处理 [6]
  {% asset_img cilium-ebpf.png  %} 
  + istio 使用 eBPF 优化流量劫持 [7]
+ 安全  

## eBPF开源项目
+ tools
  + bcc 
  + BPFTrace
  + kubectl-trace
+ 安全
  + Tracee - Aqua
  + Falco - Sysdig
  + Cilium Tetragon
  + ELkeid - 字节
  + eHIDS - 美团
+ 可观测
  + eBPF Exporter - eBPF+Prometheus
  + Pixie
  + Kindling - 谐云

## 参考
1. 《Linux内核观察技术BPF》
2. [高效入门eBPF](https://www.bilibili.com/video/BV1LX4y157Gp?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036) bilibili good - 西安邮电大学 贺东升
[高效入门eBPF](http://kerneltravel.net/blog/2021/ebpf_beginner/ebpf.pdf) 相关的ppt  
3. [The BSD Packet Filter:A New Architecture for User-level Packet Capture](https://www.tcpdump.org/papers/bpf-usenix93.pdf) bpf论文-1992
4. [ebpf技术简介（上）](https://www.bilibili.com/video/BV1BT4y1q7wx?spm_id_from=333.880.my_history.page.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036) *** bili
5. [深入浅出 eBPF｜你要了解的 7 个核心问题](https://blog.csdn.net/alisystemsoftware/article/details/125753307)  阿里炎寻
   K8s问题排查全景图 
6. [Cilium eBPF 网络解析](https://cloud.tencent.com/developer/article/1916561)
7. [Beyond Istio OSS —— Istio 服务网格的现状与未来](https://jimmysong.io/blog/beyond-istio-oss/#ebpf)

+ [深入浅出 eBPF](https://www.ebpf.top/categories/BPF/) 未

+ [BPF 学习路径总结](https://feisky.xyz/posts/2021-01-06-ebpf-learn-path/) 未
  [Linux Extended BPF (eBPF) Tracing Tools](https://www.brendangregg.com/ebpf.html)  brendangregg
  
+ [davidlovezoe](https://davidlovezoe.club/wordpress/archives/tag/bpf) 未

+ [【云原生学院#25】云原生应用可观测性实践](https://www.bilibili.com/video/BV1CL411777R/)  未 *** 

   

 