---
title: 伪共享 FalseSharing
date: 2014-03-05 11:14:20
tags: Java基础
categories: 
  - Java基础
  - 内存
  - 伪共享 
---

<p></p>
<!-- more -->

## 一. 概念
<div style="text-align: center;">

![FalseSharing](https://user-images.githubusercontent.com/5608425/64919353-6c399200-d7dc-11e9-8506-50583042d91a.png)
伪共享 FalseSharing
</div>

## 二. 应用

1. jdk8 LongAdder的Cell类

2. Disruptor


## 三. 伪共享测试代码
```
package test;

/*
-- 有cache line padding 测试结果
1. duration = 22344563916  
2. duration = 22012580114  
3. duration = 11167549431  
4. duration = 19736854183  

avg: 18815386911

-- 没有cache line padding 测试结果
1. duration = 23658423881  
2. duration = 33335707670  
3. duration = 35890190024  
4. duration = 29516958769  
5. duration = 35027213671

avg:  31485698803

result： 性能相差一倍左右  
*/
public final class FalseSharing
    implements Runnable
{
    public final static int NUM_THREADS = 4; // change
    public final static long ITERATIONS = 500L * 1000L * 1000L;
    private final int arrayIndex;
 
    private static VolatileLong[] longs = new VolatileLong[NUM_THREADS];
    static
    {
        for (int i = 0; i < longs.length; i++)
        {
            longs[i] = new VolatileLong();
        }
    }
 
    public FalseSharing(final int arrayIndex)
    {
        this.arrayIndex = arrayIndex;
    }
 
    public static void main(final String[] args) throws Exception
    {
        final long start = System.nanoTime();
        runTest();
        System.out.println("duration = " + (System.nanoTime() - start));
    }
 
    private static void runTest() throws InterruptedException
    {
        Thread[] threads = new Thread[NUM_THREADS];
 
        for (int i = 0; i < threads.length; i++)
        {
            threads[i] = new Thread(new FalseSharing(i));
        }
 
        for (Thread t : threads)
        {
            t.start();
        }
 
        for (Thread t : threads)
        {
            t.join();
        }
    }
 
    public void run()
    {
        long i = ITERATIONS + 1;
        while (0 != --i)
        {
            longs[arrayIndex].value = i;
        }
    }
 
    public final static class VolatileLong
    {
        public volatile long value = 0L;
        //public long p1, p2, p3, p4, p5, p6;   comment out 
    }
}
```

测试环境： 笔记本电脑 -- Intel（R）Core(TM) i3-3120M CPU @2.50GHz 2.50GHz 内存 10.0GB

## 参考：

1. [LongAdder类学习小结](https://yq.aliyun.com/articles/68190?spm=5176.8067842.tagmain.150.yoI2AF)

2. [剖析Disruptor:为什么会这么快？（二）神奇的缓存行填充](http://ifeve.com/disruptor-cacheline-padding/)

