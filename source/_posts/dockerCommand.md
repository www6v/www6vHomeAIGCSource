---
title: Docker 命令
date: 2020-05-27 16:41:43
tags: 
  - docker
categories:  
  - 分布式
  - 云原生
  - docker
---

<p></p>
<!-- more -->

```
# docker 加速
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://8c39031b.m.daocloud.io

# docker registry
docker login repo.shai.cloud:7443

docker tag  repo.shai.cloud:7443/mysql:5.7.17  shai.cloud/mysql:5.7.17
docker push shai.cloud/mysql:5.7.17 

docker pull shai.cloud/linux/centos:ssh-7
```

```
docker build -t cup/train  .
docker run -d -p 7001:8081 -p 7002:9001 --name nexus -v /home/admin/nexus-data:/nexus-data  sonatype/nexus3

docker stop mysql
docker rm mysql
docker rmi  22be5748ecbe
docker restart mysql 

docker  cp   java.policy.ubuntu   els-master1:/etc/java-8-openjdk/security/java.policy
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id
```

```
# GPU docker
nvidia-docker build -t dprecogpu:1.0   .
nvidia-docker run -itd  --name  dpRecoGpu -v /home/wangwei/jniTest/jniReco:/home/wangwei/jniTest/jniReco  dprecogpu:1.0 
nvidia-docker exec -it dpRecoGpu bash
```

```
# iptables
service iptables save # docker restart之后要save。

# remove
iptables -t nat -L -n --line-numbers
iptables -t nat -D PREROUTING 1

# 运行时暴露端口 -- broker 的端口的暴露
iptables -t nat -A PREROUTING  -p tcp -m tcp --dport 10911 -j DNAT --to-destination  172.3.0.4:10911 


/sbin/iptables -I INPUT -p tcp --dport 18080 -j ACCEPT 
```

```
# 阿里的开源的小工具  derrick
derrick init
derrick up
```