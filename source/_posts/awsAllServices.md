---
title: AWS 所有的Services
date: 2022-10-01 10:23:40
tags:
  - 云计算
categories:
  - 云计算  
  - AWS
---

<p></p>
<!-- more -->


## 计算 (9)*
+ EC2 @
+ Lightsail @
  Amazon Lightsail 以经济实惠的月度价格提供易于使用的虚拟专用服务器 (VPS) 实例、容器、存储、数据库等。
  Lightsail 是由 AWS 推出的面向开发人员、小型企业、学生等人员的轻量级 VPS 云计算服务。(非官方)
+ Lambda @
+ Batch @
  AWS Batch enables you to easily and efficiently run batch computing workloads of any scale on AWS using Amazon EC2 and Amazon EC2 Spot.
+ Elastic Beanstalk @
  Amazon Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS. 
+ Serverless Application Repository
+ AWS Outposts @
  AWS Outposts brings native AWS services, infrastructure, and operating models to virtually any data center, co-location space, or on-premises facility.
+ EC2 Image Builder
+ AWS App Runner
++
+ Elastic Load Balancing @
+ AWS Fargate @
  AWS Fargate 是一种无服务器、随用随付的计算引擎，可让您专注于构建应用程序，而无需管理服务器。AWS Fargate 与 Amazon Elastic Container Service (ECS) 和 Amazon Elastic Kubernetes Service (EKS) 兼容。


## 容器 (4) *
+ Elastic Container Registry @ ecr
+ Elastic Container Service  @ ECS
  Amazon ECS is a fully managed container orchestration service that helps you easily deploy, manage, and scale containerized applications. It deeply integrates with the rest of the AWS platform to provide a secure and easy-to-use solution for running container workloads in the cloud and now on your infrastructure with Amazon ECS Anywhere. 
+ Elastic Kubernetes Service @ EKS
  Amazon EKS is a managed service that makes it easy for you to use Kubernetes on AWS without needing to install and operate your own Kubernetes control plane.
+ Red Hat OpenShift Service on AWS


## 存储 (7) *
+ S3 @
+ EFS @ [Elasic File System]
  Simple, serverless, set-and-forget, elastic file system
+ FSx @
  Launch, run, and scale feature-rich and highly-performant file systems with just a few clicks
+ S3 Glacier @
  Long-term, secure, durable storage classes for data archiving at the lowest cost and milliseconds access
+ Storage Gateway @
  Provide on-premises applications with access to virtually unlimited cloud storage
+ AWS Backup @
  Centrally manage and automate data protection
