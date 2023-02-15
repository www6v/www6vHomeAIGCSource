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

## Command
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
$ terraform apply/destroy
```

## 参考
[terraform-practice](https://github.com/www6v/terraform-practice)
[Terraform 简介](https://github.com/www6v/terraform-practice/tree/master/iac)
[alicloud_ecs](https://github.com/www6v/terraform-practice/tree/master/alicloud_ecs)   example
[第一季：第 8 集  基础架构自动化编排工具 Terraform](https://www.bilibili.com/video/BV1HU4y1e7wZ/)

