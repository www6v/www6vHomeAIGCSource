---
title: 云迁移 Migrate
date: 2021-06-27 21:58:28
tags:
  - 云计算
categories:
  - 云计算  
  - 云迁移
---

<p></p>
<!-- more -->

## Overview

{% asset_img process.png 迁云流程 %}

## 系统调研

{% asset_img survey.png 系统调研 %}

## 解决方案和选型

{% asset_img choose.png %}

{% asset_img solution.png  %}

{% asset_img details.png %}

## 迁移类型
+ 服务器迁移
  - VM环境
  - 物理机环境
  - 操作系统镜像
+ 存储迁移
  - 文件系统
  - 对象存储
  - 事务型
  - 归档
+ 数据库迁移
  - 离线
  - 在线
  - 异构/同构

## 服务器迁移 [1]
   + 云官方迁移工具
     - 快捷方便
     - 要公网
   + 镜像导入
     - 无需公网
     - 自定义配置
   + 镜像工具
     - 无需公网
     - 步骤简单
     - 模板配置复杂


## 数据库迁移 [2]
##### 注意事项
+ 对业务的影响
+ RTO/RPO
+ 数据库复杂程度
+ 应用程序调用复杂程度
+ 迁移的技能

##### 迁移工具
{% asset_img dbMigrate.png %}

## 参考
1. [课时1](https://www.bilibili.com/video/BV1tD4y1977x?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=f6e8c1128f9f264c5ab8d9411a644036)
2. [数据库迁移](../../../../2022/04/11/dbMigrate/) self
3. [KVM 虚拟机](../../../../2022/06/25/kvm/) self  KVM动态迁移