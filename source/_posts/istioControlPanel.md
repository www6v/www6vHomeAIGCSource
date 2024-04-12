---
title: istio 控制面ControlPanel
date: 2022-01-14 16:15:13
tags:
  - istio
categories: 
  - 云原生
  - serviceMesh  
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

# istio控制面(1.1-1.4)
### Pilot
+ Pilot
	+ 组件
		+ Adaptor
			k8s， Mesos
		+ Rules API
			DSL  运维人员使用
		+ Envoy API  #1
			+ Envoy V2， gRPC协议
			+ xDS，控制面规范  #3
		+ Abstract Model
	+ 功能
		+ 服务发现、负载均衡
			+ 服务可见性【6】
				+ 问题： 服务惊群效应
		+ 流量管理 【self 1】


### Mixer
+ Mixer
	+ Adapter 模型
		+ 功能
			+ metrics
			+ logs
		+ 组件
			+ Handler
			+ Instance
			+ Rule
	+ 功能
		+ 遥测
		+ Policy策略
			+ 限流策略
				+ 有条件的限流
			+ 黑白名单


### Citadel
+ Citadel
	+ 功能
		+ 安全


### Galley
+ Galley
	+ 功能
		配置管理
	+ 「配置」分发协议(MCP)
		+ source
		+ sink
			Pilot和Mixer
		+ resource
			配置: k8s Resource Definition + istio CRD
								
### 功能
+ 功能
	+ 全局的管理规则
	+ 网格内的元数据维护


# mixer的三大功能
  + 前置条件检查 
  + 配额管理
  + 遥测报告 

# 优化 
  - 默认关闭mixer
  - 1.5之后mixer被移除

# 参考
[Istio 庖丁解牛三：galley](https://mp.weixin.qq.com/s/BMVCeiA2aqASbLqyhPomWA)  腾讯云 钟华
[Istio1.1新特性之限制服务可见性](http://www.servicemesher.com/blog/istio-service-visibility/)  敖小剑 引
[官方内置adapters](https://istio.io/docs/reference/config/policy-and-telemetry/adapters/)  大多数是metrics and logs系统 