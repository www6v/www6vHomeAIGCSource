---
title: 算法和数据结构 - 题目
date: 2019-08-25 22:32:31
tags:
  - 算法
categories:
  - 基础
  - 算法
---

<p hidden></p>
<!-- more -->
 

## 一. 线性表 

## 数组
####  Top K问题 : 数组中最小的 k 个数    
方法一： 堆， 时间复杂度 O(n log k)
方法二： 快排变形， （平均）时间复杂度 O(n)

[数组中最小的 k 个数：Top K 问题的两种经典解法](https://mp.weixin.qq.com/s/rSr-dttis3Ubtbv892aOtg)  

####  数组的两分搜索
   > [LeetCode 540. Single Element in a Sorted Array](https://github.com/grandyang/leetcode/issues/540) [中等]

## 链表
####  单链表的反转 [简单]
+  使用3个指针遍历单链表，逐个链接点进行反转。 复杂
+  从第2个节点到第N个节点，依次逐节点插入到第1个节点(head节点)之后，最后将第一个节点挪到新表的表尾。 容易理解

```
public static Node reverseList(Node node) {
  Node pre = null;
  Node next = null;
  while (node != null) {
      next = node.next;
      node.next = pre;
      pre = node;
      node = next;
  }
  return pre;
}
```
> 剑指 题16 
> [理解单链表的反转(java实现)](https://www.cnblogs.com/keeya/p/9218352.html) 
[LeetCode206：反转链表](https://github.com/MisterBooo/LeetCodeAnimation/blob/master/notes/LeetCode%E7%AC%AC206%E5%8F%B7%E9%97%AE%E9%A2%98%EF%BC%9A%E5%8F%8D%E8%BD%AC%E9%93%BE%E8%A1%A8.md)

####  合并两个有序链表 [简单]

```
public class ListNode {
      int val;
      ListNode next;
      ListNode(int x) { val = x; }
}

class Solution {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode dummyHead = new ListNode(0);
        ListNode lastNode = dummyHead;
        while (l1 != null && l2 != null) {
            if (l1.val < l2.val) {
                lastNode.next = l1;
                l1 = l1.next;
            } else {
                lastNode.next = l2;
                l2 = l2.next;
            }
            
            lastNode = lastNode.next;
        }
        lastNode.next = l1 != null ? l1 : l2;
        return dummyHead.next;
    }
}
```
> [LeetCode题解21_合并两个有序链表](https://www.cnblogs.com/xugenpeng/p/9850372.html)
  [LeetCode21:合并两个有序链表](https://github.com/MisterBooo/LeetCodeAnimation/blob/master/notes/LeetCode%E7%AC%AC21%E5%8F%B7%E9%97%AE%E9%A2%98%EF%BC%9A%E5%90%88%E5%B9%B6%E4%B8%A4%E4%B8%AA%E6%9C%89%E5%BA%8F%E9%93%BE%E8%A1%A8.md)

####  快指针，慢指针
+ 删除链表倒数第n个结点 ->  快指针先于慢指针走若干步 
> 剑指 题15 
+ 链表中环的检测 
  1. 硬解 
  2. 每走一步，把节点的地址存在set中，走下一步的时候查找地址是否已经在set中
  3. 快指针是慢指针的两倍， 最后快指针和慢指针相遇
+ 求链表的中间结点 -> 快指针是慢指针的两倍
[LeetCode 例题精讲 | 05 双指针×链表问题：快慢指针](https://mp.weixin.qq.com/s/Jdbr_-UACicLU_Akn4czSw)


####  在O(1)时间删除链表结点
> 剑指Offer

+ 最常规的做法是从链表的头结点开始，顺序遍历查找要删除的结点，并在链表中删除该结点。
这种思路由于需要顺序查找，时间复杂度自然就是O(n)。
+ 然而，可以把下一个结点的内容复制到需要删除的结点上覆盖原有的内容，再把下一个结点删除，
就相当于把当前需要删除的结点删除了，这样的时间复杂度是O（1）。
  

##  栈,队列
####  两个栈实现一个队列
> 指南 P5， 剑指 7题
> leetcode 232

####  包含min函数的栈
> 剑指 21题 , 指南 P1


## 二. HashTable 哈希表
####  两数之和
> Leetcode 1  a + b = 9
  a; b= 9 -a => Set(查询) ; 
  O(n)

####  三数之和
> Leetcode 15
   a, b  -> 2 loop;
   c = -(a+b) -> Set(查询);
   O(n^2)

## 三. 二叉树
####  中序遍历   非递归算法
> 指南 P88
> [LeetCode 94：二叉树的中序遍历](https://github.com/MisterBooo/LeetCodeAnimation/blob/master/notes/LeetCode%E7%AC%AC94%E5%8F%B7%E9%97%AE%E9%A2%98%EF%BC%9A%E4%BA%8C%E5%8F%89%E6%A0%91%E7%9A%84%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86.md)

####  公共祖先 
> 剑指 50题 ，指南 P153 
> 参考17 LeetCode 235,236. 递归，非递归

####  二叉树的深度
> 剑指 39题 P207， 递归的方法

####  二叉树的最大距离（即相距最远的两个叶子节点）。

####  二叉树中和为某一值的路径
> 剑指 25题
> LeetCode 112: 路径总和. 用栈来存路径

####  LeetCode 102  二叉树的层序遍历
> 参考 19
 [LeetCode 102](https://github.com/grandyang/leetcode/issues/102)
 [LeetCode102](https://github.com/MisterBooo/LeetCodeAnimation/blob/master/notes/LeetCode%E7%AC%AC102%E5%8F%B7%E9%97%AE%E9%A2%98%EF%BC%9A%E4%BA%8C%E5%8F%89%E6%A0%91%E7%9A%84%E5%B1%82%E5%BA%8F%E9%81%8D%E5%8E%86.md)
 解1： BFS  队列辅助 
 解2： DFS 

####  LeetCode 104 二叉树的最小/最大深度
> [LeetCode 104](https://github.com/grandyang/leetcode/issues/104)  
   BFS： 第一个达到的叶子节点是最小深度， 最后一个达到的叶子节点是最大深度。
   DFS递归。

## 四. 字符串
####   一个字符串中， 要找到其中最长的字符串，并且没有重复字符。
> [Leetcode 3](https://github.com/MisterBooo/LeetCodeAnimation/blob/master/notes/LeetCode%E7%AC%AC3%E5%8F%B7%E9%97%AE%E9%A2%98%EF%BC%9A%E6%97%A0%E9%87%8D%E5%A4%8D%E5%AD%97%E7%AC%A6%E7%9A%84%E6%9C%80%E9%95%BF%E5%AD%90%E4%B8%B2.md)
  [LeetCode 3](https://github.com/grandyang/leetcode/issues/3)

####  字符串转换为整数
> 剑指 50题
> [leetcode 8](https://blog.csdn.net/u010651249/article/details/85709554)
> [leetcode 8](https://github.com/grandyang/leetcode/issues/8)

####  字符串中第一个只出现一次的字符，如何优化算法使得遍历次数更少
> 剑指 35题

####  KMP子串查找算法


## 五. 其他
####  最小响应时间的算法
> 有的task 执行时间长，有的task 执行时间短， 如何设计一个负载均衡策略

  + [QPS比Nginx提升60%，阿里Tengine负载均衡算法揭秘](https://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=2651017589&idx=2&sn=32a472b8e805666b197505f1acc9af83&chksm=bdbea9268ac92030342933d37ecb1b9754b5d1d6e5a2935c331098669b3f4a44909e628532dd&scene=27#wechat_redirect) 
  + [超级负载均衡](https://blog.csdn.net/iteye_14001/article/details/82098361)  来源于以前百度的blog 
  + [极客时间 - 程序员的数据基础课 19,20,21]  基于概率  响应时间短的概率越大， 响应时间是正态分布的
  + [nginx fair负载均衡算法](https://github.com/gnosek/nginx-upstream-fair)  按后端服务器的响应时间来分配请求，响应时间短的优先分配。 

####  某一个id访问了系统多次，怎么做限流
   > 参考12 : leecode 239  Array + sliding window maximum
     解： 
       + 优先级队列 大顶堆  O(n * logk)
       + queue deque  O(n*1)


####  递归模板  recursion
{% asset_img  recursion.jpg  递归模板 %}

####  求众数
>  [LeetCode第169号问题：求众数](https://github.com/MisterBooo/LeetCodeAnimation/blob/master/notes/LeetCode%E7%AC%AC169%E5%8F%B7%E9%97%AE%E9%A2%98%EF%BC%9A%E6%B1%82%E4%BC%97%E6%95%B0.md)
   [LeetCode 169. Majority Element](https://github.com/grandyang/leetcode/issues/169)
   剑指 29题， 参考18
   解1： map O(N) 
   解2：sort O（n logn）
   解3: 摩尔投票法  特殊高效算法

####  LRU cache
   参考20  双向链表实现
   [Redis内存淘汰机制](https://my.oschina.net/andylucc/blog/741965)  allkeys-lru
   [Cache replacement policies](https://en.wikipedia.org/wiki/Cache_replacement_policies)
   [简单LRU算法实现缓存](http://dennis-zane.iteye.com/blog/128278)


####  布隆过滤器
> +有误判率
  +难以删除 
  应用： [Guava  Bloomfilter](https://github.com/google/guava/blob/master/guava/src/com/google/common/hash/BloomFilter.java)
       Mapredue bloomfilter
       [Google Guava之BloomFilter源码分析及基于Redis的重构](http://www.fullstackyang.com/bu-long-guo-lu-qi-google-guavalei-ku-yuan-ma-fen-xi-ji-ji-yu-redis-bitmapsde-zhong-gou/)

####  如何在海量数据中判断某个数据是否存在
> 布隆过滤器


## 六. 线性规划
[背包问题研究与应用](http://dongxicheng.org/structure/knapsack-problems/)
[算法面试通关40讲  - 动态规划]()  覃超

## 参考:

3.  [数据结构与算法之美 - 07链表（下）：如何轻松写出正确的链表代码？]() 王争
4. [面试精选：链表问题集锦](http://wuchong.me/blog/2014/03/25/interview-link-questions/) good
5. 《剑指 offer》
6. 《程序员代码面试指南》
7.  [LVS集群之十种调度算法及负载均衡——理论](http://blog.csdn.net/scape1989/article/details/21085659)
---
     算法面试通关40讲  覃超
8.  [03.如何计算算法的复杂度]()  
9.  [06.面试题：反转一个单链表&判断链表是否有环]()  
10.  [07.理论讲解：堆栈&队列]() 
11.  [10.理论讲解：优先队列]() 
12.  [12.面试题：返回滑动窗口中的最大值]() 

---
     算法面试通关40讲  覃超
17.  [19.面试题：二叉树&二叉搜索树的最近公共祖先]() 
18.  [23.面试题：求众数]()  
19.  [28.面试题：二叉树层次遍历]() 
20.  [55.理论讲解： LRU Cache]() LRU， LFU
