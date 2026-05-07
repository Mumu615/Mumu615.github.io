---
title: Claude Code 完全教程 09：高级拓展三 CLI 工具
slug: claude-code-09-cli-tools
date: 2026-05-06 21:20:00
categories:
  - AI工具
tags:
  - Claude Code
  - CLI
  - AI Agent
  - 新手教程
description: Claude Code 高级拓展 CLI 工具篇，讲清楚为什么命令行工具是 Agent 最容易发挥能力的外部工具，以及 Git、FFmpeg、gh 等 CLI 的典型用法。
keywords:
  - Claude Code CLI
  - AI Agent CLI 工具
  - FFmpeg
  - GitHub CLI
cover: /img/claude.png
---

CLI 工具是 Claude Code 最值得重视的扩展方式之一。

因为 Agent 很擅长输出命令。相比模拟人类打开网页、移动鼠标、点击按钮，命令行更稳定、更精准，也更容易验证。

<!--more-->

## 系列导航

上一篇：[高级拓展二：MCP](/2026/05/06/claude-code-08-mcp/)

下一篇：[高级拓展四：Sub Agent](/2026/05/06/claude-code-10-sub-agent/)

## CLI 是什么？

CLI 是 Command Line Interface，也就是命令行工具。

它本来就是程序员常用的东西，但现在对 Agent 特别重要。

比如普通用户想下载文件，通常会打开网页、点击按钮。

程序员可能一行命令就能完成。

现在 AI 很会用这些命令，所以 CLI 变成了 Agent 的天然工具箱。

## 为什么 CLI 很适合 Agent？

原因很简单：命令是结构化的。

比如压缩视频，图形界面里可能要点很多按钮。

但用 FFmpeg 可以是一条命令：

```bash
ffmpeg -i input.mp4 -vf scale=1920:-2 -c:v libx264 -crf 23 output.mp4
```

Agent 输出命令比模拟点击更可靠。

命令执行后还有明确结果，成功就是成功，失败就有错误日志。

这非常适合 Claude Code 这样的本地 Agent。

## 常见 CLI 工具

你可以让 Claude Code 使用很多 CLI 工具。

常见的有：

- `git`：版本管理
- `gh`：GitHub 操作
- `ffmpeg`：视频和音频处理
- `npm`：Node.js 项目依赖管理
- `pnpm`：更快的包管理器
- `curl`：请求接口或下载内容
- `jq`：处理 JSON
- 各种平台官方 CLI：飞书、云服务、部署平台等

你不需要自己记住所有命令。

你只需要让 Claude Code 知道目标，并要求它解释命令风险。

## 示例：让 Claude Code 安装并使用 FFmpeg

你可以说：

```text
请帮我检查电脑是否安装了 ffmpeg。如果没有，请给出安装方法。安装完成后，把当前文件夹下的视频压缩到 1080p，输出到 compressed 文件夹。执行前先告诉我会运行哪些命令。
```

这个提示词有几个好处：

- 先检查环境
- 不直接盲目安装
- 说明输出目录
- 要求执行前解释命令

这就是和 Agent 协作时比较安全的表达方式。

## 示例：用 gh 操作 GitHub

如果你安装了 GitHub CLI，也就是 `gh`，Claude Code 可以帮你：

- 查看 Issue
- 创建 PR
- 查看 CI 状态
- 读取 PR 评论
- 创建 Release

比如：

```text
请使用 gh 查看当前仓库最近 5 个 open issue，按优先级整理成一个修复建议列表。不要修改代码。
```

这比让它打开浏览器点 GitHub 页面更稳定。

## CLI 和 MCP 怎么选？

很多外部工具既可能有 MCP，也可能有 CLI。

我的建议是：能用 CLI 稳定完成的任务，优先用 CLI。

CLI 的优点是：

- 透明
- 可复制
- 可审计
- 容易调试
- 失败有日志

MCP 更适合复杂交互和深度集成。

CLI 更适合明确命令式任务。

## 使用 CLI 的安全习惯

让 Claude Code 跑命令时，要养成几个习惯：

- 让它先说明要运行什么
- 涉及删除、覆盖、上传、付费操作时必须确认
- 不要轻易运行你看不懂的危险命令
- 重要项目先提交 Git 存档
- 让它优先使用非破坏性命令检查状态

比如你可以加一句：

```text
执行前先解释命令作用，不要运行删除文件、覆盖文件或上传数据的命令，除非我明确确认。
```

## CLI 是普通用户的捷径

很多小白害怕命令行。

但有了 Claude Code，命令行反而变简单了。

你不需要背命令，只需要会描述目标，并学会看它准备执行什么。

Claude Code 负责生成命令，你负责确认目标和风险。

下一篇：[Claude Code 完全教程 10：高级拓展四 Sub Agent](/2026/05/06/claude-code-10-sub-agent/)
