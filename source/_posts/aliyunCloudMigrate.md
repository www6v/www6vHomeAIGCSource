---
title: 阿里云-云迁移Migrate
date: 2021-06-27 21:58:28
tags:
  - 云计算
categories:
  - 云计算  
  - 阿里云
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
1. [阿里云云上常见架构设计及优化-课时1：迁移上云架构设计及解决方案](https://www.bilibili.com/video/BV15y4y1a7ds)
2. {% post_link 'dbMigrate' %} self
3. {% post_link 'kvm' %}  self  KVM动态迁移