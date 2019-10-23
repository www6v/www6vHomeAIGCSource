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
<div style="text-align: center;">
![图1.主定律在常用算法中的应用](https://user-images.githubusercontent.com/5608425/64620811-25801c80-d417-11e9-88aa-182269f0bc02.JPG)
图1.主定律在常用算法中的应用
</div>

## 二. 数据结构操作 O(n)
<div style="text-align: center;">
![图2.数据结构操作](https://user-images.githubusercontent.com/5608425/64620788-1a2cf100-d417-11e9-82d3-7ca7864f6129.JPG)
图2.数据结构操作
</div>

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


**稳定排序**:有两个排序关键字的时候，稳定排序可以让第一个关键字排序的结果服务于第二个关键字排序中数值相等的那些数. [5][7]

## 四 =  二 +  三
<div style="text-align: center;">
![图4.BigO总结](https://user-images.githubusercontent.com/5608425/64620785-19945a80-d417-11e9-97bf-5af847bdbd5a.png)
图4.BigO总结
</div>

## 五. 堆实现 O(n)
<div style="text-align: center;">
![图5.堆实现](https://user-images.githubusercontent.com/5608425/64620806-244eef80-d417-11e9-9b17-39538ad19573.JPG)  
图5.堆实现
</div>

> #### 堆实现:
Binary， Binomial， Fibonacci， Strict Fibonacci（性能好，用的比较多）




## 参考:

1.  [算法大牛的git](https://github.com/julycoding/The-Art-Of-Programming-By-July)
2.  [每个程序员都应该收藏的算法复杂度速查表](http://www.codeceo.com/article/algorithm-complexity-table.html) good
3.  [从头到尾彻底解析Hash表算法](https://yq.aliyun.com/articles/38838)
4.  [big O](https://www.bigocheatsheet.com/) good
5.  [董的博客 - 算法之排序算法](http://dongxicheng.org/structure/sort/)   稳定排序，原地排序
6.  [Data Structure Visualizations](https://www.cs.usfca.edu/~galles/visualization/Algorithms.html)  good
7.  [五分钟小知识：为什么要分稳定排序和非稳定排序？](https://mp.weixin.qq.com/s/UuMzvp3hoqRx5j4slvpPUw)









