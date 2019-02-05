---
title: Classloader相关的问题
date: 2014-09-06 14:22:17
tags: 
  - 故障
  - 问题排查
  - classloader
categories: 
  - 故障
  - classloader     
---

## 一. 背景

同一段代码在服务框架的服务端和客户端里重用, 客户端里classloader能load到资源文件, 但是服务端代码部署在tomcat容器里, classloader不能load到资源文件.

看来代码有个bug.直接上代码:

<!-- more -->

## 二.代码

1. 看到客户端里的classloader是AppClassLoader, 能load到classpath下的文件, 所以只要资源文件在classpath下就能load到.
 
![图一 客户端classloader](http://www6v.github.io/www6vHome/classloader/client%20appclassloder.PNG "图一 客户端classloader")

![图二 客户端 classloader打开流文件](http://www6v.github.io/www6vHome/classloader/client%20appclassloder1.PNG "图二 客户端 classloader打开流文件")

2. 在tomcat里跑，load当前类的是WebappClassloaer，所以this.getClass().getClassLoader()得到的也是 WebappClassloaer。

getSystemResouceAsStream()没有load到资源文件， 换成getResouceAsStream()后能load到。

![图三 clzloader没加载到文件, input是null](http://www6v.github.io/www6vHome/classloader/server%20WebappClassloader.PNG "图三 clzloader没加载到文件, input是null") 

![图四. clzloader在/WEB-INF/classse/下加载到了文件](http://www6v.github.io/www6vHome/classloader/server%20WebappClassloader1.PNG "图四. clzloader在/WEB-INF/classse/下加载到了文件")



