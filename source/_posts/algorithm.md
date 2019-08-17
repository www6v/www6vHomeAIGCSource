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

## 一. 链表
1. 单链表的反转
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
> 参考2， 剑指 题16 

2. 合并两个有序链表

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
> 参考1

3. 快指针，慢指针
+ 删除链表倒数第n个结点 ->  快指针先于慢指针走若干步 
> 剑指 题15 
+ 链表中环的检测 ->  
  1. 硬解 
  2. 每走一步，把节点的地址存在set中，走下一步的时候查找地址是否已经在set中
  3. 快指针是慢指针的两倍， 最后快指针和慢指针相遇
+ 求链表的中间结点 -> 快指针是慢指针的两倍


## 二. 二叉树
1. 中序遍历   非递归算法
> 指南 P88
2. 公共祖先 
> 剑指 50题 ，指南 P153 
3. 二叉树的深度
> 剑指 39题
4. 二叉树的最大距离（即相距最远的两个叶子节点）。
5. 二叉树中和为某一值的路径
> 剑指 25题

## 三. 栈,队列
1. 两个栈实现一个队列
> 指南 P5
2. 包含min函数的栈
> 剑指 21题 , 指南 P1

## 四. 字符串
1.  一个字符串中， 要找到其中最长的字符串，并且没有重复字符。
2. 字符串转换为整数
3. 字符串中第一个只出现一次的字符，如何优化算法使得遍历次数更少
《剑指offer》 第35题目

## 五. 其他
1. 最小响应时间的算法
> 有的task 执行时间长，有的task 执行时间短， 如何设计一个负载均衡策略
2. 某一个id访问了系统多次，怎么做限流
   > 参考16 : leecode 239  Array + sliding window maximum
     解： 
        + 优先级队列 大顶堆  O(n * logk)
        +  queue deque  O(n*1)
3. 数组的两分搜索

## 六. Master Thereom  主定律
{% asset_img  masterTheorem.JPG  图1.主定律在常用算法中的应用 %}

## 七. 算法和数据结构总结

{% asset_img  dataStructureOperation.JPG  图2.数据结构操作 %}
{% asset_img  arraySortAlg.JPG  图3.数组排序算法 %}
{% asset_img  big-o-cheat-sheet-poster.png  图4.big O %}
{% asset_img  heap.JPG  图5.堆实现 %}



## 参考:
1. [【LeetCode题解】21_合并两个有序链表](https://www.cnblogs.com/xugenpeng/p/9850372.html)
2. [理解单链表的反转(java实现)](https://www.cnblogs.com/keeya/p/9218352.html)
3. [数据结构与算法之美 - 07链表（下）：如何轻松写出正确的链表代码？]() 王争
4. [面试精选：链表问题集锦](http://wuchong.me/blog/2014/03/25/interview-link-questions/) good
5. 《剑指 offer》
6. 《程序员代码面试指南》
7. [算法大牛的git](https://github.com/julycoding/The-Art-Of-Programming-By-July)
8. [LVS集群之十种调度算法及负载均衡——理论](http://blog.csdn.net/scape1989/article/details/21085659)
9. [每个程序员都应该收藏的算法复杂度速查表](http://www.codeceo.com/article/algorithm-complexity-table.html) good
10. [从头到尾彻底解析Hash表算法](https://yq.aliyun.com/articles/38838)
11. [算法面试通关40讲 - 03.如何计算算法的复杂度]()  覃超
12. [算法面试通关40讲 - 06.面试题：反转一个单链表&判断链表是否有环]()  覃超
13. [算法面试通关40讲 - 07.理论讲解：堆栈&队列]() 覃超
14. [big O](https://www.bigocheatsheet.com/) good
15. [算法面试通关40讲 - 10.理论讲解：优先队列]() 覃超
16. [算法面试通关40讲 - 12.面试题：返回滑动窗口中的最大值]() 覃超
