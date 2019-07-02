---
title: istio安装 + bookinfo例子
date: 2019-07-02 15:24:50
tags:
  - 分布式
  - istio
categories: 
  - serviceMesh   
---

一. istio安装
 
```
资源准备
wget https://github.com/istio/istio/releases/download/1.1.1/istio-1.1.1-linux.tar.gz
tar xvf istio-1.1.1-linux.tar.gz

建立namespace
$ kubectl create namespace istio-system

Istio CRD安装
$ helm template install/kubernetes/helm/istio-init --name istio-init --namespace istio-system | kubectl apply -f -

CRD验证
$ kubectl get crds | grep 'istio.io\|certmanager.k8s.io' | wc -l
53

Istio 的核心组件安装
$ helm template install/kubernetes/helm/istio --name istio --namespace istio-system | kubectl apply -f -

验证
$ kubectl get svc -n istio-system
$ kubectl get pods -n istio-system
```

<!-- more -->

二.  Bookinfo例子

```
手动注入
$ kubectl apply -f <(istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml)
```

```
安装gateway
$ kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

验证gateway 
$ kubectl get gateway
```

```
访问应用
$ export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
$ export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
$ export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
$ curl -s http://${GATEWAY_URL}/productpage | grep -o "<title>.*</title>"
```

访问应用 浏览器中打开应用程序页面
{% asset_img  getService.JPG  istio-ingressgateway的EXTERNAL-IP %}
{% asset_img  browserCheck.JPG  浏览器中打开应用程序页面  %}

## 参考:

1. [使用 Helm 进行安装](https://istio.io/zh/docs/setup/kubernetes/install/helm/)
2. [Bookinfo Application](https://istio.io/docs/examples/bookinfo/#confirm-the-app-is-accessible-from-outside-the-cluster)
3. [Istio及Bookinfo示例程序安装试用笔记](https://zhaohuabing.com/2017/11/04/istio-install_and_example/)


