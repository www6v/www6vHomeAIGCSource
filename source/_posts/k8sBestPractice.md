---
title: Kubernetes最佳实践-BestPractice
date: 2022-01-23 22:24:22
tags:
  - Kubernetes
categories: 
  - 稳定性
  - 故障排查
  - Kubernetes
---

<p></p>
<!-- more -->


## 最佳实践 - 优雅热更新  [1] ***
+ 更新过程连接异常的原因
  - pod 被创建，还没完全启动就被 endpoint controller 加入到 service 的 endpoint 列表，然后 kube-proxy 配置对应的路由规则(iptables/ipvs)，如果请求被路由到还没完全启动完成的 pod，这时 pod 还不能正常处理请求，就会导致连接异常
  - pod 被销毁，但是从 endpoint controller watch 到变化并更新 service 的 endpoint 列表到 kube-proxy 更新路由规则这期间有个时间差，pod可能已经完全被销毁了，但是路由规则还没来得及更新，造成请求依旧还能被转发到已经销毁的 pod ip，导致连接异常

+ 最佳实践
  - 给 pod 里的 container 加 readinessProbe (就绪检查)
    这样可以让容器完全启动了才被endpoint controller加进 service 的 endpoint 列表，然后 kube-proxy 再更新路由规则
  - 可以给 pod 里的 container 加 preStop hook，
    让 pod 真正销毁前先 sleep 等待一段时间，留点时间给 endpoint controller 和 kube-proxy 清理 endpoint 和路由规则

## 最佳实践 - 解决长连接服务扩容失效 [2]


## 最佳实践 - 处理内存碎片化  [3]
节点的内存碎片化严重，导致docker运行容器时，无法分到大的内存块，导致start docker失败。最终导致服务更新时，状态一直都是启动中.

## 最佳实践 - 处理容器数据磁盘被写满 [4] ***
+ 容器数据磁盘被写满造成的危害
    不能创建 Pod (一直 ContainerCreating)
    不能删除 Pod (一直 Terminating)
    无法 exec 到容器
+ 根因对应的解决方法
  - 日志输出量大导致磁盘写满:
     减少日志输出
     增大磁盘空间
     减小单机可调度的pod数量
  - 可写层量大导致磁盘写满: 
      优化程序逻辑，不写文件到容器内或控制写入文件的大小与数量
  - 镜像占用空间大导致磁盘写满:
      增大磁盘空间
      删除不需要的镜像


## Draft Here
1. [kubernetes 最佳实践：优雅热更新](https://tencentcloudcontainerteam.github.io/2019/05/08/kubernetes-best-practice-grace-update/)
2. [Kubernetes 最佳实践：解决长连接服务扩容失效](https://tencentcloudcontainerteam.github.io/2019/06/06/scale-keepalive-service/)
3. [Kubernetes 最佳实践：处理内存碎片化 ](https://tencentcloudcontainerteam.github.io/2019/06/06/handle-memory-fragmentation/)
4. [kubernetes 最佳实践：处理容器数据磁盘被写满](https://tencentcloudcontainerteam.github.io/2019/06/08/kubernetes-best-practice-handle-disk-full/)
