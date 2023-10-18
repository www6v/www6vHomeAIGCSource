---
title: K8s  AdmissionWebhook
date: 2023-10-16 16:07:04
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes  
---

<p></p>
<!-- more -->

## MutatingAdmissionWebhook 是如何工作的[1][chat]
`MutatingAdmissionWebhook`拦截与`MutatingWebhookConfiguration`中定义的规则匹配的请求，然后将其发送到Webhook服务器进行处理，然后再持久化到[etcd]（https://github.com/coreos/etcd) 中。 `MutatingAdmissionWebhook`通过向Webhook服务器发送admission请求来执行变更。Webhook服务器只是遵循[Kubernetes的API]（https://github.com/kubernetes/kubernetes/blob/v1.9.0/pkg/apis/admission/types.go)  的普通HTTP服务器。

以下图示了`MutatingAdmissionWebhook`的工作原理:

![mutating-admission-webhook](https://github.com/morvencao/kube-mutating-webhook-tutorial/blob/master/mutating-admission-webhook.jpg)

`MutatingAdmissionWebhook`需要三个对象才能正常工作:

1. **MutatingWebhookConfiguration**

   `MutatingAdmissionWebhook`需要在`apiserver`中注册，提供`MutatingWebhookConfiguration`。在注册过程中，MutatingAdmissionWebhook说明以下内容:

   - 如何连接到Webhook Admission服务器
   - 如何验证Webhook Admission服务器
   - Webhook Admission服务器的URL路径
   - 定义了哪些资源和操作它处理的规则
   - 如何处理来自Webhook Admission服务器的无法识别的错误

2. **MutatingAdmissionWebhook本身**

   `MutatingAdmissionWebhook`是一种插件式的Admission控制器，可以配置到`apiserver`中。`MutatingAdmissionWebhook`插件从`MutatingWebhookConfiguration`中获取感兴趣的Admission Webhooks列表。然后，`MutatingAdmissionWebhook`观察到对apiserver的请求，并拦截与admission webhook规则匹配的请求，并并行地调用它们。

3. **Webhook Admission服务器**

   `Webhook Admission服务器`只是一个符合Kubernetes [API]（https://github.com/kubernetes/kubernetes/blob/v1.9.0/pkg/apis/admission/types.go）的普通HTTP服务器。对于每个API server的请求，`MutatingAdmissionWebhook`将admissionReview（用于参考的[API]（https://github.com/kubernetes/kubernetes/blob/v1.9.0/pkg/apis/admission/types.go））发送到相关的webhook admission服务器。webhook admission服务器会从admissionReview中收集信息，如`object`，`oldobject`和`userInfo`，然后返回一个admissionReview响应，其中包括填充了admission决策和可选的`Patch`以改变资源的AdmissionResponse。


# 参考

1. [Diving into Kubernetes MutatingAdmissionWebhook](https://medium.com/ibm-cloud/diving-into-kubernetes-mutatingadmissionwebhook-6ef3c5695f74)
[kube-sidecar-injector](https://github.com/www6v/kube-sidecar-injector)  git
