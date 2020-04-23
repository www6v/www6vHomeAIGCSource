---
title: Linux文件系统
date: 2019-08-24 11:48:15
tags:
  - linux
categories:
  - linux  
  - 文件系统 
---

<p hidden></p>
<!-- more -->

关键字: 虚拟文件系统,  pagecache, inode, 硬链接, 软链接

<div style="text-align: center;">

![Linux文件系统](https://user-images.githubusercontent.com/5608425/63632440-9fb74f80-c668-11e9-9b71-6538f4d86b9b.jpg)  Linux文件系统


![文件的数据结构](https://user-images.githubusercontent.com/5608425/63632442-a04fe600-c668-11e9-8e6a-368a26e1c83f.jpg)  文件的数据结构


![文件夹inode， 文件inode](https://user-images.githubusercontent.com/5608425/63632218-db501a80-c664-11e9-817a-847c9ff67c47.jpg)  文件夹inode， 文件inode

![硬链接， 软链接](https://user-images.githubusercontent.com/5608425/63632219-db501a80-c664-11e9-8fa6-8cc2a055ac97.jpg)   硬链接， 软链接


![读写中的buffer， cache](https://user-images.githubusercontent.com/5608425/63632527-2a4c7e80-c66a-11e9-9d41-c80e88d88318.jpg)   读写中的buffer,cache

![clipboard](https://user-images.githubusercontent.com/5608425/64937814-58e6ff00-d88e-11e9-9cb4-dbe52fa27264.png)
The Linux Storage Stack Diagram

</div>

## 参考：
1. [趣谈Linux操作系统 - 29-虚拟文件系统：文件多了就需要档案管理系统]()   刘超
2. [趣谈Linux操作系统 - 28-硬盘文件系统：如何最合理地组织档案库的文档]()   刘超
3. [趣谈Linux操作系统 - 30-文件缓存：常用文档应该放在触手可得的地方]()  刘超
4. [The Linux Storage Stack Diagram](https://www.thomas-krenn.com/de/wikiDE/images/e/e0/Linux-storage-stack-diagram_v4.10.png) mmap， directIO， Page Cache