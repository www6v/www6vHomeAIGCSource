---
title: 有用的Git命令
date: 2019-05-04 21:59:54
tags:
  - git
categories: 
  - 命令  
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


