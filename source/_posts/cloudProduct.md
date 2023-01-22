---
title: 云计算产品-计算
date: 2022-04-30 18:00:03
tags:
  - 云计算
categories:
  - 云计算  
  - 产品
---

<p></p>
<!-- more -->


## 计算 [1][5]
 /  | AWS service | Azure service | 阿里云 | 腾讯云
:-: | :-: | :-: | :-: |--- 
VM | [Amazon EC2 Instance Types](https://aws.amazon.com/ec2/instance-types) | [Azure Virtual Machines](https://azure.microsoft.com/services/virtual-machines) | ECS | CVM
Autoscaling| [AWS Auto Scaling](https://aws.amazon.com/autoscaling) | [Virtual machine scale sets](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/overview), [App Service autoscale](https://learn.microsoft.com/en-us/azure/app-service/web-sites-scale) | Auto Scaling| Auto Scaling
Batch processing| [AWS Batch](https://aws.amazon.com/batch) | [Azure Batch](https://azure.microsoft.com/services/batch) | | 
Serverless | [AWS Lambda](https://aws.amazon.com/lambda) | [Azure Functions](https://azure.microsoft.com/services/functions), [WebJobs](https://learn.microsoft.com/en-us/azure/app-service/web-sites-create-web-jobs) in Azure App Service | Function Compute| 云函数 SCF



### Storage

| AWS service                                                  | Azure service                                                | 阿里云 | 腾讯云 |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------ | ------ |
| Disk volumes on [Amazon Elastic Block Store (EBS)](https://aws.amazon.com/ebs) | Data disks in [Azure Blob Storage](https://azure.microsoft.com/services/storage/blobs). | todo   | todo   |
| [Amazon EC2 instance store](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html) | [Azure temporary storage](https://learn.microsoft.com/en-us/archive/blogs/mast/understanding-the-temporary-drive-on-windows-azure-virtual-machines) | todo   | todo   |
| [Amazon EBS Provisioned IOPS Volume](https://aws.amazon.com/ebs/provisioned-iops) | [Azure premium storage](https://learn.microsoft.com/en-us/azure/virtual-machines/premium-storage-performance) | todo   | todo   |
| [Amazon Elastic File System (EFS)](https://aws.amazon.com/efs) | [Azure Files](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-introduction) | todo   | todo   |



### Containers and container orchestrators

|                    | AWS service                                                  | Azure service                                                | 阿里云                        | 腾讯云                  |
| ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ----------------------------- | ----------------------- |
| 容器（托管）       | [Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks) | [Azure Kubernetes Service (AKS)](https://azure.microsoft.com/services/kubernetes-service) | ACK                           | TKE                     |
| 容器（serverless） | [Amazon Elastic Container Service (Amazon ECS)](https://aws.amazon.com/ecs), [AWS Fargate](https://aws.amazon.com/fargate) | [Azure Container Apps](https://azure.microsoft.com/products/container-apps/) | ECI（Container Instance）/ASK | EKS(Kubernetes Service) |
| service mesh       | [AWS App Mesh](https://aws.amazon.com/app-mesh)              | [Open Service Mesh on AKS](https://learn.microsoft.com/en-us/azure/aks/open-service-mesh-integrations) | ASM                           |                         |
| 边缘托管           |                                                              |                                                              | ACK@Edge[OpenYurt]            | TKE for Edge<br>        |


{% asset_img   product.jpg  Kubernetes产品形态[2]  %}

## Edge-边缘容器 [3]


| 平台        | 开源                   |
| ----------- | ---------------------- |
| 百度云      | OpenEdge[BAETYL]- Linux Foundation Edge  |
| 华为   华为 | kubeedge-  CNCF        |
| 腾讯        | SuperEdge- CNCF        |
| 阿里云      | OpenYurt  - CNCF       |


## 参考
1. [从AWS到阿里云： 产品体系差异分析](https://zhuanlan.zhihu.com/p/158035354)
2. [Serverless Kubernetes：理想，现实与未来](https://mp.weixin.qq.com/s/o_dPKP_6dL92Q4jiG4097A)  易立、张维
3. [盘点：2022年值得关注的十大边缘计算开源项目](https://www.easemob.com/news/7832)
4. [阿里云系列课程](https://www.bilibili.com/video/BV1tD4y1977x?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036) *** 有ppt链接
5. [Compute services on Azure and AWS](https://learn.microsoft.com/en-us/azure/architecture/aws-professional/compute) 
