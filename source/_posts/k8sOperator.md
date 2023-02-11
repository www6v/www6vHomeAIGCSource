---
title: Kubernetes Operator
date: 2019-11-19 10:59:00
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->

{% asset_img   operator.jpg  Operator  %} 

**Operator: "有状态应用", 自动化运维工作。**

## 一. Etcd Operator部署 
Controller + CRD 
[etcd Controller](https://github.com/coreos/etcd-operator/blob/master/example/deployment.yaml)  Deployment
[etcd CRD](https://github.com/coreos/etcd-operator/blob/master/example/example-etcd-cluster.yaml)  API资源类型 kind: "EtcdCluster"

etcd高可靠： backup + restore   
[etcd backup](https://github.com/coreos/etcd-operator/tree/master/example/etcd-backup-operator)  etcd备份
[etcd restore](https://github.com/coreos/etcd-operator/tree/master/example/etcd-restore-operator) etcd恢复: 恢复备份的数据

## 二. 普通运维方式etcd运维步骤:
1. 创建种子节点（集群）的阶段称为：Bootstrap
2. 通过 Etcd 命令行添加一个新成员：
```
$ etcdctl member add infra1 http://10.0.1.11:2380
```
3. 为这个成员节点生成对应的启动参数，并启动它：
```
etcd
--data-dir=/var/etcd/data
--name=infra1
--initial-advertise-peer-urls=http://10.0.1.11:2380
--listen-peer-urls=http://0.0.0.0:2380
--listen-client-urls=http://0.0.0.0:2379
--advertise-client-urls=http://10.0.1.11:2379
--initial-cluster=infra0=http://10.0.1.10:2380,infra1=http://10.0.1.11:2380
--initial-cluster-state=existing
```

## 三. etcd Operator 

<div>
{% asset_img   operator1.jpg  etcd Operator  %}
</div>

注: 一个etcd集群，一个controller。

当这个 YAML 文件第一次被提交到 Kubernetes 之后，Etcd Operator 的 Informer，就会立
刻“感知”到一个新的 EtcdCluster 对象被创建了出来。所以，EventHandler 里的“添加”事
件会被触发。

而这个 Handler 要做的操作也很简单，即：在 Etcd Operator 内部创建一个对应的 Cluster 对
象（cluster.New），比如流程图里的 Cluster1。



## 参考:
[深入剖析Kubernetes - 27  聪明的微创新：Operator工作原理解读]() 张磊
[面向 Kubernetes 编程： Kubernetes 是下一代操作系统](https://mp.weixin.qq.com/s/E5-agHtMvW_X7znVJDkTKA)
[awesome-operators](https://github.com/www6v/awesome-operators)   github 
[operator-sdk](https://github.com/operator-framework/operator-sdk)  github 工具