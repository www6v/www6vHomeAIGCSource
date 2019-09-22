---
title: 有用的Git命令
date: 2019-05-04 21:59:54
tags:
  - git
categories: 
  - git 
---

<p hidden>有用的Git命令</p>

<!-- more -->

<div style="width:70%; height:70%; text-align: center;">

![git](https://user-images.githubusercontent.com/5608425/64622936-b4daff00-d41a-11e9-9587-6d72df96498d.png)   git
![git](https://user-images.githubusercontent.com/5608425/64622939-b4daff00-d41a-11e9-8978-8aea5e666237.png)  git

</div>

### stage == index 


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

4. 强制覆盖本地文件
```
git fetch --all
git reset --hard origin/master
git reset --hard origin/<branch_name>
```

## 参考:

1. [Git 分支 - 分支的新建与合并](https://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%9A%84%E6%96%B0%E5%BB%BA%E4%B8%8E%E5%90%88%E5%B9%B6)
2. [Git 基础图解、分支图解、全面教程、常用命令](https://www.cnblogs.com/cheneasternsun/p/5952830.html)
3. [git使用小记---比较](https://www.jianshu.com/p/776916f74a41)
4. [一篇极好的Git 总结](https://www.liangzl.com/get-article-detail-31025.html)
5. [Git 删除具体某个提交commit的方法](https://www.jianshu.com/p/2fd2467c27bb)
6. [“git pull”如何强制覆盖本地文件？](https://vimsky.com/article/3679.html)
7. [关于git提示“warning: LF will be replaced by CRLF”终极解答](https://www.jianshu.com/p/450cd21b36a4)


