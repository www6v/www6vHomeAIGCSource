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
一. 链表
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
+ 链表中环的检测 ->  快指针是慢指针的两倍
+ 求链表的中间结点 -> 快指针是慢指针的两倍


二. 二叉树
1. 中序遍历   非递归算法
> 指南 P88
2. 公共祖先 
> 剑指 50题 ，指南 P153 
3. 二叉树的深度
> 剑指 39题
4. 二叉树的最大距离（即相距最远的两个叶子节点）。
5. 二叉树中和为某一值的路径
> 剑指 25题

三. 栈,队列
1. 两个栈实现一个队列
> 指南 P5
2. 包含min函数的栈
> 剑指 21题 , 指南 P1

四. 字符串
1.  一个字符串中， 要找到其中最长的字符串，并且没有重复字符。
2. 字符串转换为整数
3. 字符串中第一个只出现一次的字符，如何优化算法使得遍历次数更少
《剑指offer》 第35题目

五. 其他
1. 最小响应时间的算法
> 有的task 执行时间长，有的task 执行时间短， 如何设计一个负载均衡策略
2. 某一个id访问了系统多次，怎么做限流
3. 数组的两分搜索


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

