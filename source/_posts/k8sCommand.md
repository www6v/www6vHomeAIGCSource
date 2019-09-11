---
title: Kubernetes命令
date: 2019-06-09 10:28:33
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes  
---
   
1. kubectl get 资源名  -> 简单描述

```
kubectl get rc
kubectl get pods
kubectl get deployment
```


2. kubectl describe 资源名  -> 详细信息

```
kubectl describe rc
kubectl describe pods
kubectl describe deployment
```

3. 一些命令

```
kubectl get rc -o wide
kubectl logs kubia-cjrqd
kubectl get pods --show-labels
kubectl get rs  -o yaml| less  ## 可以看 status， annotations
kubectl get pods kubia-cjrqd -o yaml | less   ## 可以看 status， 可以看 OwnerReference

kubectl -n default get all   ## 可以看所有资源  
```

4. watch 状态

```
kubectl get pods --watch
```

5. Deployment 回滚

```
kubectl rollout undo deployment/deployment-nginx
kubectl rollout undo deployment.v1.apps/deployment-nginx  --to-revision=2
```

6. edit 命令: 直接修改k8s里的API对象

```
kubectl edit pods kubia-cjrqd
kubectl edit deployment  nginx-deployment
```

7.  docker 磁盘使用情况
``` 
docker system df -v

+Images space usage:

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE                SHARED SIZE         UNIQUE SIZE         CONTAINERS
<none>              <none>              818d02f0fd5f        4 days ago          121.8MB             121.7MB             41.83kB             2
maven               3-jdk-8-alpine      7445f83cd169        4 months ago        121.7MB             121.7MB             0B                  0

+Containers space usage:

CONTAINER ID        IMAGE               COMMAND                  LOCAL VOLUMES       SIZE                CREATED             STATUS                  NAMES
79bf1498857f        818d02f0fd5f        "/bin/sh -c 'mvn pac…"   0                   460B                4 days ago          Exited (1) 4 days ago   elegant_ramanujan
e6fcce289871        818d02f0fd5f        "/bin/sh -c 'mvn pac…"   0                   460B                4 days ago          Exited (1) 4 days ago   sleepy_lichterman

+Local Volumes space usage:

VOLUME NAME         LINKS               SIZE

+Build cache usage: 0B

CACHE ID            CACHE TYPE          SIZE                CREATED             LAST USED           USAGE               SHARED

```


## 参考: 
1. [kubernetes 最佳实践：处理容器数据磁盘被写满](https://tencentcloudcontainerteam.github.io/2019/06/08/kubernetes-best-practice-handle-disk-full/)








