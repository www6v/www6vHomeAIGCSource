---
title: kubernetes 问题Troubleshoot
date: 2022-06-08 17:39:12
tags:
  - Kubernetes
categories: 
  - 稳定性
  - 故障排查
  - Kubernetes  
---

<p></p>
<!-- more -->

{% asset_img   podStatus.png  Kubernetes  %}


## 运营过程中出现的陷阱[1]
案例1:
• 研发人员为提高系统效率，将update方法修改为patch
• 研发人员本地非安全测试环境测试通过
• 上生产，发现不work
• 原因:忘记更新rolebinding，对应的serviceaccount没有patch权限
案例2:
• 研发人员创建CRD，并针对该CRD编程
• 上生产后不工作
• 原因，该CRD未授权，对应的组件get不到对应的CRD资源



## taint 和 tolerance [4]
+ 用户会忘记打tolerance， 导致pod无法调度， pending
+ 其他用户会get node detail， 查到taints， 偷用资源
+ 通过dashboard，能看到哪些用户的什么应用跑在哪些节点上
+ 对于违规用户，批评教育为主

## 其他
[4] P26 P36 P90

## Troubleshoot
+ Kubelet 提示: The node was low on resource: ephemeral-storage
+ 原因: 节点上 Kubelet 的配置路径超过阈值会触发驱逐，默认情况下阈值是 85%
+ 解决: 或者清理磁盘释放资源，或者通过可修改 Kubelet 的配置参数imagefs.available来提高阈值,然后重启 Kubelet.
+ 参考: https://cloud.tencent.com/developer/article/1456389


## Troubleshoot
+ hostPath volumes are not allowed to be used
+ 原因: 集群中存在 psp(PodSecurityPolicy) 禁止 pod 直接挂载 hostpath.
+ 解决: 通过添加以下的 psp 规则来允许或者删除存在的 psp 都可

## Troubleshoot 
+ PLEG is not healthy
+ 原因: 宿主机上面跑的容器太多，导致 pod 无法在 3m 钟内完成生命周期检查
+ 解决: PLEG(Pod Lifecycle Event Generator) 用于 kublet 同步 pod 生命周期，本想着如果是因为时间短导致的超时，那是不是可以直接调整这个时间呢? 查看 Kubelet 的源码发现不太行，3m 时间是写在代码里的因此无法修改，当然修改再编译肯定没问题，但成本太大，所以只得优化容器的调度情况.
+ 参考: https://developers.redhat.com/blog/2019/11/13/pod-lifecycle-event-generator-understanding-the-pleg-is-not-healthy-issue-in-kubernetes/

## Troubleshoot
+ Kubernetes 启动后提示 slice: no such file ro directory
+ 原因: yum 安装的 Kubelet 默认的是 cgroupfs，而 Docker 一般默认的是 systemd。但是 kubernetes 安装的时候建议使用 systemd, Kubelet 跟 Docker 的不一致, 要么修改 Kubelet 的启动参数 , 要么修改 dokcer 启动参数
+ 解决:
Docker 的启动参数文件为: /etc/Docker/daemon.json: "exec-opts": ["native.cgroupdriver=systemd”]
Kubelet 的启动参数文件为: /var/lib/Kubelet/config.yaml: cgroupDriver: systemd


## Troubleshoot
calico cpu memory 使用overload
+ 原因: 使用了full mesh的模式
+ 解决: 换成RR模式 和 ipip模式


## Reference
1. 模块六
2. 模块八-Kubernetes 控制平面组件：生命周期管理和服务发现
3. 模块九：生产化集群的管理   chapter5 
4. 模块七
5. [Kubernetes 常见问题排查与解决方案！（纯干货）](https://blog.csdn.net/alex_yangchuansheng/article/details/119224283)