---
title: Socket总结
date: 2019-08-25 03:43:24
tags:
  - socket
categories: 
  - 分布式
  - 网络
  - socket
---

<p hidden></p>
<!-- more -->

##  一. TCP socket建立过程
```
int bind(int sockfd, const struct sockaddr *addr,socklen_t addrlen);           // server sockfd
int listen(int sockfd, int backlog);                                           // server sockfd
int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);             // int 返回的socket
int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen);       
```
> 监听的socket和真正用来传送数据的socket，是两个socket，一个叫作监听socket，一个叫作已连接socket。

<div style="text-align: center;">

![TCP socket建立过程](https://user-images.githubusercontent.com/5608425/63642036-00876c00-c6eb-11e9-8df2-a9063c81a640.jpg) TCP socket建立过程
![UDP socket建立过程](https://user-images.githubusercontent.com/5608425/63642037-00876c00-c6eb-11e9-9287-55a68ec11892.jpg) UDP socket建立过程
![总结](https://user-images.githubusercontent.com/5608425/63642038-01200280-c6eb-11e9-823e-20bb365f604f.jpg)  总结

</div>

## 参考：
1. [趣谈Linux操作系统 - 43-Socket通信：遇上特大项目，要学会和其他公司合作]()   刘超