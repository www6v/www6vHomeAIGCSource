---
title: istio安装 + Bookinfo示例
date: 2019-07-02 15:24:50
tags:
  - 分布式
  - istio
categories: 
  - serviceMesh   
---

## 一. istio安装
 
```
#资源准备
wget https://github.com/istio/istio/releases/download/1.1.1/istio-1.1.1-linux.tar.gz
tar xvf istio-1.1.1-linux.tar.gz

#建立namespace
$ kubectl create namespace istio-system

#Istio CRD安装
$ helm template install/kubernetes/helm/istio-init --name istio-init --namespace istio-system | kubectl apply -f -

#CRD验证
$ kubectl get crds | grep 'istio.io\|certmanager.k8s.io' | wc -l
53

#Istio 的核心组件安装
$ helm template install/kubernetes/helm/istio --name istio --namespace istio-system | kubectl apply -f -

#验证
$ kubectl get svc -n istio-system
$ kubectl get pods -n istio-system
```

<!-- more -->

## 二.  Bookinfo示例

### 1. Bookinfo应用
```
#手动注入
$ kubectl apply -f <(istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml)
```
```
#安装gateway
$ kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

#验证gateway 
$ kubectl get gateway
```
```
#访问应用
$ export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
$ export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
$ export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
$ curl -s http://${GATEWAY_URL}/productpage | grep -o "<title>.*</title>"
```

访问应用 浏览器中打开应用程序页面
{% asset_img  getService.JPG  istio-ingressgateway的EXTERNAL-IP %}
{% asset_img  browserCheck.JPG  浏览器中打开应用程序页面  %}

### 2. 路由 

#### 基于版本的路由
```
#在目标规则中定义好可用的版本，命名为 subsets
$ kubectl apply -f samples/bookinfo/networking/destination-rule-all.yaml

#基于版本的路由: virtual service 将所有流量路由到每个微服务的 v1 版本
$ kubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml
$ kubectl delete -f samples/bookinfo/networking/virtual-service-all-v1.yaml
```

#### 基于用户身份的路由
```
#基于用户身份的路由: 来自名为 Jason 的用户的所有流量将被路由到服务 reviews:v2
$ kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml

$ kubectl delete -f samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml
```

### 3. 遥测

#### 收集指标和日志
```
kubectl apply -f new_telemetry.yaml

#向示例应用发送流量
curl http://$GATEWAY_URL/productpage
```

注意: 外网访问不了, 需要在uk8s集群上做NAT路由到Prometheus服务所在的Node
{% asset_img  prom-NAT-transfer.png  Prometheus服务的NAT %}


打开Prometheus界面并查询 istio_double_request_count 的值
{% asset_img  prom1.JPG   Prometheus查询  %}
{% asset_img  prom2.JPG   Prometheus查询  %}

## 参考:

1. [使用 Helm 进行安装](https://istio.io/zh/docs/setup/kubernetes/install/helm/)
2. [Istio及Bookinfo示例程序安装试用笔记](https://zhaohuabing.com/2017/11/04/istio-install_and_example/)
3. [Bookinfo Application](https://istio.io/docs/examples/bookinfo/#confirm-the-app-is-accessible-from-outside-the-cluster)
4. [配置请求路由](https://preliminary.istio.io/zh/docs/tasks/traffic-management/request-routing/)
5. [收集指标和日志](https://preliminary.istio.io/zh/docs/tasks/telemetry/metrics/collecting-metrics/)


