---
title:  API使用教程：用 Cherry Studio 配置 gpt-5.5
slug: mingder-new-api-gpt-55-cherry-studio-guide
date: 2026-05-05 18:30:00
categories:
  - AI工具
tags:
  - New API
  - Cherry Studio
  - gpt-5.5
  - API中转站
  - 新手教程
description: 这是一篇面向普通用户的 New API 中转站使用教程，讲清楚如何在 API 创建令牌、选择 GPT 分组，并在 Cherry Studio 中配置 gpt-5.5 模型。
keywords:
  - New API 中转站
  -  API
  - Cherry Studio
  - gpt-5.5
  - API Key
cover: /img/AI.png
---

如果你只是想用模型，不想研究一堆 API 文档，那这篇就够了。

 API 的地址是：

```text
https://api.mingder.space/
```

这篇教程只解决一个问题：**普通用户如何创建 API 令牌，并在 Cherry Studio 里配置 `gpt-5.5` 模型开始聊天。**

你不需要懂后端，不需要懂部署，也不需要知道 New API 是怎么转发请求的。照着填就行。

<!--more-->

## 你需要准备什么

开始之前，你只需要准备三样东西：

- 一个 API 账号
- 一个 API 令牌，也就是 API Key
- 一个支持 OpenAI / NewAPI 接入的客户端，比如 Cherry Studio

如果你还没有 Cherry Studio，可以去官网下载安装：

```text
https://cherry-ai.com/
```

New API 官方也有一篇 Cherry Studio 接入教程，后面会引用到：

