---
title: Linux 总结
date: 2021-05-27 08:48:20
tags:
  - linux
categories:
  - linux  
  - 总结 
top: true   
---

<p></p>
<!-- more -->

关键词: linux, 计算机组成

## 总体架构
+ 北桥 
  主桥 - 处理高速信号 
+ 南桥
  IO桥 - [低速]

## 操作系统[3]  
+ [内核](../../../../2022/01/30/linuxKernel/) self
+ 栈
  用函数和寄存器的方式记录了线程的执行历史
+ 中断
+ [进程](../../../../2019/08/22/linuxProcess/) self
+ [系统调用](../../../../2022/01/30/linuxSystemCall/) self
+ 虚拟内存
+ [内存管理](../../../../2019/08/23/linuxMemory/) self
+ [调度器](../../../../2022/05/29/linuxSceduling/) self
  - cpu调度级别
  - io调度级别
    deadline， CFQ
+ [文件系统](../../../../2019/08/24/linuxFile/)
+ 网络

## CPU && Cache[1]
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
+ [TCP 阻塞](../../../../2019/08/07/tcpUdpControlCongestion/) self
+ [Linux 协议栈](../../../../2022/01/30/linuxNetwork/)  self
+ epoll

## Frameworks && Tools
+ data plan 
  + [DPDK](../../../../2022/01/25/linuxDPDK/) self        
  + [SPDK](https://spdk.io/) 官网
    - 用户态的TCP/IP协议栈 libuns
  + VPP
+  [eBPF](../../../../2022/05/22/linux-eBPF/) self
  - LLVM
  - bcc  

## 参考
1. 《深入浅出DPDK》
2. [与程序员相关的CPU缓存知识](https://coolshell.cn/articles/20793.html) good 有代码
3. <<性能之巅>>




