---
title: k8s 命令
date: 2019-06-09 10:28:33
tags:
  - Kubenetes
categories:
  - 云原生
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

6. edit 命令

```
kubectl edit pods kubia-cjrqd
kubectl edit deployment  nginx-deployment
```




