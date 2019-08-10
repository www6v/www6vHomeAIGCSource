---
title: Tomcat classloader调研
date: 2014-10-28 18:46:39
tags:
  - Java基础
  - 调研
  - classloader
categories: 
  - Java基础
  - classloader   
---

## 一. 这次针对共享jar目录对tomcat classloader调研，大概有以下两种解决方案。
<!-- more -->

## 二. Tomcat6.x+ 向前兼容性 和 Delegate“开关”

Tomcat6.x+ 向前兼容性

原理：tomcat6.x+为了用户的使用简化了tomcat5.x的classloader模型，但用户也能通过修改配置中的server.loader和shared.loader重新启用5.x的加载器结构。

server.loader下的jar文件只能由tomcat访问， 对应用不可见。

shared.loader下的jar文件能被各个应用共享访问，对tomcat不可见。

配置：

catalina.properites中的server.loader和shared.loader， 配置为jar所在的目录

代码：

![图0](http://www6v.github.io/www6vHome/tomcatClassloader/tomcat%20classloader_clip_image002.jpg "图0")

Delegate“开关”

原理：tomcat6x+后默认Delegate为false，意味是打破java默认的双亲委派规则的。也就是说默认是child first的， 先加载webapp自身的jar文件。如果置Delegate=true,优先委派双亲加载（parent first）。

配置：

1. Defining a context（3中方式，两种方式略）

Inside a Host element in the main conf/server.xml.

2. Loader delegate="true" 

Loader - Configure the web application class loader that will be used to load servlet and bean classes for this web application. Normally, the default configuration of the class loader will be sufficient.
```
Eg. <context docBase="…"> <Loader delegate="true" /> … </context>
```
注意点：

1. Tomcat6.X 和Tomcat7. X，8. X的加载顺序有一点不同

源代码： WebappClassLoader.loadClass ?

1）7. X比6. X多并发load class的功能。

2) 7. X里 Bootstrap classLoader先加载class， 6. X里 System classLoader先加载class

