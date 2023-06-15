---
title: Linux 汇总
date: 2021-05-27 08:48:20
tags:
  - linux
categories:
  - 汇总
  - linux   
top: true   
---

<p></p>
<!-- more -->

关键词: linux, 计算机组成

## 目录
<!-- toc -->

## 总体架构
+ 北桥 
  主桥 - 处理高速信号 
+ 南桥
  IO桥 - [低速]

## 操作系统[3]  
+ {% post_link 'linuxKernel'  内核  %}  self
+ 栈
  用函数和寄存器的方式记录了线程的执行历史
+ 中断
+ {% post_link 'linuxProcess'   进程  %}  self
+ {% post_link 'linuxSystemCall'  系统调用 %}  self
+ 虚拟内存
+ {% post_link 'linuxMemory'  内存管理 %}  self
+ {% post_link 'linuxSceduling'  调度器 %}  self
  - cpu调度级别
  - io调度级别
    deadline， CFQ
+ {% post_link 'linuxFile'  文件系统  %} self
+ 网络

## CPU and Cache[1]
+ CPU架构
  - SMP UMA
    系统总线成了系统瓶颈，应运而生了NUMA
  - NUMA
  - Bus 总线
    [cpu和内存之间的通道]
+ CPU Cache
  - L1 的存取速度：4 个CPU时钟周期
  - L2 的存取速度：11 个CPU时钟周期
  - L3 的存取速度：39 个CPU时钟周期
  - RAM内存的存取速度：107 个CPU时钟周期
+ cacheline
  Cache Line是最小单位（64Bytes）
  eg. L1有32KB，32KB/64B = 512个Cache Line  
+ 缓存的一致性
  + cache line对齐
  + 一致性协议  
    - Directory 协议
    - Snoopy 协议 
     MESI协议, cache line的4个状态
+ Cache 预取    
+ TLB(Translation Lookaside Buffer)  
  - 快表，解决MMU查找page慢的问题
  - 专门用于cache内存中的页表项

## Memory
+ MMU(Memory Management Unit)
+ page - 4K
  - Hugepage: 2M, 1G
+ 虚拟内存
+ overcommit
+ SLUB slab
+ buffer && cache 
  page cache - 文件
  buffer - 磁盘

## File， block
+ POSIX
+ io_uring 
  linux 5.1引入的异步io接口，适合io密集型应用

## Network
+ {% post_link 'tcpUdpControlCongestion'  TCP 阻塞 %}  self
+ {% post_link 'linuxNetwork'  Linux 协议栈 %} self
+ epoll

## Frameworks and Tools
+ data plan 
  + {% post_link 'linuxDPDK'  DPDK %}  self        
  + [SPDK](https://spdk.io/) 官网
    - 用户态的TCP/IP协议栈 libuns
  + VPP
+ {% post_link 'linux-ebpf'  eBPF %}  self
  - LLVM
  - bcc  

## 参考
1. 《深入浅出DPDK》
2. [与程序员相关的CPU缓存知识](https://coolshell.cn/articles/20793.html)   ***   有代码
3. <<性能之巅>>



