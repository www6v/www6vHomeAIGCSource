---
title: 故障模型-基础设施层
date: 2018-05-03 21:59:57
tags:
  - 故障模型
categories:
  - 稳定性
  - 故障模型
---

<p></p>
<!-- more -->

## 故障模型-基础设施层
+ 故障模型-Virtualization&Storage&Networking
	- 服务器宕机&假死
	- 断电
		- 解决：异地多活
	- 超卖
	- 混和部署【3】
	- 存储【2】
		- 磁盘满，坏
		- 不可写，不可读
	- 网络【1】
		- 网络抖动、丢包、超时
		- 网卡满
		- DNS故障
		- 断网

# 参考
### Virtualization & Storage & Networking
1. [Kubernetes 网络疑难杂症排查分享](https://tencentcloudcontainerteam.github.io/2019/08/12/troubleshooting-with-kubernetes-network/)  腾讯云 ***
2. [kubernetes 最佳实践：处理容器数据磁盘被写满](https://tencentcloudcontainerteam.github.io/2019/06/08/kubernetes-best-practice-handle-disk-full/) 腾讯云
3. [百度大规模战略性混部系统演进](https://www.infoq.cn/article/aEut*ZAIffp0q4MSKDSg)



