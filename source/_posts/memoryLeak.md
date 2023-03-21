---
title: 内存泄漏的案例和解决方案
date: 2014-02-02 10:26:27
tags: 
  - 内存
categories: 
  - Java基础
  - 内存
  - 内存泄漏 
---

<p></p>
<!-- more -->

如果一个可达对象的生命周期很长，它有一个生命周期较短的对象引用，此时就可能出现Java内存泄漏。也即是说， 造成内存泄漏的原因是对象虽然可达但不是活动的。


## 避免内存泄漏的三种方式

### 1. 软引用

对于缓存，如果没有合适的策略让老的缓存项目到期就可能遇到内存泄漏。

我们希望缓存能用上所有的可用内存，只是在需要额外资源的时候才释放资源。 通过软可达可以实现资源的释放。

释放软可达对象的规则：

I. gc抛出OOM异常之前要尝试释放软引用

II. gc以LRU的顺序释放软引用

举例：

Google LoadingCache中的CacheBuilder.softValues()


### 2. 弱引用

弱引用可以用于协助垃圾回收， 这是通用的解决方案。

举例： threadLocal

![threadLocal](http://www6v.github.io/www6vHome/memoryLeak/threadLocal.jpg "threadLocal")

每个线程中有一个Map, 这个Map的类型是ThreadLocal.ThreadLocalMap. Map中的key为一个threadlocal实例. 这个Map的key使用了弱引用。 每个key都弱引用指向threadlocal. 当把threadlocal实例置为null以后,没有任何强引用指向threadlocal实例,所以threadlocal将会被gc回收.

ps: value却不能回收,因为存在一条从current thread连接过来的强引用. 只有当前thread结束以后, current thread就不会存在栈中,强引用断开, Current Thread, Map, value将全部被GC回收. 如果使用线程池，线程的强引用会长时间的存在，为了防止内存泄漏，最好的做法是将调用threadlocal的remove方法。

### 3. 打开(增加)和关闭（删除）方法成对出现

资源申请和回收不成对会使资源没释放，造成内存泄漏。

举例：

I. 在finally块中关闭打开的资源和异常处理。

II. 使用try-with-resources语句（Java SE7新特性）

```
      try (BufferedReader br = new BufferedReader(new FileReader(path))) {
        return br.readLine();
      }
```

## 内存泄漏案例

1. <<实战Java虚拟机——JVM故障诊断与性能优化>> 
7.2.2节中有关JDK6.0里String.substring()可能引发的内存泄漏

2. << Effective.Java.中文版 - 第二版>> - 第六条 消除过期的对象引用
如果一个类自己管理内存，程序员就要警惕内存泄漏问题。

3. 大量static字段引起的内存泄漏

4. 不正确的equals()和hashCode()实现

5. 常量字符串造成的内存泄漏

## 参考

1 . 了解Java中的内存泄漏 作者:baeldung 译者:thornhill

 

 

 