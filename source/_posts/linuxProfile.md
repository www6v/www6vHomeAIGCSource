---
title: linux性能分析 
date: 2018-12-26 23:23:18
tags:
  - linux
categories:
  - linux 
  - 性能分析  
---

<p></p>
<!-- more -->

## 一. Linux observability tools | Linux 性能观测工具

<div style="text-align: center;">
	
![linux_observe_tools](https://user-images.githubusercontent.com/5608425/65083384-fe0eee00-d9da-11e9-9b5f-c3361a273b67.jpg)
Linux性能观测工具
</div>

<!-- more -->

## 二. 快速性能诊断(快速体检)

1. 系统平均负载
```
 # 0.25- 1分钟负载 ， 0.22-5分钟负载， 0.23-15分钟负载
 [root@10-25-3-55 /]# uptime
 23:02:19 up 285 days, 11:37,  1 user,  load average: 0.25, 0.22, 0.23

# 如果cpu个数是4， 则平均负载4是合理的。
[root@10-23-25-248]$grep 'model name' /proc/cpuinfo | wc -l
4
```

+ 平均负载: 
  单位时间内，系统处于可运行状态和不可中断状态的平均进程数，也就是单位时间内的活跃进程数。


+ 场景
  CPU 密集型进程，使用大量 CPU 会导致平均负载升高，此时这两者是一致的；
  I/O 密集型进程，等待 I/O 也会导致平均负载升高，但 CPU 使用率不一定很高；
  大量等待 CPU 的进程调度也会导致平均负载升高，此时的CPU使用率也会比较高。

2. dmesg | tail : 系统信息  导致性能问题的错误
```
[9927609.690053] ffmpeg invoked oom-killer: gfp_mask=0x201da, order=0, oom_score_adj=0
[9927609.690106]  [<ffffffff81184c7e>] oom_kill_process+0x24e/0x3c0
[9927609.690109]  [<ffffffff8118471d>] ? oom_unkillable_task+0xcd/0x120
```
3. vmstat 1  : 虚拟内存  
   进程(饱和度)   内存    CPU  
```
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 8  0      0 402204 303208 8686376    0    0     2    10    0    0  5  6 89  0  0
```
4. mpstat -P ALL 1 :  CPU分解时间  
```
11:08:02 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
11:08:03 PM  all   28.68    0.00   60.85    0.00    0.00    0.00    0.00    0.00    0.00   10.47
11:08:03 PM    0   28.43    0.00   60.78    0.00    0.00    0.00    0.00    0.00    0.00   10.78
11:08:03 PM    1   28.71    0.00   61.39    0.00    0.00    0.00    0.00    0.00    0.00    9.90
11:08:03 PM    2   29.00    0.00   59.00    0.00    0.00    0.00    0.00    0.00    0.00   12.00
11:08:03 PM    3   28.71    0.00   61.39    0.00    0.00    0.00    0.00    0.00    0.00    9.90
```
5. pidstat 1 ： 每个进程的统计摘要
```
11:11:14 PM   UID       PID    %usr %system  %guest    %CPU   CPU  Command
11:11:15 PM     0      8715    1.00    0.00    0.00    1.00     3  pidstat
11:11:15 PM     0     27930    0.00    1.00    0.00    1.00     2  java
11:11:15 PM     0     28042    1.00    0.00    0.00    1.00     1  java
11:11:15 PM     0     28044    1.00    0.00    0.00    1.00     1  java

Average:      UID       PID    %usr %system  %guest    %CPU   CPU  Command
Average:        0        23    0.00    0.07    0.00    0.07     -  ksoftirqd/3
Average:       38       531    0.00    0.07    0.00    0.07     -  ntpd
Average:        0      2642    0.07    0.00    0.00    0.07     -  aliyun-service
Average:       27      2784    0.00    0.07    0.00    0.07     -  mysqld
Average:        0      7462    0.73    0.20    0.00    0.93     -  java
```
6. iostat -xz 1 ： 磁盘
```
avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          29.15    0.00   59.30    0.25    0.00   11.31

Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
vda               0.00     0.00    1.00    1.00     8.00     4.00    12.00     0.05   26.50   53.00    0.00  26.50   5.30
```
7. free -m ： 内存 
    buffer， cache， Swap
```
             total        used        free      shared  buff/cache   available
Mem:          32013       22842         391           1        8779        8723
Swap:             0           0           0
```
8. sar -n DEV 1 : 网路吞吐
```
Average:        IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
Average:    vethd4593b4      0.00      0.00      0.00      0.00      0.00      0.00      0.00
Average:         eth0      1.67      1.52      0.17      1.66      0.00      0.00      0.00
Average:         eth1      2.74     75.08      0.16      8.86      0.00      0.00      0.00
Average:           lo      4.86      4.86      0.71      0.71      0.00      0.00      0.00
Average:      docker0      0.00      0.00      0.00      0.00      0.00      0.00      0.00
```
9. sar -n TCP,ETCP 1 :  TCP指标 

![sar-tcp](https://user-images.githubusercontent.com/5608425/65831070-f5c28700-e2e7-11e9-9fe7-51ccdf43451b.png)


10. top ： 变化的负载的汇总


## 参考：

### 性能
1. [超全整理！Linux性能分析工具汇总合集](https://mp.weixin.qq.com/s/yhSJF6Il6iJamYCosVgXYQ)
2. [60,000毫秒内对Linux的性能诊断](https://www.oschina.net/translate/linux-performance-analysis-in-60s?print)
3. [28个UNIX/LINUX的命令行神器](https://coolshell.cn/articles/7829.html)





