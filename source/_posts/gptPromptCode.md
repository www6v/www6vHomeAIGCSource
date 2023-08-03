---
title: chatgpt Prompt-Code
date: 2021-05-28 12:12:45
tags:
  - chatgpt
categories:
  - AI 
  - chatgpt
---

<p></p>
<!-- more -->



## 目录
<!-- toc -->


# 工具
+ Copilot ***
+ AWS CodeWhispter
+ Cursor ***
+ tabnine 免费

# 代码相关-简单任务 [1]

+ **注释**  
   你作为一名程序员，请解释一下下面这段代码
   
+ **防御性编程** 
   请为这段代码增加防御性编程的功能

+ 写单元测试 

+ **时间复杂度  time complexity**
   这段代码的时间复杂度是多少
   
+ 流程图 
   画出redis master和slave之间同步的流程图
   
+ Writing shell script

+ Writing git commands
  一个分支中的代码合并到另一个分支中
  
+ **Improve code**
  ``` Python
  How do i improve this code?
  fruits = ["apple", "banana", "cherry"]
  newlist = []

for x in fruits:
  if "a" in x:
    newlist.append(x)

print(newlist)
  ```
  
+ **Translating Code** 代码转换
  - Convert this Python code to Javascript    
  - 请把下面这段python代码转换成Java代码 
  

# 代码相关- 繁琐工作 [1]

+ Building API
  - I need an API built with express.js to return the list of products. Each product should have attributes like ID, title, description, price and imageUrl
  - modify the code and  retrieve the products from a MongoDB database
  - use TypeScript in this code
  - Generate this API using Python and FastAPI


+ **Generating Dummy Data**
  - Generate dummy data for a table called customers. Each customer should have an ID, first name, last name and city.
  - I don't need a Javascript. Just give the data.
  - Create a Python class for storing these objects.


+ **SQL**
  - write a SQL query to generate a table called products with these columns：
ID（int）
title（string）
category(int)
  - write a query to retrieve the top 5 customers in Shanghai
  - Revise this query and join the customers table with the orders table to find out how much each cumster has spent. Then pick the top 5 who have spent the most.

+ 正则  [2]

+ CronJob [2]

+ K8s


# 参考   
1. [【ChatGPT】面向程序员的ChatGPT使用教程38种方式来提升生产力](https://www.bilibili.com/video/BV1Z84y1G7nY/) V
2. [GitHub Copilot 实践课](https://time.geekbang.org/opencourse/videointro/100540901) 
   03, 04, 06
   [AICoder](https://github.com/www6v/AICoder) git
3. [ChatGPT 帮我跑了一个完整的 DevOps 流水线，离了个大谱...](https://cloud.tencent.com/developer/article/2207540)
   [Gin on K8s](https://github.com/www6v/AICoder/tree/master/Cursor/) git
100. [Top 20 ChatGPT Prompts For Software Developers](https://www.geeksforgeeks.org/chatgpt-prompts-for-software-developers/) 未


