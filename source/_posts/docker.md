---
title: docker总结
date: 2019-08-05 11:43:09
tags: 
  - docker
  - network
categories:  
  - 分布式
  - 云原生
  - docker
---

{% asset_img   docker.jpg   docker总结  %}

```
[root@10-25-152-177 ~]# docker inspect --format '{{ .State.Pid }}' 23dfea495611
23777
[root@10-25-152-177 ~]# ls -l /proc/23777/ns
total 0
lrwxrwxrwx 1 1337 1337 0 Aug  8 16:05 ipc -> ipc:[4026532754]
lrwxrwxrwx 1 1337 1337 0 Aug  8 16:05 mnt -> mnt:[4026533007]
lrwxrwxrwx 1 1337 1337 0 Aug  8 16:05 net -> net:[4026532757]
lrwxrwxrwx 1 1337 1337 0 Aug  8 16:05 pid -> pid:[4026533009]
lrwxrwxrwx 1 1337 1337 0 Aug  8 16:05 user -> user:[4026531837]
lrwxrwxrwx 1 1337 1337 0 Aug  8 16:05 uts -> uts:[4026533008]
```


参考

1. 《深入剖析Kubernetes - 05  白话容器基础（一）：从进程说开去》 张磊
2. 《深入剖析Kubernetes - 06  白话容器基础（二）：隔离与限制》 张磊
3. 《深入剖析Kubernetes - 07  白话容器基础（三）：深入理解容器镜像》 张磊
4. 《深入剖析Kubernetes - 08  白话容器基础（四）：重新认识Docker容器》 张磊