---
title: AWS Security
date: 2022-10-01 05:58:45
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->

## Landing Zone[1]
+ Control Tower

## WAF(Web Application Firewall) [1][3]
+ 计费方式
+ 部署方式
  + 传统WAF 
    部署在ELB之后，部署在EC2之上
  + AWS WAF
    部署在CloudFront之上
    
{% asset_img waf-security-automations-architecture.png  Security Automations for AWS WAF %}    
    
## Firewall Manager[1]
以规模化方式管理AWS WAF规则

## KMS [1][todo]

## 参考
bilibili
1. [AWS 常见安全参考架构 (Level 200)](https://www.bilibili.com/video/BV1ka4y1v7ZN/)
2. 亚马逊云科技 安全架构连连看
 
3. [Security Automations for AWS WAF](https://aws.amazon.com/cn/solutions/implementations/security-automations-for-aws-waf/)


