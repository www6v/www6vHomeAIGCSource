---
title: etcd 部署
date: 2022-04-24 15:27:39
tags:
  - etcd
categories: 
  - 数据库
  - KV
  - etcd
---


<p></p>
<!-- more -->

## 单机Docker部署
``` shell
# image
$ docker pull bitnami/etcd:latest

# network
$ docker network create app-tier --driver bridge

# server start
$ docker run -d --name etcd-server \
    --network app-tier \
    --publish 2379:2379 \
    --publish 2380:2380 \
    --env ALLOW_NONE_AUTHENTICATION=yes \
    --env ETCD_ADVERTISE_CLIENT_URLS=http://etcd-server:2379 \
    bitnami/etcd:latest
    
# client->put
$ docker run -it --rm \
    --network app-tier \
    --env ALLOW_NONE_AUTHENTICATION=yes \
    bitnami/etcd:latest etcdctl --endpoints http://etcd-server:2379 put       testKey helloEtcd!
    
# client->get    
$ docker run -it --rm \
    --network app-tier \
    --env ALLOW_NONE_AUTHENTICATION=yes \
    bitnami/etcd:latest etcdctl --endpoints=http://etcd-server:2379 get testKey    
```

## 参考
[docker 安装 ETCD 及 etcd 使用](https://www.cnblogs.com/zjdxr-up/p/15409176.html)