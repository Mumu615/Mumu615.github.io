---
title: Claude Code 完全教程 04：常用命令篇
slug: claude-code-04-common-commands
date: 2026-05-06 20:30:00
categories:
  - AI工具
tags:
  - Claude Code
  - 斜杠命令
  - 新手教程
description: Claude Code 系列教程常用命令篇，整理 /help、/model、/compact、/clear、/context、/rewind 等高频斜杠命令的用法和使用场景。
keywords:
  - Claude Code 命令
  - Claude Code slash commands
  - Claude Code compact
  - Claude Code rewind
cover: /img/claude.png
---

Claude Code 不是只能打字聊天。它有很多斜杠命令，可以帮助你切换模型、管理上下文、回滚操作、查看状态。

这一篇专门整理常用命令。新手不需要一次记住全部，先记住几个高频命令就够了。

<!--more-->

## 系列导航

上一篇：[基础使用篇](/2026/05/06/claude-code-03-basic-usage/)

下一篇：[上下文管理篇](/2026/05/06/claude-code-05-context-management/)

## 怎么查看所有命令？

在 Claude Code 里输入 `/`，会看到很多斜杠命令。

你可以先用：

```text
/help
```

查看当前支持的命令。

不同版本的 Claude Code 命令可能略有变化，所以 `/help` 永远是最可靠的入口。

## /model：切换模型

`/model` 用于切换模型。

如果你使用官方 Claude 模型，可以在这里选择不同档位。

如果你配合 CC Switch 使用，也可以把高中低不同档位配置成不同模型。

典型使用场景：

- 简单问答用便宜模型
- 复杂开发用强模型
- 长文整理用上下文更大的模型
- 写代码和写作分别用不同模型

模型不是越强越好。很多简单任务用高价模型只是浪费。

## /compact：压缩上下文

`/compact` 是长时间使用 Claude Code 时最重要的命令之一。

它会把之前的对话和关键结果做总结，释放上下文空间。

适合在这些节点使用：

- 项目初始化完成
- 一个功能完成
- 一轮调研完成
- 修复一个 Bug 后
- 准备切换到新任务前

你可以把 `/compact` 理解成“整理一下脑子”。

不是清空记忆，而是把重点留下，把杂乱过程压缩掉。

## /clear：彻底清空当前对话

`/clear` 会清空当前对话上下文，相当于重新开始。

适合当前上下文已经很乱、你想彻底开新任务的时候。

比如你刚做完一个前端页面，现在要开始写一篇文章，两者关系不大，就可以考虑 `/clear`。

如果你只是完成一个阶段，通常先用 `/compact`，不一定要 `/clear`。

## /context：查看上下文情况

`/context` 用来查看当前上下文占用。

你可以看到：

- 上下文占比
- 当前会话加载了哪些内容
- 可能包含哪些 MCP
- 可能包含哪些 Skill

每次手动输入 `/context` 可能有点麻烦，但它对排查“为什么 Claude Code 变慢、变笨”很有帮助。

当上下文占用较高时，你就该考虑 `/compact`。

## /rewind：回滚对话或文件修改

`/rewind` 会进入回滚界面。

它可以撤回 Claude Code 最近的对话或文件修改。

通常会有几种选择：

- 仅回滚对话
- 回滚对话和刚才编辑过的文件
- 仅回滚文件修改
- 取消操作

但注意，它不是万能后悔药。

它通常只能回滚 Claude Code 自己编辑的文件。对于运行命令造成的变化，比如下载依赖、生成文件、修改锁文件，它不一定能完全撤回。

真正可靠的后悔药仍然是 Git。

## /init：初始化项目说明

`/init` 会让 Claude Code 分析当前项目，并生成或更新项目级说明文件。

通常会生成类似 `CLAUDE.md` 的文件，里面包含：

- 项目架构概览
- 常用命令
- 文件结构
- 开发注意事项
- 测试或构建方式

不建议在空项目一开始就急着 `/init`。

更好的时机是：项目已经有了基本结构，Claude Code 可以总结出东西。

## /memory：管理记忆

`/memory` 用于查看或管理 Claude Code 的记忆相关内容。

你可以用它打开全局规则、项目规则或自动记忆。

如果你想让 Claude Code 长期记住某些偏好，比如“永远用中文回复”“前端不要使用浅色 UI”，就需要理解 `/memory` 和 `CLAUDE.md`。

这部分会在个性化篇详细讲。

## 感叹号命令：进入 Bash Mode

除了斜杠命令，还有一个非常实用的小技巧：在命令前加 `!`。

比如：

```bash
!npm run build
```

这表示你不是在和 Claude Code 对话，而是在让它执行终端命令。

适合临时跑一些短命令。

但如果是长期运行的命令，比如 `npm run dev`，建议新开终端，不要占住 Claude Code 的对话。

## 新手最应该先记住的命令

如果你只想先记 5 个，那就记这些：

```text
/help
/model
/compact
/clear
/rewind
```

它们分别解决：

- 不知道有什么命令
- 想切换模型
- 上下文太长
- 想重新开始
- 想撤回刚才的操作

下一篇：[Claude Code 完全教程 05：上下文管理篇](/2026/05/06/claude-code-05-context-management/)
