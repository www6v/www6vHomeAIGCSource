---
title: Kubernetes安装 
date: 2021-06-02 22:23:27
tags:
  - Kubenetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->


安装方式 |  |  
:-:  | :-:  |  
ansible安装| https://github.com/easzlab/kubeasz<br>https://github.com/easzlab/kubeasz/blob/master/docs/setup/quickStart.md | 
kubeadm安装| https://github.com/opsnull/follow-me-install-kubernetes-cluster |
minikube安装| https://minikube.sigs.k8s.io/docs/start/ |


<code>
(ansible control machine)  
st-arch-renault-redis-1  
 
-集群
work-arch-renault-portal-1    10.100.140.227   master
work-arch-renault-portal-2    10.100.140.228.  master
work-arch-renault-redis-1     10.100.140.229   node
work-arch-renault-redis-2     10.100.140.230.  node
work-arch-renault-redis-3     10.100.140.231.  node
work-arch-renault-redis-4     10.100.140.232.  node
work-arch-kv-redis-1          172.16.28.92     append
work-arch-kv-redis-2          172.16.28.93     append
work-arch-kv-redis-3          172.16.28.94     append	
</code>



### 一.  新建集群 - 参考2

### 安装k8s包到本地目录 /bin /down	 
<code>
export release=2.2.4  

curl -C- -fLO --retry 3 https://github.com/easzlab/kubeasz/releases/  
download/${release}/easzup  
chmod +x ./easzup  
  
./easzup -D  
./easzup -S	  
</code>


### step1
<code>
(CentOS7)   
$ yum install git python-pip -y    

-pip安装ansible(国内如果安装太慢可以直接用pip阿里云加速)   
$ pip install pip --upgrade -i https://mirrors.aliyun.com/pypi/simple/ 
$ pip install ansible==2.6.18 netaddr==0.7.19 -i https://mirrors.aliyun.com/pypi/simple/ 
</code>

