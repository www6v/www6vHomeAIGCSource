---
title: K8S 应用迁移至K8S 
date: 2022-04-02 22:16:54
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes
---


<p></p>
<!-- more -->


## 应用容器化
##### 启动速度
##### 健康检查
##### 启动参数

##### Dockerfile
+ 基础镜像，Utility Lib
+ 主进程, Fork bomb
+ 代码和配置分离
  配置： 环境变量， 配置文件mount
+ 分层控制
+ Entrypoint

##### 日志
todo

##### 共享kernel 
系统参数配置共享 （todo）
进程数共享 - Fork bomb
fd数共享 - 容器可能用完主机所有的fd
主机磁盘共享 - lvm， 强IO 

