---
title: istio常用命令
date: 2019-07-15 11:18:30
tags:
  - 分布式
  - istio
categories: 
  - serviceMesh   
---


## 常用命令
1. Envoy的启动信息
```
$ istioctl proxy-config bootstrap ratings-v1-85858fc49f-89zd5
{
	"bootstrap": {
		"node": {
            ...
		},
		"staticResources": {
			"listeners": [{			
                    ...
			}],
			"clusters": [{
                   ...
			}, 
			... , ...]
		},
		"dynamicResources": {
			"ldsConfig": {
				"ads": {}
			},
			"cdsConfig": {
				"ads": {}
			},
			"adsConfig": {
                 ...
			}
		},
		"statsConfig": {			
		    ...
		},
		"tracing": {
		    ...
		},
		"admin": {
     		...
		}
	},
	"lastUpdated": "2019-07-08T02:44:29.440Z"
}
```

2. xDS
```
$ istioctl proxy-config cluster ratings-v1-85858fc49f-89zd5
$ istioctl proxy-config endpoint reviews-v1-6db46f6486-q7nth
$ istioctl proxy-config listener  reviews-v1-6db46f6486-q7nth
$ istioctl proxy-config route  reviews-v1-6db46f6486-q7nth
```

3. 其他

```
# API server准入机制
$ kubectl get  ValidatingWebhookConfiguration  -o yaml
$ kubectl get mutatingwebhookconfiguration istio-sidecar-injector -o yaml  # sidecar自动注入


#   kubectl exec  Pod名字  -c  容器名字  -- 执行的命令
$ kubectl exec productpage-v1-8579d7b797-dhj7z   -c istio-proxy  -- ps -ef
/usr/local/bin/pilot-agent 
/usr/local/bin/envoy 

$ kubectl exec productpage-v1-8579d7b797-dhj7z   -c istio-proxy curl http://127.0.0.1:15000/help
$ kubectl exec productpage-v1-8579d7b797-dhj7z   -c istio-proxy --  netstat -ln
```
```
Envoy的配置
$ kubectl -n default exec ratings-v1-85858fc49f-89zd5  -c istio-proxy curl http://localhost:15000/config_dump > dump-rating.json
```

## 参考:
1. [Istio 的数据平面 Envoy Proxy 配置详解](https://www.servicemesher.com/blog/envoy-proxy-config-deep-dive/)
2. [《云原生服务网格Istio：原理、实践、架构与源码解析》 实践篇](https://item.jd.com/12538407.html) 

