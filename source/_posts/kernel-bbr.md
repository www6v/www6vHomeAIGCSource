---
title: centos7 内核升级到4.9  &&  bbr配置
date: 2020-11-29 19:29:57
tags:
---

<p hidden></p>
<!-- more -->

首先，让我们添加 ELRepo GPG key：

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

为 RHEL-6，SL-7，CentOS-7 源：

rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

当然，别忘了 fastestmirror 还是需要的

yum install yum-plugin-fastestmirror

最后，安装 kernel 4.9

yum --enablerepo=elrepo-kernel install kernel-ml

当然，将 kernel-ml 选为第一启动，首先查看系统的内核以及顺序

awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg



看下你当前默认启动项

grub2-editenv list


将 kernel-ml 版本的内核设置为默认启动内核

grub2-set-default N



以后升级内核默认启用 kernel-ml，编辑文件 /etc/sysconfig/kernel

DEFAULTKERNEL=kernel-ml

同时编辑文件 /etc/yum.repos.d/elrepo.repo，在 [elrepo-kernel] 下   

enabled=1
                  

开启 BBR TCP
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf



重启后，首先 uname -a 看下内核是否切换到 4.9，然后执行下面明亮查看内核是否开启 TCP BBR：

sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control

查看 tcp_bbr 模块是否加载：

lsmod | grep tcp_bbr


参考：
升级 CentOS 内核至 4.9 good
https://havee.me/linux/2017-01/upgrade-kernel-4-9-for-centos.html

Centos内核升级的三种方法
https://www.cnblogs.com/zengkefu/p/5667145.html

https://blog.51cto.com/7794482/2462466
http://www.d0z.net/archives/7804
https://zhuanlan.zhihu.com/p/47372096
https://www.cnblogs.com/cnwangshijun/p/7405153.html


