---
title: linux命令行工具
date: 2019-10-01 23:19:31
tags:
  - linux
categories:
  - linux 
  - 命令行工具
---


## 一. 进程与网络
1. 知道占用的端口，找进程号

```
root@iZuf6jcjzd6wfh2fhp6315Z:~# netstat -tunlp | grep 18090
tcp        0      0 0.0.0.0:18090           0.0.0.0:*               LISTEN      12921/java

root@iZuf6jcjzd6wfh2fhp6315Z:~# ps -ef | grep 12921
root     12921 24298  0  2018 ?        01:06:37 java -jar services/onlinetraining-service.jar
```

2. 知道进程名，找占用的端口号 
``` 
root@iZuf6jcjzd6wfh2fhp6315Z:~# ps aux | grep java
root     12921  0.0  3.7 21046096 2305228 ?    Sl    2018  66:37 java -jar services/onlinetraining-service.jar

root@iZuf6jcjzd6wfh2fhp6315Z:~# lsof -p 12921 -nP | grep TCP
... ...
java    12921 root   30u     IPv4          286953901      0t0       TCP *:18090 (LISTEN)
... ...
```

## 二. 其他
1. systemctl： 负责控制systemd系统和服务管理器 
```
#检查单元或服务是否正在运行
systemctl status firewalld.service
#列出所有服务
systemctl list-unit-files --type=service
```

2. 进程有访问了哪些文件句柄
```
lsof -p 11825
```

3. 查看连接你服务器 top10 用户端的 IP 地址：
```
netstat -nat | awk '{print $5}' | awk -F ':' '{print $1}' | sort | uniq -c | sort -rn | head -n 10
```

4.  alias
```
alias nis="npm install --save "
alias install='sudo apt get install'
alias update='sudo apt-get update; sudo apt-get upgrade'
alias ..="cd .."
alias ...="cd ..; cd .."
alias sock5='ssh -D 8080 -q -C -N -f user@your.server'
```

5.  rtt  网络延迟
```
[root@10-25-3-55 ~]# hping3 -c 3 -S -p 80 baidu.com
HPING baidu.com (eth0 39.156.69.79): S set, 40 headers + 0 data bytes
len=40 ip=39.156.69.79 ttl=43 id=22691 sport=80 flags=SA seq=0 win=8192 rtt=31.9 ms
len=40 ip=39.156.69.79 ttl=43 id=19208 sport=80 flags=SA seq=1 win=8192 rtt=33.0 ms
len=40 ip=39.156.69.79 ttl=43 id=2359 sport=80 flags=SA seq=2 win=8192 rtt=36.0 ms

[root@10-25-3-55 ~]# traceroute  --tcp -p 80 -n  baidu.com
traceroute to baidu.com (220.181.38.148), 30 hops max, 60 byte packets
```

6. xxx to root
```
# Ubuntu
sudo su root
```

7.  查看inode详情
```
[root@172-16-244-142]$df -i
Filesystem       Inodes  IUsed    IFree IUse% Mounted on
devtmpfs         485574    346   485228    1% /dev
tmpfs            488560      1   488559    1% /dev/shm
tmpfs            488560    500   488060    1% /run
tmpfs            488560     17   488543    1% /sys/fs/cgroup
/dev/vda1      10485248 195694 10289554    2% /
tmpfs            488560      1   488559    1% /run/user/0
```

8.  杀xxx进程 
```
# 杀tomat
ps -ef | grep tomcat| awk '{print "kill -9 " $2}' | sh
ps -ef | grep tomcat|grep -v grep | awk '{print "kill -9 " $2}' | sh
```

## 三. oh-my-zsh安装
参考 zsh


## 四. tmux使用和安装
参考 tmux

## 参考：

1. [systemctl 命令详解及使用教程](https://linux265.com/news/3385.html)  systemd Systemctl
2. [打造高效的工作环境 – Shell 篇](https://coolshell.cn/articles/19219.html)  good
3. [Linux 命令搜索](https://wangchujiang.com/linux-command/)  good
4. [Linux实例磁盘空间满和inode满的问题排查方法](https://help.aliyun.com/knowledge_detail/42531.html?spm=5176.11065259.1996646101.searchclickresult.4f0c88c9FG1Wbp#h2-u5904u7406u529Eu6CD53)  inode

### zsh
1. [Installing ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
2. [极客工具之 oh-my-zsh](https://imroc.io/posts/geek/oh-my-zsh/) 

### tmux
1. [tmux基本操作](https://www.cnblogs.com/liuguanglin/p/9290345.html) 快捷键
2. [linux多Session神器Tmux安装使用场景和常用命令](https://mp.weixin.qq.com/s/nuBUKT8WFtvCxURE7m1E3w)

