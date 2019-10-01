---
title: linux性能分析 
date: 2018-12-26 23:23:18
tags:
  - linux
categories:
  - linux 
  - 性能分析  
---

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


## 三. 重要的内核参数

```

# ls /proc/sys
abi  crypto  debug  dev  fs  kernel  net  vm

# 多线程
vm.max_map_count 

# 内存分配  
## OOM
vm.overcommit_ratio 
vm.overcommit_memory

##内存与交换分区
vm.swappiness

# 网络
net.ipv4.ip_forward  # ipv4的路由转发功能

net.ipv4.tcp_tw_reuse = 1              #开启重用，允许将TIME_WAIT socket用于新的TCP连接。默认为0，表示关闭。
net.ipv4.tcp_tw_recycle = 1            #开启TCP连接中TIME_WAIT socket的快速回收。默认值为0，表示关闭。
net.ipv4.tcp_syncookies = 1            #开启SYN cookie，出现SYN等待队列溢出时启用cookie处理，防范少量的SYN攻击。默认为0，表示关闭。
net.ipv4.tcp_keepalive_time = 600      #keepalived启用时TCP发送keepalived消息的拼度。默认位2小时。
net.ipv4.tcp_keepalive_probes = 5      #TCP发送keepalive探测以确定该连接已经断开的次数。根据情形也可以适当地缩短此值。
net.ipv4.tcp_keepalive_intvl = 15      #探测消息发送的频率，乘以tcp_keepalive_probes就得到对于从开始探测以来没有响应的连接杀除的时间。
                                        默认值为75秒，也就是没有活动的连接将在大约11分钟以后将被丢弃。
                                        对于普通应用来说,这个值有一些偏大,可以根据需要改小.特别是web类服务器需要改小该值。
net.ipv4.ip_local_port_range = 1024 65000 #指定外部连接的端口范围。默认值为32768 61000。

net.ipv4.tcp_max_syn_backlog = 262144  #表示SYN队列的长度，预设为1024，这里设置队列长度为262 144，以容纳更多的等待连接。
net.core.somaxconn = 16384             #定义了系统中每一个端口最大的监听队列的长度, 对于一个经常处理新连接的高负载 web服务环境来说，默认值为128，偏小。

```


```
# 已经namespace化的内核参数：
kernel.shm*,
kernel.msg*,
kernel.sem,
fs.mqueue.*,
net.*.

# 没有namespace化
vm.*

# k8s把syctl参数分为safe和unsafe
# 只有三个参数被认为是safe的
kernel.shm_rmid_forced,
net.ipv4.ip_local_port_range,
net.ipv4.tcp_syncookies
```

```
# 进程有若干操作系统资源的限制
➜  ~ cat /proc/1/limits
Limit                     Soft Limit           Hard Limit           Units
Max cpu time              unlimited            unlimited            seconds
Max file size             unlimited            unlimited            bytes
Max data size             unlimited            unlimited            bytes
Max stack size            8388608              unlimited            bytes
Max core file size        0                    unlimited            bytes
Max resident set          unlimited            unlimited            bytes
Max processes             15188                15188                processes
Max open files            65536                65536                files
Max locked memory         65536                65536                bytes
Max address space         unlimited            unlimited            bytes
Max file locks            unlimited            unlimited            locks
Max pending signals       15188                15188                signals
Max msgqueue size         819200               819200               bytes
Max nice priority         0                    0
Max realtime priority     0                    0
Max realtime timeout      unlimited            unlimited            us
```

## 参考：

### 性能
1. [超全整理！Linux性能分析工具汇总合集](https://mp.weixin.qq.com/s/yhSJF6Il6iJamYCosVgXYQ)
2. [60,000毫秒内对Linux的性能诊断](https://www.oschina.net/translate/linux-performance-analysis-in-60s?print)
3. [28个UNIX/LINUX的命令行神器](https://coolshell.cn/articles/7829.html)

---

### 内核参数
1. [Linux内核常见参数的优化](https://www.jianshu.com/p/3096a8e6a36f)
2. [单个JVM下支撑100w线程数vm.max_map_count](https://blog.csdn.net/vic_qxz/article/details/82853447)
3. [Linux的overcommit配置](http://www.firefoxbug.com/index.php/archives/2800/)
4. [给容器设置内核参数](https://tencentcloudcontainerteam.github.io/2018/11/19/kernel-parameters-and-container/) good
5. [TCP总结](../../../../2015/04/25/tcp/) self



