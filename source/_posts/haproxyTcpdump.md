---
title: HAProxy抓包
date: 2022-01-11 22:00:07
tags:
  - 故障排查
categories:
  - 稳定性
  - 故障排查  
  - tcpdump
---

<p hidden></p>
<!-- more -->


## 环境
haproxy的机器 -  work-arch-renault-redis-6，10.100.140.234
codis机器  -  st-arch-renault-redis-1，172.16.22.139 


## 一. 在codis-proxy机器上抓包
在codis-proxy机器上抓包（codis-proxy端口 19000）
```shell
tcpdump -n tcp port 19000 -w eth1.cap
```

##### haproxy 流向 codis-proxy的数据

{% asset_img  h1.jpg  haproxy流向codis-proxy的数据 %}

##### jedis连到haproxy，写入数据转发到codis

{% asset_img  h2.png  jedis连到haproxy，写入数据转发到codis %}


##### RESP协议 看到的set&get(长连接)

{% asset_img  h3.png  RESP协议 看到的set&get(长连接) %}


## 二.  在haproxy的机器上抓包

在haproxy的机器上抓包（haproxy 11111端口）
```shell
tcpdump -n tcp port 11111 -w eth1.cap
```

##### 得到客户端ip

{% asset_img  h5.png  得到客户端ip %}


##### 实际的客户端IP，和抓包分析的一致
{% asset_img  h6.png  实际的客户端IP，和抓包分析的一致 %}


## 参考
https://zhuanlan.zhihu.com/p/417275080
https://blog.csdn.net/weixin_40748006/article/details/106429957