[Cherry Studio 接入 NewAPI 官方教程](https://doc.newapi.pro/apps/cherry-studio/)

## 第一步：打开 API

先打开这个网址：

```text
https://api.mingder.space/
```

进入后登录你的账号。

如果你还没有账号，需要先注册。若站点关闭了公开注册，就需要联系管理员开通账号或提供邀请码。

登录后，你会进入 New API 的控制台。普通用户最常用的地方主要有三个：

- `API令牌`：创建和复制 API Key
- `钱包`：查看余额或额度
- `使用日志`：查看调用记录和消耗

这篇文章重点讲 `API令牌`。

## 第二步：创建 API 令牌

在左侧菜单里找到 `API令牌`。

如果你不确定这个页面在哪里，可以参考 New API 官方文档：

[API令牌：教用户在哪里复制/创建 Key](https://doc.newapi.pro/guide/console/api-token/)

进入 `API令牌` 页面后，点击添加或新建令牌。创建时重点看这几个选项：

| 配置项 | 推荐填写 |
| :--- | :--- |
| 令牌名称 | 随便起一个自己能看懂的名字，比如 `Cherry Studio` |
| 分组 | 选择 `GPT` 分组 |
| 额度限制 | 不懂可以先保持默认，或者按自己的需求设置 |
| 过期时间 | 不懂可以先保持默认 |

这里最关键的是：**API 令牌的分组选择 `GPT` 分组。**

分组会影响你能调用哪些模型。本文要使用的是：

```text
gpt-5.5
```

所以创建令牌时，请确认分组选择了 `GPT`。

创建完成后，复制你的 API Key。它通常看起来像这样：

```text
sk-xxxxxxxxxxxxxxxxxxxxxxxx
```

注意：API Key 等同于你的使用凭证，不要发到公开群、朋友圈、GitHub 仓库或截图里。

## 第三步：在 Cherry Studio 里添加提供商

打开 Cherry Studio，进入模型服务或提供商设置页面。

新增一个提供商，类型可以选择兼容 OpenAI 的类型，或者选择 NewAPI 支持的类型。不同版本的 Cherry Studio 文案可能略有不同，但核心配置就三个：

| 配置项 | 填写内容 |
| :--- | :--- |
| 提供商类型 | OpenAI 兼容或 NewAPI 支持的类型 |
| API 密钥 | 刚才在 API 复制的 API Key |
| API 地址 | `https://api.mingder.space/` |

New API 官方 Cherry Studio 教程里也明确写了这三个参数：

- 提供商类型：NewAPI 支持的类型
- API 密钥：于 NewAPI 获取
- API 地址：NewAPI 站点地址

原文参考：

[Cherry Studio 接入 NewAPI：教普通用户怎么在客户端里填](https://doc.newapi.pro/apps/cherry-studio/)

## 第四步：注意 Base URL 的写法

很多客户端会把 `API 地址` 叫成 `Base URL`、`API Host` 或 `接口地址`。

如果 Cherry Studio 让你填写 `API 地址`，优先填写：

```text
https://api.mingder.space/
```

如果某个客户端明确要求填写 OpenAI Base URL，通常填写：

```text
https://api.mingder.space/v1
```

判断方法很简单：

- 如果客户端会自动拼接 `/v1/chat/completions`，就填 `https://api.mingder.space/`
- 如果客户端要求你直接填写 OpenAI Base URL，就填 `https://api.mingder.space/v1`

Cherry Studio 按 NewAPI 接入时，一般直接填站点地址即可：

```text
https://api.mingder.space/
```

## 第五步：添加或选择 gpt-5.5 模型

接下来在 Cherry Studio 里添加模型。

模型名称填写：

```text
gpt-5.5
```

如果 Cherry Studio 支持自动获取模型列表，可以先点击刷新或获取模型列表，然后选择 `gpt-5.5`。

如果没有自动出现，就手动添加模型 ID：

```text
gpt-5.5
```

这里要注意，模型 ID 需要和服务端配置保持一致。不要写成 `GPT-5.5`、`gpt5.5` 或 `gpt-5-5`。

推荐配置如下：

| 配置项 | 填写内容 |
| :--- | :--- |
| API 地址 | `https://api.mingder.space/` |
| OpenAI Base URL | `https://api.mingder.space/v1` |
| API Key | 你在 `API令牌` 页面复制的 Key |
| 令牌分组 | `GPT` |
| 模型 ID | `gpt-5.5` |

## 第六步：发一句话测试

配置完成后，回到 Cherry Studio 的聊天页面。

选择刚才添加的 `gpt-5.5`，然后发一句简单的话：

```text
你好，请用一句话介绍你自己。
```

如果模型正常回复，说明配置成功。

如果没有回复，不要急，先看报错信息。

## 常见问题

### 1. 提示 API Key 无效

优先检查三件事：

- API Key 有没有复制完整
- API Key 前后有没有多余空格
- 当前令牌有没有被删除、禁用或过期

如果你刚创建完令牌，建议重新复制一次，不要手打。

### 2. 提示没有权限或模型不可用

这通常和分组有关。

请回到 `API令牌` 页面，确认这个令牌创建时选择的是：

```text
GPT
```

如果令牌选错了分组，最简单的办法是重新创建一个令牌，并在创建时选择 `GPT` 分组。

### 3. 找不到 gpt-5.5

先确认模型 ID 是否写对：

```text
gpt-5.5
```

如果拼写没问题，但客户端仍然获取不到模型列表，可能是客户端没有自动拉取模型，或者当前账号分组没有开放这个模型。

这时可以手动添加模型 ID，再测试聊天。

### 4. API 地址到底填哪个

普通用户记住这两个就够了：

```text
站点地址：https://api.mingder.space/
Base URL：https://api.mingder.space/v1
```

Cherry Studio 按 NewAPI 接入时，通常填站点地址：

```text
https://api.mingder.space/
```

其他 OpenAI 兼容客户端如果要求 `Base URL`，就填：

```text
https://api.mingder.space/v1
```

### 5. 能不能把 API Key 发给别人帮我配置

不建议。

API Key 相当于你的账号调用凭证。别人拿到后，就可能消耗你的额度。需要截图求助时，请把 Key 打码，只保留前几位或后几位用于识别。

## 最后总结

普通用户使用 API，其实只需要记住这一套配置：

```text
站点地址：https://api.mingder.space/
Base URL：https://api.mingder.space/v1
令牌分组：GPT
模型 ID：gpt-5.5
```

流程也很固定：

1. 登录 `https://api.mingder.space/`
2. 进入 `API令牌`
3. 创建令牌，分组选择 `GPT`
4. 复制 API Key
5. 打开 Cherry Studio
6. 填入 API 地址和 API Key
7. 添加或选择 `gpt-5.5`
8. 发消息测试

如果你只是想聊天、写作、翻译、总结文档，不需要理解复杂的接口细节。真正要填的东西就四个：地址、Key、分组、模型名。

## 参考资料

- [New API 官方文档：API令牌](https://doc.newapi.pro/guide/console/api-token/)
- [New API 官方文档：Cherry Studio 接入 NewAPI](https://doc.newapi.pro/apps/cherry-studio/)
