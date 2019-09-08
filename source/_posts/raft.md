---
title: raft协议
date: 2019-06-21 18:18:07
tags:
  - 分布式
  - 一致性
  - raft
categories: 
  - 分布式
  - 一致性    
  - raft
---

一. 总结
{% asset_img   raft.jpg  raft协议 %}

二. raft-分区脑裂

<div style="text-align: center;">
![raft-patition](https://user-images.githubusercontent.com/5608425/64484884-1c425480-d24b-11e9-92c1-865111cc016d.JPG)  
分区脑裂[非majority有uncommited log、 term1]

![raft-patition-1](https://user-images.githubusercontent.com/5608425/64484885-1c425480-d24b-11e9-8375-102d20506265.JPG)  
分区脑裂[majority可以同步log、 term2]
</div>

## 参考：

1. [raft](http://thesecretlivesofdata.com/raft/)
2. [Raft一致性算法论文译文](https://www.infoq.cn/article/raft-paper/)
3. [Raft对比ZAB协议](https://my.oschina.net/pingpangkuangmo/blog/782702)
4. [raft协议和zab协议有啥区别？](https://www.zhihu.com/question/28242561)


