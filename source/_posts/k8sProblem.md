---
title: Kubernetes问题排查-troubleshooting
date: 2022-04-03 22:42:10
tags:
  - Kubernetes
categories: 
  - 稳定性
  - 故障排查
  - Kubernetes
---

<p></p>
<!-- more -->

## Kubernetes问题排查
#####  案例1
network问题 [1]

#####  案例2
  network问题 [2]
+ 根据大佬所给的方向, 基本能够确定问题发生的真正原因: 机器上定时任务的执行过多, 内核缓存一直增加, 导致内核速度变慢了. 它一变慢, 引发了tcp握手时间变长, 最后造成用户体验下降. 既然发现了问题, 解决方案也比较容易搜索到了, 增加任务, 检查内核是否变慢, 慢了的话就清理一次:
```
sync && echo 3 > /proc/sys/vm/drop_caches
```

#####  案例3 
  cgroup问题 [3]




## Troubleshoot [4]
+ Kubelet 提示: The node was low on resource: ephemeral-storage
+ 原因: 节点上 Kubelet 的配置路径超过阈值会触发驱逐，默认情况下阈值是 85%
+ 解决: 或者清理磁盘释放资源，或者通过可修改 Kubelet 的配置参数imagefs.available来提高阈值,然后重启 Kubelet.
+ 参考: https://cloud.tencent.com/developer/article/1456389


## Troubleshoot [4]
+ hostPath volumes are not allowed to be used
+ 原因: 集群中存在 psp(PodSecurityPolicy) 禁止 pod 直接挂载 hostpath.
+ 解决: 通过添加以下的 psp 规则来允许或者删除存在的 psp 都可

## Troubleshoot [4]*** 
+ PLEG is not healthy
+ 原因: 宿主机上面跑的容器太多，导致 pod 无法在 3m 钟内完成生命周期检查
+ 解决: PLEG(Pod Lifecycle Event Generator) 用于 kublet 同步 pod 生命周期，本想着如果是因为时间短导致的超时，那是不是可以直接调整这个时间呢? 查看 Kubelet 的源码发现不太行，3m 时间是写在代码里的因此无法修改，当然修改再编译肯定没问题，但成本太大，所以只得优化容器的调度情况.
+ 参考: https://developers.redhat.com/blog/2019/11/13/pod-lifecycle-event-generator-understanding-the-pleg-is-not-healthy-issue-in-kubernetes/

## Troubleshoot [4]***

+ Kubernetes 启动后提示 slice: no such file ro directory
+ 原因: yum 安装的 Kubelet 默认的是 cgroupfs，而 Docker 一般默认的是 systemd。但是 kubernetes 安装的时候建议使用 systemd, Kubelet 跟 Docker 的不一致, 要么修改 Kubelet 的启动参数 , 要么修改 dokcer 启动参数
+ 解决:
  Docker 的启动参数文件为: /etc/Docker/daemon.json: "exec-opts": ["native.cgroupdriver=systemd”]
  Kubelet 的启动参数文件为: /var/lib/Kubelet/config.yaml: cgroupDriver: systemd



## Draft Here
{% draft %}

1. [如何调试Kubernetes集群中的网络延迟问题](https://mp.weixin.qq.com/s/pRRc4CUM8ebytRWWwe1JkA)

2. [记一次Kubernetes机器内核问题排查](https://corvo.myseu.cn/2021/03/21/2021-03-21-%E8%AE%B0%E4%B8%80%E6%AC%A1kubernetes%E6%9C%BA%E5%99%A8%E5%86%85%E6%A0%B8%E9%97%AE%E9%A2%98%E7%9A%84%E6%8E%92%E6%9F%A5/)

3. [添加 K8S CPU limit 会降低服务性能？](https://mp.weixin.qq.com/s/cR6MpQu-n1cwMbXmVaXqzQ)

4. [Kubernetes 常见问题排查与解决方案！（纯干货）](https://blog.csdn.net/alex_yangchuansheng/article/details/119224283)

{% enddraft %}
