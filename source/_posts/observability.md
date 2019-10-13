---
title: 可观察性 链路追踪
date: 2019-08-31 11:54:42
tags:
---

<p hidden></p>
<!-- more -->

![metric-tracing-logging](https://user-images.githubusercontent.com/5608425/64059064-216a2880-cbe7-11e9-9ee7-141334d93959.png)


模式| 产品/框架
:-:|:-:|:-:
Log aggregation| AWS Cloud Watch
Application metrics| Prometheus、AWS Cloud Watch
Distributed tracing| Open Tracing ，Zipkin ，Jaeger，skywalking（无侵入）
Exception tracking| Open Tracing ，Zipkin ，Jaeger，skywalking（无侵入）


## 参考:
1. [Metrics, tracing 和 logging 的关系](https://wu-sheng.github.io/me/articles/metrics-tracing-and-logging)
2. [OpenTracing语义标准](https://github.com/opentracing-contrib/opentracing-specification-zh/blob/master/specification.md)
3. [观察之道：带你走进可观察性](https://mp.weixin.qq.com/s?__biz=MzIzNjUxMzk2NQ==&mid=2247489564&idx=1&sn=46d9103444bef97e89e897224a896268&chksm=e8d7e7dedfa06ec8d687c1292a1d82ff9e579430afafb9d003e18c13d4ec7e1682dbd4c642d9&scene=27#wechat_redirect)
4. [Dapper，大规模分布式系统的跟踪系统](http://bigbully.github.io/Dapper-translation/)  论文
5. [如何检测 Web 服务请求丢失问题](https://mp.weixin.qq.com/s/QA_BTF1D3GJJ7_nYQ6oAzQ) 应用： Nginx tracing + Tomcat tracing
6. [容器日志采集利器Log-Pilot](https://yq.aliyun.com/articles/674327)  阿里开源的Log-Pilot
7. [剖析 | SOFARPC 框架之 SOFARPC 链路追踪剖析](https://www.sofastack.tech/blog/sofa-rpc-link-tracking/) 未
8. [Pattern: Microservice Architecture](https://microservices.io/patterns/microservices.html)
9. [ 日志：每个软件工程师都应该知道的有关实时数据的统一概念](https://github.com/oldratlee/translations/blob/master/log-what-every-software-engineer-should-know-about-real-time-datas-unifying/README.md)  论文翻译 good 未