---
title: 云计算产品-存储Storage
date: 2022-05-22 11:07:47
tags:
  - 云计算
categories:
  - 云计算  
  - 产品
---

<p></p>
<!-- more -->

## 存储 [1][2]
 /  | AWS service | Azure service | 阿里云 | 腾讯云 
:-: | :-: | :-: | :-: | :-: 
Object storage| [Simple Storage Services (S3)](https://aws.amazon.com/s3/) | [Blob storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction) | OSS | COS
Virtual server disks| [Elastic Block Store (EBS)](https://aws.amazon.com/ebs/) | [managed disks](https://azure.microsoft.com/services/storage/disks/) | EBS | CBS
Shared files| [Elastic File System](https://aws.amazon.com/efs/) | [Files](https://azure.microsoft.com/services/storage/files/) | NAS| CFS



### Archiving and backup

| AWS service                                                  | Azure service                                                | 阿里云              | 腾讯云              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------- | ------------------- |
| [S3 Infrequent Access (IA)](https://aws.amazon.com/s3/storage-classes) | [Storage cool tier](https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview) |                     |                     |
| [S3 Glacier](https://aws.amazon.com/s3/storage-classes), Deep Archive-S3 Glacier | [Storage archive access tier](https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview) | OSS Archive Storage | COS Archive Storage |
| [Backup](https://aws.amazon.com/backup/)                     | [Backup](https://azure.microsoft.com/services/backup/)       |                     |                     |



### Hybrid storage

| AWS service                                               | Azure service                                                | 阿里云 | 腾讯云 |
| --------------------------------------------------------- | ------------------------------------------------------------ | ------ | ------ |
| [Storage Gateway](https://aws.amazon.com/storagegateway/) | [StorSimple](https://azure.microsoft.com/services/storsimple/) |        |        |
| [DataSync](https://aws.amazon.com/datasync/)              | [File Sync](https://learn.microsoft.com/en-us/azure/storage/files/storage-sync-files-planning) |        |        |



### Bulk data transfer

| AWS service                                                  | Azure service                                                | 阿里云 | 腾讯云 |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------ | ------ |
| [Import/Export Disk](https://aws.amazon.com/snowball/disk/details/) | [Import/Export](https://learn.microsoft.com/en-us/azure/storage/common/storage-import-export-service) |        |        |
| [Import/Export Snowball](https://aws.amazon.com/snowball/), [Snowball Edge](https://aws.amazon.com/snowball-edge/), [Snowmobile](https://aws.amazon.com/snowmobile/) | [Data Box](https://azure.microsoft.com/services/storage/databox/) |        |        |



## 参考

1. [从AWS到阿里云： 产品体系差异分析](https://zhuanlan.zhihu.com/p/158035354)
2. [Compare storage on Azure and AWS](https://learn.microsoft.com/en-us/azure/architecture/aws-professional/storage) 
3. [阿里云系列课程](https://www.bilibili.com/video/BV1tD4y1977x?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036) *** 有ppt链接

