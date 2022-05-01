---
title: 服务慢响应超时排查
date: 2017-10-17 23:36:34
tags:
  - 服务化
  - 故障排查 
  - 性能
categories:
  - 分布式  
  - 服务治理  
  - 慢响应超时  
---

<p></p>
<!-- more -->

{% asset_img  slowRT.jpg  服务慢响应排查  %}


## 参考:

1.  [在你的代码之外，服务时延过长的三个追查方向(上) (下)](http://calvin1978.blogcn.com/?p=1661) 江南白衣
2. 《Release It!: Design and Deploy Production-Ready Software》 Michael Nygard
3. 关于TCP 半连接队列和全连接队列 阿里中间件博客
4. [下次遇到嚣张的候选人就先这么问：系统变慢了你怎么搞？](https://mp.weixin.qq.com/s/uUsGwEaK4bomtXfJnW1TTQ)
   fullgc， cpu，线程进入WAITING状态（压测）
5. [时延敏感业务低概率超时问题分析](https://yq.aliyun.com/articles/705634?spm=a2c6h.12873622.0.0.40826ec89ETaDy) 阿里月宾  good
   网络原因； 排查方式， 循环抓包； 观察是否有丢包重传
6. [记一次对网络抖动经典案例的分析](https://yq.aliyun.com/articles/697773) 阿里云-江冉 good
   根因： dentry在slab中的占用量高  解决方案：释放缓存