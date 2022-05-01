---
title: Kubernetes集群搭建(二进制)
date: 2019-01-17 12:23:58
tags:
  - Kubernetes
categories:
  - 分布式 
  - 云原生
  - Kubernetes
---

<p></p>
<!-- more -->


1. 禁用swap
```
swapoff -a
```

2. 查看这些端口是否被占用，如果被占用，请手动释放。
```
netstat -ntlp |grep -E '6443|23[79,80]|1025[0,1,2]' 
```

3. 安装 kubectl
```
$  wget https://dl.k8s.io/v1.10.7/kubernetes-client-linux-amd64.tar.gz
$  echo '169b57c6707ed8d8be9643b0088631e5c0c6a37a5e99205f03c1199cd32bc61e  kubernetes-client-linux-amd64.tar.gz' | sha256sum -c -
$  tar zxf kubernetes-client-linux-amd64.tar.gz
$  sudo mv kubernetes/client/bin/kubectl /usr/local/bin/kubectl
$  /usr/local/bin/kubectl version --client
```

4. 安装 kubeadm 和 kubelet

```
$ wget -q https://dl.k8s.io/v1.11.3/kubernetes-server-linux-amd64.tar.gz
如不能访问请使用以下方式下载
链接: https://pan.baidu.com/s/1FSEcEUplQQGsjyBIZ6j2fA 提取码: cu4s

$ echo 'e49d0db1791555d73add107d2110d54487df538b35b9dde0c5590ac4c5e9e039 kubernetes-server-linux-amd64.tar.gz' | sha256sum -c -
$ tar -zxf kubernetes-server-linux-amd64.tar.gz
$ mv kubernetes/server/bin/kube{adm,ctl,let} /usr/bin/

$ kubeadm version
$ kubectl version --client
$ kubelet --version

```

5. 配置 kubelet

```
$ cat <<EOF > /etc/systemd/system/kubelet.service
[Unit]
Description=kubelet: The Kubernetes Agent
Documentation=http://kubernetes.io/docs/

[Service]
ExecStart=/usr/bin/kubelet
Restart=always
StartLimitInterval=0
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

```


```
$ mkdir -p /etc/systemd/system/kubelet.service.d
$ cat <<EOF > /etc/systemd/system/kubelet.service.d/kubeadm.conf
[Service]
Environment="KUBELET_KUBECONFIG_ARGS=--bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf"
Environment="KUBELET_CONFIG_ARGS=--config=/var/lib/kubelet/config.yaml"
EnvironmentFile=-/var/lib/kubelet/kubeadm-flags.env
EnvironmentFile=-/etc/default/kubelet
ExecStart=
ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBELET_KUBEADM_ARGS $KUBELET_EXTRA_ARGS
EOF
$ systemctl enable kubelet
```
6. 
安装前置依赖 crictl
```
$ wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.11.1/crictl-v1.11.1-linux-amd64.tar.gz
$ echo 'ccf83574556793ceb01717dc91c66b70f183c60c2bbec70283939aae8fdef768 crictl-v1.11.1-linux-amd64.tar.gz' | sha256sum -c -
$ tar zxvf crictl-v1.11.1-linux-amd64.tar.gz
$ mv crictl /usr/bin/
```

安装前置依赖 socat
```
yum install -y socat
apt-get install -y socat
```

7. 配置集群网络 + 初始化集群

```
$ kubeadm reset 

# 使用 flannel 
$ kubeadm init --pod-network-cidr=10.244.0.0/16
  会遇到如下异常：
   kubeadm config images pull命令一直卡死
  解决方式：
   国内的代码托管平台提供了一个[仓库](https://gitee.com/K8S-release/kubeadm)
   对每个 tar 文件执行 sudo docker load -i xx.tar 即可将镜像导入.

# 验证   
$ kubectl get nodes
  会遇到如下异常：
  The connection to the server localhost:8080 was refused - did you specify the right host or port?
  解决方式：
    # mkdir -p $HOME/.kube
    # sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    # sudo chown $(id -u):$(id -g) $HOME/.kube/config    

# 验证
$ kubectl get nodes -o yaml
  会遇到如下异常：
  lastTransitionTime: 2018-09-20T01:09:48Z
      message: 'runtime network not ready: NetworkReady=false reason:NetworkPluginNotReady
        message:docker: network plugin is not ready: cni config uninitialized'
      reason: KubeletNotReady
  解决方式：      
  $ sysctl net.bridge.bridge-nf-call-iptables=1
  # 注意，这里的 flannel 配置仅适用于 1.11 版本的 K8S，若安装其他版本的 K8S 需要替换掉此链接
  $ kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml
  # 检查状态
  kubectl get pods --all-namespaces

```

8. 新增 Node
```
$ kubeadm join 10.4.65.33:6443 --token ci6511.ydxqtk4kx3vrqq5m --discovery-token-ca-cert-hash sha256:e2d8ba4692ead9649bae6dfd1b3459e4fc1ade5c05fb6868fccf03d8f4e87c8c

# 在master上验证
$ kubectl get nodes
```

9. 可能会遇到的问题
```
    /run/flannel/subnet.env: no such file or directory
```

## 参考:

1. [动手实践：搭建一个 Kubernetes 集群 - 生产可用](https://juejin.im/book/5b9b2dc86fb9a05d0f16c8ac/section/5b9b8346f265da0af03375ed)



