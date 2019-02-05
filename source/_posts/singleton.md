---
title: 单例模式总结
date: 2014-01-01 20:04:20
tags: Java基础
categories: 
  - Java基础
  - 单例
---

可以分成两类： 多线程安全和非多线程安全的单例

<!-- more -->

## 一. 多线程安全

1 . initialization-on-demand holder idiom(IODH)

// 用内部类的机制实现了延时加载和线程安全
```
public class Singleton {

    private Singleton() {
    };

    private static class SingletonHolder {
        private static final Singleton INSTANCE = new Singleton();
    }

    public static Singleton getInstance() {
        return SingletonHolder.INSTANCE;
    }
}
```

2. 通过枚举实现
```
public enum EnumSingleton implements Serializable {
       INSTANCE;
}
```

3. double check模式
```
public class Singleton {
    private volatile static Singleton singleton;

    private Singleton() {
    }

    public static Singleton getSingleton() {
        if (singleton == null) {
            synchronized (Singleton.class) {
                if (singleton == null) {
                    singleton = new Singleton();
                }
            }
        }
        return singleton;
    }
}
```

## 二. 非多线程安全

1. lazy load模式
```
public class Singleton {
    private static Singleton instance;
    private Singleton (){}

    public static Singleton getInstance() {
    if (instance == null) {
        instance = new Singleton();
    }
    return instance;
    }
}
```
2. 非lazy load模式
```
public class Singleton {
    private static Singleton instance = new Singleton();

    private Singleton() {
    }

    public static Singleton getInstance() {
        return instance;
    }
}
```

## 三. 应用

1. 系统中只有一个HttpClient单例，其他模块共享这个单例， 在高并发的情况下提高性能。

2. spring容器scope中的单例。

 





