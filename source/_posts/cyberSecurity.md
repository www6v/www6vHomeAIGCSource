---
title: 网络空间安全-Cyber Security
date: 2022-10-23 21:51:12
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->

## 综述
[基于CiteSpace的国内外网络空间安全研究综述](https://www.doc88.com/p-69916034297662.html?r=1) ***

## Web安全
+ Web安全[6]
{% asset_img web-security.JPG  Web安全 %}

+ OWASP TOP 10[2]
  + 失效的访问控制
    - 提权-root
  + 加密失败
    - 弱随机数生成器
    - 忘记加“盐”
  + 注入  
    - SQL注入
    - 命令注入
    - XSS
  + 安全配置错误 

## linux安全[3]
{% asset_img linux-security.JPG   linux安全 %}

## 安全产品
+ 安全产品[7]
{% asset_img security-product.JPG  安全产品 %}  

+ 防火墙[5]
{% asset_img firewall.JPG  防火墙 %}

+ 入侵检测-IDS[4]
{% asset_img IDS.JPG  入侵检测-IDS %}

## 攻击模型
[网络攻击模型研究综述](https://www.doc88.com/p-38973089899040.html)
ATT&CK模型

## 攻击手段
+ DDos[1]
   + CC攻击
   + HTTP慢速攻击
+ MITM 中间人
+ 钓鱼
+ 勒索软件-木马
+ SQL注入攻击
+ DNS欺骗



## 参考:
1. [基于Web应用层的DDoS攻击模型研究](https://wenku.baidu.com/view/7f2c9810c8aedd3383c4bb4cf7ec4afe05a1b14c?fr=xueshu) *
2. 《Web 漏洞挖掘实战》  王昊天
3. 《13 | Linux系统安全：多人共用服务器，如何防止别人干“坏事”？》  何为舟
4. 《21 | IDS：当黑客绕过了防火墙，你该如何发现？》 何为舟
5. 《19 | 防火墙：如何和黑客“划清界限”？》 何为舟
6. 《模块串讲（一）丨Web安全：如何评估用户数据和资产数据面临的威胁？》 何为舟
7. 《模块串讲（三）丨安全防御工具：如何选择和规划公司的安全防御体系？》何为舟

