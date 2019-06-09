---
title: 有用的Git命令
date: 2019-05-04 21:59:54
tags:
  - git
categories: 
  - DevOps 
---

1. git提交到远程分支
```
git add .
git commit -m  '相关注释文字'
git push origin master
```

2. 一个分支（master）代码同步到另一个分支（dev）
```
git stash 
git fetch origin master 
git rebase origin dev 
git stash pop
```

3. 新建分支
```
git checkout -b dev
```

## 参考:

1. [Git 分支 - 分支的新建与合并](https://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%9A%84%E6%96%B0%E5%BB%BA%E4%B8%8E%E5%90%88%E5%B9%B6)

