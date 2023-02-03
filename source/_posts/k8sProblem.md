---
title: Kubernetes问题排查-troubleshooting
date: 2022-04-03 22:42:10
tags:
  - Kubenetes
categories: 
  - 稳定性
  - 故障排查
  - Kubernetes
---

<p></p>
<!-- more -->

[如何调试Kubernetes集群中的网络延迟问题](https://mp.weixin.qq.com/s/pRRc4CUM8ebytRWWwe1JkA) network


[记一次Kubernetes机器内核问题排查](https://corvo.myseu.cn/2021/03/21/2021-03-21-%E8%AE%B0%E4%B8%80%E6%AC%A1kubernetes%E6%9C%BA%E5%99%A8%E5%86%85%E6%A0%B8%E9%97%AE%E9%A2%98%E7%9A%84%E6%8E%92%E6%9F%A5/) network
+ 根据大佬所给的方向, 基本能够确定问题发生的真正原因: 机器上定时任务的执行过多, 内核缓存一直增加, 导致内核速度变慢了. 它一变慢, 引发了tcp握手时间变长, 最后造成用户体验下降. 既然发现了问题, 解决方案也比较容易搜索到了, 增加任务, 检查内核是否变慢, 慢了的话就清理一次:
```
sync && echo 3 > /proc/sys/vm/drop_caches
```


[添加 K8S CPU limit 会降低服务性能？](https://mp.weixin.qq.com/s/cR6MpQu-n1cwMbXmVaXqzQ)  cgroup