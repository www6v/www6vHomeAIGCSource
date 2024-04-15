---
title: istio 灰度发布
date: 2023-04-15 22:02:28
tags:
  - serviceMesh
categories:
  - 云原生
  - serviceMesh
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

#  灰度发布
+ 灰度发布
	- 基础： 服务多版本
		+ 两个Deployment
		+ 不同的路由规则
	- 场景
		+ 蓝绿部署，A/B test
		+ 金丝雀部署
	- 分类
		+ 基于流量比例的灰度发布 #4
		+ 基于请求内容的灰度发布

# 实战[1]
### VirtualService
``` yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: cat-vs
spec:
  hosts:
  - "cat.catface996.com"
  gateways:
  - cat-gateway
  http:
  ## gray 路由规则
  - match:
    - headers:
        env:
          exact: gray
    route:
    - destination:
        host: cat-svc
        subset: gray
  ## prod 路由规则
  - match:
    - headers:
        env:
          exact: prod
    route:
    - destination:
        host: cat-svc
        subset: prod
  ## 默认 路由规则
  - route:
    - destination:
        host: cat-svc
        subset: prod
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: dog-vs
spec:
  hosts:
  - "dog-svc"
  http:
  ## gray 路由规则
  # - match:
  #   - headers:
  #       env:
  #         exact: gray
  #   route:
  #   - destination:
  #       host: dog-svc
  #       subset: gray
  ## prod 路由规则
  - match:
    - headers:
        env:
          exact: prod
    route:
    - destination:
        host: dog-svc
        subset: prod
  ## 默认路由规则      
  - route:
    - destination:
        host: dog-svc
        subset: prod
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: monkey-vs
spec:
  hosts:
  - "monkey-svc"
  http:
  ## gray 路由规则
  - match:
    - headers:
        env:
          exact: gray
    route:
    - destination:
        host: monkey-svc
        subset: gray
  ## prod 路由规则
  - match:
    - headers:
        env:
          exact: prod
    route:
    - destination:
        host: monkey-svc
        subset: prod
  ## 默认路由规则      
  - route:
    - destination:
        host: monkey-svc
        subset: prod
```

### Destination Rule
``` yaml
kind: DestinationRule
apiVersion: networking.istio.io/v1alpha3
metadata:
  name: cat-dr
spec:
  host: cat-svc
  subsets:
    - name: prod
      labels:
        version: prod
    - name: gray
      labels:
        version: gray
---
kind: DestinationRule
apiVersion: networking.istio.io/v1alpha3
metadata:
  name: dog-dr
spec:
  host: dog-svc
  subsets:
    - name: prod
      labels:
        version: prod
    - name: gray
      labels:
        version: gray
---
kind: DestinationRule
apiVersion: networking.istio.io/v1alpha3
metadata:
  name: monkey-dr
spec:
  host: monkey-svc
  subsets:
    - name: prod
      labels:
        version: prod
    - name: gray
      labels:
        version: gray
```

# 参考
1. [实施灰度Istio+SpringCloud](https://www.bilibili.com/video/BV1t44y137VY/?vd_source=f6e8c1128f9f264c5ab8d9411a644036) V *** 
   [Repo](https://github.com/catface996/ladder) git
1xx. [金丝雀升级](https://preliminary.istio.io/latest/zh/docs/setup/upgrade/canary/) 