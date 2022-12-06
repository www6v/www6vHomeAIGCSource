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

## KMS [4]
+ KMS Key Types
  + Symmetric (AES-256 keys)
  + Asymmetric (RSA & ECC key pairs)

+ Types of KMS Keys
{%   asset_img   kms-keyType.JPG    Types of KMS Keys  %}

+ KMS Key Material Origin
  + KMS (AWS_KMS) – default
  + External (EXTERNAL)
    BYOK， 外部的key导入KMS
  + Custom Key Store (AWS_CLOUDHSM)
    用户自定义的Key Store  [感觉类似加密机，硬件加密]
  
  

## 参考
bilibili
1. [AWS 常见安全参考架构 (Level 200)](https://www.bilibili.com/video/BV1ka4y1v7ZN/)
2. 亚马逊云科技 安全架构连连看
3. [Security Automations for AWS WAF](https://aws.amazon.com/cn/solutions/implementations/security-automations-for-aws-waf/)
4. [SAP-2]  Security Section

