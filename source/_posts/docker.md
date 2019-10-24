---
title: Docker总结
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

<!-- more -->
## 一. docker全景图
<div style="text-align: center;">
![docker-overview](https://user-images.githubusercontent.com/5608425/64622251-99232900-d419-11e9-8f56-4f88831828ad.JPG)  
docker全景图
</div>

```
$find  /var/lib/docker/  -name image         /// [只读层]
$find  /var/lib/docker/  -name containers    /// containers 目录: 体积大说明日志输出量大
$find  /var/lib/docker -name diff            /// [可读写层] diff 子目录: 容器可写层，体积大说明可写层数据量大(程序在容器里写入文件)。 
$find  /var/lib/docker/  -name mnt           ///  mnt 子目录: 联合挂载点，内容为容器里看到的内容，即包含镜像本身内容以及可写层内容
```

## 二. docker namespace
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

## 三. docker run的背后 [6]
```
 $ docker run -i -t ubuntu /bin/bash
```

When you run this command, the following happens (assuming you are using the default registry configuration):

1. If you do not have the ubuntu image locally, Docker pulls it from your configured registry, as though you had run docker pull ubuntu manually.

2. **Docker creates a new container, as though you had run a docker container create command manually.**

3. **Docker allocates a read-write filesystem to the container, as its final layer. This allows a running container to create or modify files and directories in its local filesystem.**

4. Docker creates a network interface to connect the container to the default network, since you did not specify any networking options. This includes assigning an IP address to the container. By default, containers can connect to external networks using the host machine’s network connection.

5. Docker starts the container and executes /bin/bash. Because the container is running interactively and attached to your terminal (due to the -i and -t flags), you can provide input using your keyboard while the output is logged to your terminal.

6. When you type exit to terminate the /bin/bash command, the container stops but is not removed. You can start it again or remove it.


## 参考: 

1. 《深入剖析Kubernetes - 05  白话容器基础（一）：从进程说开去》 张磊
2. 《深入剖析Kubernetes - 06  白话容器基础（二）：隔离与限制》 张磊
3. 《深入剖析Kubernetes - 07  白话容器基础（三）：深入理解容器镜像》 张磊
4. 《深入剖析Kubernetes - 08  白话容器基础（四）：重新认识Docker容器》 张磊
5. [kubernetes 最佳实践：处理容器数据磁盘被写满](https://tencentcloudcontainerteam.github.io/2019/06/08/kubernetes-best-practice-handle-disk-full/)
6. [Docker overview](https://docs.docker.com/engine/docker-overview/)
