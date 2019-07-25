---
title: 有用的Git命令
date: 2019-05-04 21:59:54
tags:
  - git
categories: 
  - DevOps 
---

{% asset_img  gitOverview.png   git  %}
{% asset_img  gitOverview1.png   git  %}

### stage == index 

<!-- more -->

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
2. [Git 基础图解、分支图解、全面教程、常用命令](https://www.cnblogs.com/cheneasternsun/p/5952830.html)
3. [git使用小记---比较](https://www.jianshu.com/p/776916f74a41)
4. [一篇极好的Git 总结](https://www.liangzl.com/get-article-detail-31025.html)
5. [Git 删除具体某个提交commit的方法](https://www.jianshu.com/p/2fd2467c27bb)
6. [提交git,文件大于100M 限制的解决措施](https://blog.csdn.net/weixin_34198881/article/details/87037174)

