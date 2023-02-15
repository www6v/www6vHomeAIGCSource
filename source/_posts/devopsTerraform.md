---
title: DevOps-Terraform
date: 2022-02-15 19:47:50
tags: 
  - devops
categories:
  - devops
  - Terraform
---

<p></p>
<!-- more -->

## Terraform[1]
##### Command[2]

``` shell
$ terraform init
$ terraform fmt
$ terraform validate
$ terraform plan  -out
$ terraform plan -detailed-exitcode
  echo $?
  0
  drift 
  0 no drift
  1 error
  2 success ## infra drift,可能有人变更了infra并apply成功
$ terraform apply/destroy -target
## 下面两条命令是相反的操作
$ terraform state rm ## 从状态文件中删除一个或多个对象
$ terraform import ## 已经存在的手动创建的资源对象导入Terraform，由terraform来控制
```

##### Module [3] [4]
+ 模块复用
  module 可以嵌套 module

## 参考

1. [Terraform 简介](https://github.com/www6v/terraform-practice/tree/master/iac)
2. [alicloud_ecs](https://github.com/www6v/terraform-practice/tree/master/alicloud_ecs)   example 
3. [terraform-module](https://github.com/www6v/terraform-practice/tree/master/invoke_module)
4. [aliyun提供的modules](https://github.com/terraform-alicloud-modules) 

+ [第一季：第 8 集  基础架构自动化编排工具 Terraform](https://www.bilibili.com/video/BV1HU4y1e7wZ/)
+ [terraform-practice](https://github.com/www6v/terraform-practice)

