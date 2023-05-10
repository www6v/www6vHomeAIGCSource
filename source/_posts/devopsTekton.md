---
title: DevOps-Tekton
date: 2022-05-10 09:46:02
tags: 
  - devops
categories:
  - devops
  - Tekton
---

<p></p>
<!-- more -->

## 事件触发的自动化流水线[1]
{%  asset_img 'tekton-pipeline.JPG'  %}

## Example [chat]
下面是一个包含EventListener、TriggerTemplate和PipelineRun的Tekton YAML模板示例，其中包含interceptors、bindings和template，旨在从Git中拉取代码：
```
apiVersion: tekton.dev/v1beta1
kind: EventListener  ##
metadata:
  name: my-event-listener
spec:
  interceptors:  ##
  - cel:
      filter: "body.repository.full_name == 'my-org/my-repo'"
  triggers:
  - name: my-trigger
    bindings:   ##
    - name: my-binding
      ref: my-binding
    template:   ##
      name: my-trigger-template
---
apiVersion: tekton.dev/v1beta1
kind: TriggerTemplate
metadata:
  name: my-trigger-template
spec:
  params:
  - name: repoUrl
    description: The URL of the git repository to clone
  resourcetemplates:
  - apiVersion: tekton.dev/v1alpha1
    kind: PipelineRun    
    metadata:
      name: my-pipeline-run ##
    spec:
      pipelineRef:
        name: my-pipeline   ##
      params:
      - name: repoUrl
        value: $(tt.params.repoUrl)
---
apiVersion: tekton.dev/v1beta1
kind: Pipeline
metadata:
  name: my-pipeline  ##
spec:
  tasks:
  - name: git-clone   ##
    taskRef:
      name: git-clone
    params:
    - name: REPO_URL
      value: $(inputs.params.repoUrl)
---
apiVersion: tekton.dev/v1beta1
kind: Task
metadata:
  name: git-clone   ##
spec:
  inputs:
    params:
    - name: REPO_URL
      type: string
  steps:
  - name: git-clone
    image: alpine/git
    script:
    - apk add --no-cache git
    - git clone $(inputs.params.REPO_URL)
---
apiVersion: tekton.dev/v1beta1
kind: PipelineRun
metadata:
  name: my-pipeline-run   ##
spec:
  pipelineRef:
    name: my-pipeline
  params:
  - name: repoUrl
    value: https://github.com/my-org/my-repo.git
```

# 参考
1. 《10丨模块十：Kubernetes的生产化运维》  云原生训练营 
