---
title: Golang 基础-Linter
date: 2022-06-24 16:58:17
tags:
  - Golang
categories:
  - Golang  
  - Linter
---

<p></p>
<!-- more -->



## linter [1]
+ 单个
  + golint
  + go vet 
  + gocyclo
  + 代码覆盖率
    codecov
  + 检查错误是否被处理
    errcheck
  + bodyclose 
  + sqlrows

+ 集合
  - golangci-lint  标准
  - sonarqube
  - deepsource 

+ golangci-lint + reviewdog  [3]
  - 给项目提pr时，自动执行linter，自动CI？
  - github支持, gitlab也支持
``` yml
name: actions
on:
  push:
    branches:
      - master
  pull_request:
    types:
      - opened
      - reopened
      - synchronize
      - ready_for_review
jobs:
  golangci-lint:
    if: ${{ !github.event.pull_request.draft }}
    name: runner / golangci-lint
    runs-on: ubuntu-latest
    steps:
      - name: Check out code
        uses: actions/checkout@v3
      - name: golangci-lint
        uses: reviewdog/action-golangci-lint@v2
        if: github.event_name == 'pull_request'
        with:
          golangci_lint_flags: "--skip-dirs=mtls/crypto,module/http2 --enable-all --timeout=10m --exclude-use-default=false --tests=false --disable=gochecknoinits,gochecknoglobals,exhaustive,exhaustruct,exhaustivestruct,nakedret,ireturn,interfacer,tagliatelle,varnamelen"
          workdir: pkg
```

## 参考
1. 《25 直播：如何写出优雅的 Go 代码》
2. [ static-analysis](https://github.com/analysis-tools-dev/static-analysis)
   [analysis-tools](https://analysis-tools.dev/)
3. [mosn的reviewdog](https://github.com/mosn/mosn/blob/master/.github/workflows/reviewdog.yml)