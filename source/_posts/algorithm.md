---
title: 算法和数据结构
date: 2019-08-07 14:41:32
tags:
  - 算法
categories:
  - 基础
  - 算法
---

<p hidden></p>
<!-- more -->


{% asset_img  algorithm.jpg  算法和数据结构总结 %}

   
## 一. Master Thereom  主定律
{% asset_img  masterTheorem.JPG  图1.主定律在常用算法中的应用 %}

## 二. 数据结构操作 O(n)

{% asset_img  dataStructureOperation.JPG  图2.数据结构操作 %}

> #### 线性表: 
       Array, Stack, Queue, Singly-Linked List, Doubly-Linked List

> #### Skip List && Binary Search Tree: 
       + Average && Worst 相同
       + Redis的SortedSet用Skip List实现

> #### 二叉搜索树:
       + 左子树上所有结点的值均小于它的根结点的值； 
         右子树上所有结点的值均大于它的根结点的值； 
         它的左、右子树也分别为二叉搜索树。
       + 最差时间复杂度的二叉搜索树是O(n)，退化成链表;
         所以提出了平衡二叉搜索树， 最差时间复杂度是O(logn)。
         平衡二叉搜索树: Red-Black Tree, Splay Tree, AVL Tree

> #### B-tree:
       多路搜索树，并不是二叉的

## 三. 数组排序算法 O(n)
{% asset_img  arraySortAlg.JPG  图3.数组排序算法 %}

## 四 =  二 +  三
{% asset_img  big-o-cheat-sheet-poster.png  图4.BigO总结 %}

## 五. 堆实现 O(n)
{% asset_img  heap.JPG  图5.堆实现 %}

> #### 堆实现:
Binary， Binomial， Fibonacci， Strict Fibonacci（性能好，用的比较多）


## 参考:

1.  [算法大牛的git](https://github.com/julycoding/The-Art-Of-Programming-By-July)
2.  [每个程序员都应该收藏的算法复杂度速查表](http://www.codeceo.com/article/algorithm-complexity-table.html) good
3.  [从头到尾彻底解析Hash表算法](https://yq.aliyun.com/articles/38838)
4.  [big O](https://www.bigocheatsheet.com/) good
5.  [董的博客 - 算法之排序算法](http://dongxicheng.org/structure/sort/)   稳定排序，原地排序









