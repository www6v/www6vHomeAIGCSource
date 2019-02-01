---
title: 服务慢响应排查
date: 2017-10-17 23:36:34
tags:
  - 分布式
  - 中间件
  - 服务化
  - 故障排查 
  - 内存
  - 网络
  - 性能
---

![服务慢响应排查](https://cloud.mail.126.com/dfs/service/slowRT.jpg?op=thumbFile&uid=www6v@126.com&account=www6v@126.com&file=eyJzIjoiZnM6Y2xvdWRzdG9yYWdlLm1haWwuMTI2OjM4MDAwMDYxMjAzIiwic2YiOiI0ODU2OTEyNzA0MTQ6MzgwMDAwNjEyMDMiLCJpIjo5MTg0MjIwNjI2ODg5MjY3LCJjcyI6eyJ0IjoxLCJ2IjoiMjBhNTk5MzQwNzQ0YzhmOTY0MmUzN2Y3ZjE0OWFmZDcifSwic3oiOjE2ODg4OSwiY3QiOjE1NDkwMTUxOTU3NjJ9&size=1500x1500 "服务慢响应排查")

## 参考:

1. 在你的代码之外，服务时延过长的三个追查方向(上) (下) 江南白衣
2. 《Release It!: Design and Deploy Production-Ready Software》 Michael Nygard
3. 关于TCP 半连接队列和全连接队列 阿里中间件博客