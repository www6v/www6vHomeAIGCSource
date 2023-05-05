---
title: KVM 虚拟机
date: 2022-06-25 21:16:02
tags:
  - linux
categories:
  - linux 
  - KVM
---

<p></p>
<!-- more -->


## 基础概念
VMM(Virtual Machine Monitor) Hypervisor
QEMU: 软件虚拟化

## KVM架构图
{% asset_img kvm-arch.jpg KVM架构图 %}

## KVM 虚机的创建过程

{%asset_img  kvm-start.jpg KVM 虚机的创建过程 %}

（1）qemu-kvm 通过对 /dev/kvm 的 一系列 ICOTL 命令控制虚机

（2）一个 KVM 虚机即一个 Linux qemu-kvm 进程，与其他 Linux 进程一样被Linux 进程调度器调度。

（3）KVM 虚机包括虚拟内存、虚拟CPU和虚机 I/O设备，
    其中，内存和 CPU 的虚拟化由 KVM 内核模块负责实现，I/O 设备的虚拟化由 QEMU 负责实现。

（4）KVM虚机系统的内存是 qumu-kvm 进程的地址空间的一部分。

（5）KVM 虚机的 vCPU 作为 线程运行在 qemu-kvm 进程的上下文中。

## KVM 功能
+ Core
  - 支持 CPU 和 memory 超分（Overcommit）
  - 支持对称多处理（Symmetric Multi-Processing，缩写为 SMP）
  - 支持 PCI 设备直接分配和 单根 I/O 虚拟化 （SR-IOV）
  - 支持实时迁移（Live Migration）
+ Advanced
  - 支持热插拔 （cpu，块设备、网络设备等）
  - 支持半虚拟化 I/O （virtio）
  - 支持 内核同页合并 （KSM）
  - 支持 NUMA （Non-Uniform Memory Access，非一致存储访问结构 ）  


## KVM vs.  Xen  
/  | 虚拟化  | 架构 
:-: | :-: | :-:
KVM | Type2-Hypervisor运行在宿主机操作系统之上 |  基于硬件虚拟化支持的全虚拟化实现  
Xen | Type1-Hypervisor运行在硬件之上 |  半虚拟化


## KVM 动态迁移 [3]
1. 启动空的target vm
2. 客户机的内存被传输到目的主机上
3. qemu/kvm监控内存的修改， 并传输更改的内容
4. qemu/kvm估计剩余传输的内存可以在300ms内传输完成
5. qemu/kvm 关闭源主机，将剩余的数据量传输到目的主机
[全量 + 增量]

## 参考
1. [KVM 介绍（1）：简介及安装](https://www.cnblogs.com/sammyliu/p/4543110.html)
2. [KVM 介绍（2）：CPU 和内存虚拟化](https://www.cnblogs.com/sammyliu/p/4543597.html)
3. 《KVM 实战》 8.1