![图1](http://www6v.github.io/www6vHome/tomcatClassloader/tomcat%20classloader_clip_image004.jpg "图1")

![图2](http://www6v.github.io/www6vHome/tomcatClassloader/tomcat%20classloader_clip_image006.jpg "图2")

Tomcat6.X

Delegate=false 的加载顺序
Bootstrap classes of your JVM
System class loader classes
/WEB-INF/classes of your web application
/WEB-INF/lib/*.jar of your web application
Common class loader classes


Delegate=true 的加载顺序
Bootstrap classes of your JVM
System class loader classes
Common class loader classes
/WEB-INF/classes of your web application
/WEB-INF/lib/*.jar of your web application


Tomcat7.X，8.X

Delegate=false 的加载顺序
Bootstrap classes of your JVM
/WEB-INF/classes of your web application
/WEB-INF/lib/*.jar of your web application
System class loader classes
Common class loader classes


Delegate=true 的加载顺序
Bootstrap classes of your JVM
System class loader classes (described above)
Common class loader classes (described above)
/WEB-INF/classes of your web application
/WEB-INF/lib/*.jar of your web application


2. packageTriggers变量

![图3](http://www6v.github.io/www6vHome/tomcatClassloader/tomcat%20classloader_clip_image008.jpg "图3")
![图4](http://www6v.github.io/www6vHome/tomcatClassloader/tomcat%20classloader_clip_image009.png "图4")
![图5](http://www6v.github.io/www6vHome/tomcatClassloader/tomcat%20classloader_clip_image011.jpg "图5")

packageTriggers，执行child first时，排除的package列表，如果匹配了package，即时为delegate=false，也会优先执行parent first策略。

但是这个变量没有作为tomcat配置项， 这个功能没有暴露出来。

 

## 三. WebappClassLoader加载指定目录的jar文件

每个应用可以加载指定目录的jar，虽然灵活，但是配置相对复杂，对应用的入侵性比较大，不推荐使用。 具体见参考文档。

总结： tomcat6x+ 向前兼容性 和 Delegate“开关”这种方式对应用的入侵性比较小，应用改动比较少。

 

附：验证 detector:

Delegate 没配置， shared 目录配置了
```

$jmap -permstat 5440 | grep live

$......

computing per loader stat ..done.

please wait.. computing liveness.............liveness analysis may be inaccurate ...

class_loader    classes bytes   parent_loader   alive?  type

<bootstrap>     2503    14928832          null          live    <internal>

0x00000007683850b0      0       0       0x0000000767ae9360      live    java/net/URLClassLoader@0x00000007621eb548

0x0000000767b3b2a8      578     4855184 0x0000000767ae9360      live    org/apache/catalina/loader/StandardClassLoader@0x0000000762315538

0x0000000767b7ab00      0       0       0x0000000767b3b2a8      live    org/apache/catalina/loader/StandardClassLoader@0x0000000762315538

0x0000000767ae93b0      77      466376    null          live    sun/misc/Launcher$ExtClassLoader@0x00000007621eb958

0x0000000767b7aa48      5712    34794416        0x0000000767b7ab00      live    org/apache/catalina/loader/WebappClassLoader@0x0000000762b712f8

0x0000000767ae9360      52      659816  0x0000000767ae93b0      live    sun/misc/Launcher$AppClassLoader@0x0000000762241680

0x00000007673df848      0       0       0x0000000767ae9360      live    java/util/ResourceBundle$RBClassLoader@0x0000000762498f90

total = 37      8951    55792808            N/A         alive=8, dead=29            N/A
```
 

![图6](http://www6v.github.io/www6vHome/tomcatClassloader/tomcatClassloader_clip_image002_0000.jpg "图6")


Delegate 配置了， shared 目录配置了
```
computing per loader stat ..done.

please wait.. computing liveness..............done.

class_loader    classes bytes   parent_loader   alive?  type

<bootstrap>     2482    14861184          null          live    <internal>

0x0000000768da77d8      77      466376    null          live    sun/misc/Launcher$ExtClassLoader@0x00000007621eb958 --

0x0000000768da7788      52      659816  0x0000000768da77d8      live    sun/misc/Launcher$AppClassLoader@0x0000000762241680 --

0x000000076892ffd0      0       0       0x0000000768da7788      live    java/util/ResourceBundle$RBClassLoader@0x0000000762498f90

0x0000000768da76e8      0       0       0x0000000768da7738      live    org/apache/catalina/loader/StandardClassLoader@0x0000000762315538 --

0x0000000768da7738      556     4709744 0x0000000768da7788      live    org/apache/catalina/loader/StandardClassLoader@0x0000000762315538 --

0x0000000768da7630      5200    31904816        0x0000000768da76e8      live    org/apache/catalina/loader/WebappClassLoader@0x00000007628c7588 --

total = 35      8395    52687048            N/A         alive=7, dead=28            N/A
```
 
![图7](http://www6v.github.io/www6vHome/tomcatClassloader/tomcatClassloader_clip_image004.jpg "图7")

## 参考： 
1. [The Loader Component](http://tomcat.apache.org/tomcat-6.0-doc/config/loader.html)
2. [The Context Container](http://tomcat.apache.org/tomcat-7.0-doc/config/context.html)
3. [主流web容器(jetty,tomcat,jboss)的classloader机制对比和相关问题分析](http://agapple.iteye.com/blog/826661)
4. [Tomcat源码分析之ClassLoader部分的设计详细分析 tomcat8.0](http://blog.csdn.net/fjslovejhl/article/details/21328347) 
5. [class卸载、热替换和Tomcat的热部署的分析](http://www.blogjava.net/heavensay/archive/2012/11/07/389685.html)  
6. [应用Tomcat的WebappClassLoader加载指定目录的jar文件](http://dncsoft.iteye.com/blog/336871)  
7. tomcat6.0和7.0的源代码

 
Btw： WatchedResource - The auto deployer will monitor the specified static resource of the web application for updates, and will reload the web application if it is updated. The content of this element must be a string.

 




