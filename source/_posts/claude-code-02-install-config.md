---
title: Claude Code 完全教程 02：安装配置篇
slug: claude-code-02-install-config
date: 2026-05-06 20:10:00
categories:
  - AI工具
tags:
  - Claude Code
  - CC Switch
  - API配置
  - 新手教程
description: Claude Code 系列教程安装配置篇，讲清楚终端方式、IDE 搭配、Claude Code CLI 安装、模型 API 配置和 CC Switch 的基本用法。
keywords:
  - Claude Code 安装
  - Claude Code 配置
  - CC Switch
  - Claude Code API
cover: /img/claude.png
---

上一篇我们讲清楚了 Claude Code 是什么。这一篇进入实操：把它安装起来，并配置到可以正常使用。

对小白来说，安装配置最容易卡住。但你只要理解一件事就够了：Claude Code 是一个运行在终端里的 Agent 程序，它需要一个可以调用的大模型。

所以安装配置分两步：**先装 Claude Code CLI，再配置模型。**

<!--more-->

## 系列导航

上一篇：[概念篇](/2026/05/06/claude-code-01-concepts/)

下一篇：[基础使用篇](/2026/05/06/claude-code-03-basic-usage/)

## 使用 Claude Code 的几种方式

严格来说，Claude Code 相关能力有几种使用方式：

1. 在 Claude 官方桌面应用里使用
2. 在网页里使用
3. 在 IDE 插件里使用
4. 在终端里使用 Claude Code CLI

这篇教程重点讲第四种：**终端方式**。

原因很简单：终端方式更原生，功能更完整，新能力也通常最先支持。

不过，为了让小白更容易上手，建议你搭配一个 IDE 使用，比如 Cursor、Trae、VS Code。

IDE 的好处是：

- 左边可以看项目文件
- 中间可以手动编辑文档或代码
- 下方可以打开多个终端
- 右侧可以偶尔使用 IDE 自带的 AI 面板

这样你既能用 Claude Code，又不会完全困在黑乎乎的终端里。

## 安装前准备

建议先准备这些东西：

- 一个项目文件夹，比如 `first-cc`
- 一个 IDE，比如 Cursor 或 VS Code
- Node.js 环境
- Git 环境
- Claude Code CLI
- 可选：CC Switch，用来管理不同模型和 API 配置

如果你完全是小白，不要被这些名字吓到。后面都可以让 AI 帮你装。

## 方法一：官网命令安装

打开 Claude Code 官网，复制官方提供的一行安装命令。

然后在 IDE 里打开终端，把命令粘贴进去，回车执行。

安装完成后，输入：

```bash
claude --version
```

如果能看到版本号，就说明安装成功。

## 方法二：让 IDE Agent 帮你安装

这也是更 AI 原生的方式。

你可以直接对 Cursor 或 Trae 里的 Agent 说：

```text
请帮我在当前电脑上安装 Claude Code CLI，并验证 claude --version 是否可用。如果缺少依赖，请一步步帮我解决。
```

它会自动检查你的系统环境、安装依赖、处理错误。

对小白来说，这种方式反而更舒服。

## 配置模型：官方订阅和 API 中转

Claude Code 本身是 Agent 程序，它背后的模型是可以配置的。

最直接的方式是使用 Claude 官方账号和订阅。

但对国内用户来说，很多人会选择国产模型、第三方 API 或中转服务。

这时就需要配置：

- API Key
- Base URL
- 模型名称

这一步的关键不是记住某个固定界面，而是知道每个参数的含义。

`API Key` 是你的调用凭证。不要公开发给别人，也不要提交到 GitHub。

`Base URL` 是模型服务的入口地址。如果你使用中转站，就填中转站提供的地址。

`模型名称` 是具体调用哪个模型。不同服务商和中转站可能有不同命名。

## 用 CC Switch 管理模型

如果你会频繁切换不同模型，建议安装 **CC Switch**。

它的作用是帮你统一管理 Claude Code、Codex、Gemini CLI 等 AI CLI 工具的 API 配置。

你可以在 CC Switch 里添加一个配置：

```text
名称：随便起，比如 GPT 中转
API Key：你的 API Key
Base URL：你的中转地址
模型：你要用的模型
```

配置好之后，再启动 Claude Code。

注意：**最好先配置 CC Switch，再打开 Claude Code。**

否则 Claude Code 可能会默认引导你去登录官方账号。

## 第一次启动 Claude Code

在项目文件夹里打开终端，输入：

```bash
claude
```

第一次启动时，它通常会让你做一些初始化设置，比如：

- 选择主题颜色
- 阅读安全提示
- 是否使用推荐设置
- 是否信任当前项目目录

如果你是在自己创建的项目文件夹里使用，一般可以按提示选择确认。

进入对话界面后，你就可以开始输入任务了。

## 安装配置检查清单

完成后，你至少要确认：

- `claude --version` 能显示版本号
- 终端里输入 `claude` 可以进入对话
- 模型配置已经生效
- 当前项目目录是你信任的目录
- API Key 没有泄露到公开文件里

如果这几项都没问题，就可以进入下一篇基础使用。

下一篇：[Claude Code 完全教程 03：基础使用篇](/2026/05/06/claude-code-03-basic-usage/)
