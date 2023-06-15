---
title: DevOps-CI/CD
date: 2022-06-15 07:32:06
tags:
  - devops
categories:
  - devops   
  - CI/CD
---

<p></p>
<!-- more -->

### CI/CD pipeline
+ CI/CD
  - jenkins
  - github actions
+ GitOps  
  - argoCD


### jenkins 构建触发器 [1]
+ 定时构建
  类似cron，每日/每周构建
+ 添加gitlab的 webhook
  gitlab发生变更后触发构建
+ 轮询SCM
 
### 测试 [1]
+ 单元测试
+ 集成测试
+ 验收测试

### 最佳实践 [1]
+ **主干开发**
  CI中建议"主干开发"工作模式，这样才能真正做到持续集成
+ 构建失败
 **构建失败后立即修复**

## 参考
1. 《11  持续集成：软件持续集成，发布信手拈来》  lg2064-DevOps 落地笔记-拉钩专栏
100. [Argo CD 保姆级入门教程](https://cloud.tencent.com/developer/article/2153864)  云原生实验室 未
101. [大妈都能看懂的 GitOps 入门指南](https://cloud.tencent.com/developer/article/2153852)  云原生实验室 未