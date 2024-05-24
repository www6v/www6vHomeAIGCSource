---
title: LLama-Factory
date: 2023-05-24 18:43:17
tags:
  - LLamaFactory
categories:
  - AIGC  
  - LLamaFactory
---

<p></p>
<!-- more -->

# 安装
### LLaMA-Factory 安装
``` shell
# 安装llamafactory-cli命令
git clone https://github.com/hiyouga/LLaMA-Factory.git
conda create -n llama_factory python=3.10
conda activate llama_factory
cd LLaMA-Factory
pip install -e .[metrics]
```

### 推理llama3
``` python
#模型下载
from modelscope import snapshot_download
model_dir = snapshot_download('LLM-Research/Meta-Llama-3-8B-Instruct')
```

``` shell
# 配置
$ vim examples/inference/llama3.yaml
model_name_or_path: /home/wei/models/model/LLM-Research/Meta-Llama-3-8B-Instruct
template: llama3

# 阿里云必须加这句，不然页面会报异常
$ export GRADIO_ROOT_PATH=/${JUPYTER_NAME}/proxy/7860/

# 启动
$ llamafactory-cli webchat examples/inference/llama3.yaml
```
+ Command
{% asset_img  'command.JPG' %}

+ WebUI
{% asset_img  'webui.JPG' %}


# 参考
[LLaMA-Factory QuickStart](https://zhuanlan.zhihu.com/p/695287607)



