---
title: 安全-OAuth2
date: 2020-03-20 17:28:48
tags:
  - OAuth2
categories: 
  - 安全
  - OAuth2
---

<p></p>
<!-- more -->


# OAuth 2.0  授权类型 [1]

+ [Authorization Code](https://oauth.net/2/grant-types/authorization-code/) 授权码 ***

+ [Client Credentials](https://oauth.net/2/grant-types/client-credentials/)

  The Client Credentials grant is used when applications request an access token to access their own resources, **not on behalf of a user**.

+ [Refresh Token](https://oauth.net/2/grant-types/refresh-token/)  *** 
  动态token
  
+ Legacy: [Password Grant](https://oauth.net/2/grant-types/password/)

# 基于OAuth 2.0的微服务参考架构 [3]

{%   asset_img   microservice-oauth2.jpg  基于OAuth 2.0的微服务参考架构 %}
+ 网关
令牌的校验和转换，将前端传递过来的 OAuth 2.0 访问令牌，通过调用 IDP 进
行校验，并转换为包含用户和权限信息的 JWT 令牌，再将 JWT 令牌向后台微服务传
递。
+ IDP 服务
IDP 是 Identity Provider 的简称，主要负责 OAuth 2.0 授权协议处理，OAuth 2.0 和
JWT 令牌颁发和管理，以及用户认证等功能。IDP 使用后台的 Login-Service 进行用户认
证。
选型:   Spring Security OAuth  or KeyCloak(RedHat)

# OIDC [2]
OIDC 是 OpenID Connect 的简称，OIDC=(Identity, Authentication) + OAuth 2.0。它在 OAuth2 上构建了一个身份层，是一个基于 OAuth2 协议的身份认证标准协议。OAuth2 是一个授权协议，它无法提供完善的身份认证功能，OIDC 使用 OAuth2 的授权服务器来为第三方客户端提供用户的身份认证，并把对应的身份认证信息传递给客户端.

OAuth2 提供了**Access Token**来解决授权第三方客户端访问受保护资源的问题；OIDC 在这个基础上提供了**ID Token** 来解决第三方客户端标识用户身份认证的问题。


{% details  OIDC 式例 %}
+ 请求示例：
  POST /auth/realms/ccm/protocol/openid-connect/token HTTP/1.1
  Host: server.example.com
  Content-Type: application/x-www-form-urlencoded
  Authorization: Basic d2ViX2FwcDp3ZWJfYXBw

  grant_type=**authorization_code**&code=7138b4b3-8c2b-4016-ad98-01c4938750c6.c110ddc8-c6c1-4a95-bd9e-cd8d84b4dd70.1eabef67-6473-4ba8-b07c-14bdbae4aaed&redirect_uri=https%3A%2F%2Fclient.example.org%2Fcb

+ 响应示例：
 HTTP/1.1 200 OK
  Content-Type: application/json
  Cache-Control: no-store
  Pragma: no-cache

  {
   **"access_token"**: "SlAV32hkKG",
   "token_type": "Bearer",
   "refresh_token": "8xLOxBtZp8",
   "expires_in": 3600,
   **"id_token"**: "eyJhbGciOiJSUzI1NiIsImtpZCI6IjFlOWdkazcifQ.ewogImlzc
     yI6ICJodHRwOi8vc2VydmVyLmV4YW1wbGUuY29tIiwKICJzdWIiOiAiMjQ4Mjg5
     NzYxMDAxIiwKICJhdWQiOiAiczZCaGRSa3F0MyIsCiAibm9uY2UiOiAibi0wUzZ
     fV3pBMk1qIiwKICJleHAiOiAxMzExMjgxOTcwLAogImlhdCI6IDEzMTEyODA5Nz
     AKfQ.ggW8hZ1EuVLuxNuuIJKX_V8a_OMXzR0EHR9R6jgdqrOOF4daGU96Sr_P6q
     Jp6IcmD3HP99Obi1PRs-cwh3LO-p146waJ8IhehcwL7F09JdijmBqkvPeB2T9CJ
     NqeGpe-gccMg4vfKjkM8FcGvnzZUN4_KSP0aAp1tOJ1zZwgjxqGByKHiOtX7Tpd
     QyHE5lcMiKPXfEIQILVq0pc_E2DzL7emopWoaoZTF_m0_N0YzFC6g6EJbOEoRoS
     K5hoDalrcvRYLSrQAZZKflyuVCyixEoV9GfNQC3_osjzw2PAithfubEEBLuVVk4
     XUVrWOLrLl0nx7RkKU8NXNHq-rvKMzqg"
  }

{% enddetails  %}

## 参考
1. [10 分钟理解什么是 OAuth 2.0 协议](https://deepzz.com/post/what-is-oauth2-protocol.html) ***
2. [OAuth2.0 + OIDC 技术规范及应用场景](http://koca.szkingdom.com/forum/t/topic/139) ***
3. <<12 | 架构案例：基于OAuth 2.0/JWT的微服务参考架构>>  杨波 ***