+ AWS Elastic Disaster Recovery
++
+ Amazon Elastic Block Store (Amazon EBS） @
  Easy to use, high performance block storage at any scale


## 数据库 (9) *
+ RDS @
+ ElastiCache @
  Unlock microsecond latency and scale with in-memory caching 
  [Free]
+ Neptune @
  Amazon Neptune is a fast, reliable, fully-managed graph database service that makes it easy to build and run applications that work with highly connected datasets.
+ Amazon QLDB
+ Amazon DocumentDB *
  Scale JSON workloads with ease using a fully managed document database service
  (with MongoDB compatibility)
  [Free]
+ Amazon Keyspaces
+ Amazon Timestream
+ DynamoDB @
  Fast, flexible NoSQL database service for single-digit millisecond performance at any scale
  [Free]  
+ Amazon MemoryDB for Redis
+ ++
+ Amazon Aurora @ 
  Designed for unparalleled high performance and availability at global scale with full MySQL and PostgreSQL compatibility
  Amazon Aurora provides built-in security, continuous backups, serverless compute, up to 15 read replicas, automated multi-Region replication, and integrations with other AWS services. 


## 迁移与传输 (8)*
+ AWS Migration Hub   @
  Discover the tools that you need to simplify your migration and modernization
  AWS Migration Hub provides a central location to collect server and application inventory data for the assessment, planning, and tracking of migrations to AWS. Migration Hub can also help accelerate application modernization following migration.
+ AWS Application Migration Service
+ Application Discovery Service
+ Database Migration Service  @ dms
  Homogeneous Database Migrations
  Heterogeneous Database Migrations
+ AWS Transfer Family  @
  AWS Transfer Family securely scales your recurring business-to-business file transfers to AWS Storage services using SFTP, FTPS, FTP, and AS2 protocols. 
+ AWS Snow Family
+ DataSync   @
  Simplify and accelerate secure data migrations
+ AWS Mainframe Modernization
++ 
+ AWS Server Migration Service (AWS SMS) @
  Migrate your on-premises workloads to AWS 
+ AWS Snowball  @
  专为边缘计算和数据迁移构建
  使用 AWS Snowball，你需要到 AWS 管理控制台申请，AWS 会邮寄一个物理 Snowball 给你，然后你需要通过以太网和客户端软件把数据从本地传输到 Snowball上，最后将 Snowball 邮寄给 AWS 即可。AWS 会负责将 Snowball 内的数据导入到你所需要的 S3 存储桶上。

## 联网和内容分发 (10) *
+ VPC  @
+ CloudFront @
+ Route 53 @
+ API Gateway  @
+ Direct Connect @
+ AWS App Mesh *
+ AWS Cloud Map
+ Global Accelerator @
  [使用 AWS Global Accelerator 加速你的服务](https://kebingzao.com/2020/08/13/aws-ga/)
+ Amazon VPC IP Address Manager
+ AWS Private 5G
++ 
+ AWS Transit Gateway @


## 开发人员工具(10)
+ CodeStar
+ CodeCommit @
+ CodeArtifact
+ CodeBuild  @
+ CodeDeploy @
+ CodePipeline @
+ Cloud9   @
+ CloudShell *
+ X-Ray  **
+ AWS FIS

----

## 管理与监管 (24)*
+ AWS Organizations @
+ CloudWatch @
+ AWS Auto Scaling @
+ CloudFormation @
+ Config  @
+ OpsWorks
+ Service Catalog @
+ Systems Manager @
+ AWS AppConfig
+ Trusted Advisor @
+ Control Tower  @
+ AWS License Manager @
+ AWS Well-Architected Tool @
+ AWS Health Dashboard
+ AWS Chatbot
+ Launch Wizard
+ AWS Compute Optimizer @
+ Resource Groups & Tag Editor
+ Amazon Grafana
+ Amazon Prometheus
+ AWS Proton
+ AWS Resilience Hub
+ Incident Manager
+ CloudTrail @


## 媒体服务
Kinesis Video Streams
MediaConnect
MediaConvert
MediaLive
MediaPackage
MediaStore
MediaTailor
Elemental Appliances & Software
Amazon Interactive Video Service
Elastic Transcoder  @
Nimble Studio


## 分析 (14) *
+ Athena  @
+ Amazon Redshift @
+ EMR @
+ CloudSearch
+ Amazon OpenSearch Service @
+ Kinesis @
+ QuickSight @
+ Data Pipeline
+ AWS Data Exchange
+ AWS Glue @
+ AWS Lake Formation
+ MSK
+ AWS Glue DataBrew **
+ Amazon FinSpace


--------


## 安全性、身份与合规性 (20)*
+ IAM @
+ Resource Access Manager @
+ Cognito  @
+ Secrets Manager  @
+ GuardDuty  @
+ Inspector  @
+ Amazon Macie  @
+ IAM Identity Center（前身为 AWS Single Sign-On） @
+ Certificate Manager @ acm
+ Key Management Service @ kms
+ CloudHSM
+ Directory Service  @
+ WAF & Shield @
+ AWS Firewall Manager
+ Artifact  @
+ Security Hub  @
+ Detective
+ AWS Signer
+ AWS Network Firewall
+ AWS Audit Manager


## AWS 成本管理 (5)*
+ AWS Cost Explorer @
+ AWS Budgets @
+ AWS Marketplace Subscriptions
+ AWS Application Cost Profiler
+ AWS Billing Conductor


## 移动 (4)
AWS Amplify
AWS AppSync  @
Device Farm
Amazon Location Service


## 应用程序集成 (8)*
+ Step Functions @
+ Amazon AppFlow
+ Amazon EventBridge @
+ Amazon MQ  @
+ Simple Notification Service @
+ Simple Queue Service  @
+ SWF
+ 托管 Apache Airflow


## 业务应用程序(8)
+ Amazon Connect
+ Amazon Pinpoint
+ Amazon Honeycode
+ Amazon Chime
+ Amazon Simple Email Service @
+ Amazon WorkDocs
+ Amazon WorkMail
+ Alexa for Business @


## 最终用户计算(3)
+ WorkSpaces   @
+ AppStream 2.0  @
+ WorkSpaces Web


## Blockchain (1)
+ Amazon Managed Blockchain @

## 参考
[AWS所有服务](https://us-east-1.console.aws.amazon.com/console/services?region=us-east-1)




