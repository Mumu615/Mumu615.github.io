---
title: Claude Code 完全教程 01：概念篇
slug: claude-code-01-concepts
date: 2026-05-06 20:00:00
categories:
  - AI工具
tags:
  - Claude Code
  - AI Agent
  - 新手教程
description: Claude Code 系列教程概念篇，讲清楚 Claude Code 是什么、为什么它比普通聊天 AI 更像一个真正的本地 Agent，以及 LLM Loop 和 Harness 的核心含义。
keywords:
  - Claude Code 教程
  - Claude Code 概念
  - AI Agent
  - Harness
  - LLM Loop
cover: /img/claude.png
---

Claude Code 可能是过去这一年里最持续爆火，也最实用的 AI Agent 之一。

它原本是 Anthropic 为编程场景设计的终端 Agent，但现在它能做的事情已经远远不止写代码。写应用、改网页、查资料、整理素材、写报告、管理项目文件、调用外部工具、跑命令、做自动化，它都能参与。

如果你是程序员，它可以成为你的开发搭档。

如果你不是程序员，但你每天都在处理文字、资料、表格、网页、报告和各种重复性脑力工作，它也值得你认真学一下。

<!--more-->

## 系列目录

1. [概念篇](/2026/05/06/claude-code-01-concepts/)
2. [安装配置篇](/2026/05/06/claude-code-02-install-config/)
3. [基础使用篇](/2026/05/06/claude-code-03-basic-usage/)
4. [常用命令篇](/2026/05/06/claude-code-04-common-commands/)
5. [上下文管理篇](/2026/05/06/claude-code-05-context-management/)
6. [个性化篇](/2026/05/06/claude-code-06-personalization/)
7. [高级拓展一：Skill](/2026/05/06/claude-code-07-skill/)
8. [高级拓展二：MCP](/2026/05/06/claude-code-08-mcp/)
9. [高级拓展三：CLI 工具](/2026/05/06/claude-code-09-cli-tools/)
10. [高级拓展四：Sub Agent](/2026/05/06/claude-code-10-sub-agent/)
11. [高级拓展五：Hook](/2026/05/06/claude-code-11-hook/)
12. [高级拓展六：插件](/2026/05/06/claude-code-12-plugin/)
13. [其他技巧篇](/2026/05/06/claude-code-13-other-tips/)

## Claude Code 到底是什么？

Claude Code 是 Anthropic 在 2025 年推出的一个运行在终端里的 AI Agent 程序。大家经常简称它为 **CC**。

它和我们平时用的网页聊天 AI 最大的区别，不是回答更长，也不是语气更像人，而是：**它真的会行动。**

普通聊天 AI 通常是一问一答：

```text
你问一个问题
AI 回答一段文字
你再追问
AI 再回答
```

![普通聊天 AI 和 Claude Code 对比](/img/claude-code-chat-vs-agent.png)

Claude Code 更像这样：

```text
你给它一个目标
它读取项目文件
它制定计划
它修改代码或文档
它运行命令验证
它根据结果继续调整
最后把完成情况告诉你
```

这就是 Agent 和普通聊天机器人的核心差别。

Claude Code 不只是“告诉你怎么做”，它可以在你的电脑里直接做。

## 它为什么比普通 Agent 更好用？

从原理上说，很多 Agent 都基于类似的大模型循环，也就是 **LLM Loop**。

这个循环大概是：

1. 用户输入任务
2. Agent 把任务和工具说明一起发给大模型
3. 大模型决定下一步使用什么工具
4. Agent 执行工具
5. 执行结果返回给大模型
6. 大模型继续判断下一步
7. 如此循环，直到任务完成

![LLM Loop 示意图](/img/claude-code-llm-loop.png)

那为什么 Claude Code 的体验会特别突出？

关键原因有两个。

## 原因一：它能直接访问本地文件和终端

很多网页 Agent 只能在网页里查资料、点按钮、总结内容。

Claude Code 不一样。它运行在你的电脑本地，可以直接：

- 读取项目文件
- 修改本地代码
- 新建文档
- 运行终端命令
- 安装依赖
- 启动开发服务器
- 分析报错日志
- 调用你本机安装的 CLI 工具

这意味着它离真实工作流更近。

它不是漂在网页里的聊天框，而是坐在你的工作台旁边。

## 原因二：它的 Harness 做得很好

现在 AI 圈经常提到一个词：**Harness**。

你可以把 Harness 理解成：除了大模型本身之外，那些让 Agent 真正变好用的工程设计。

包括但不限于：

- 怎么管理上下文
- 怎么读取文件
- 怎么搜索代码
- 怎么决定是否需要用户确认
- 怎么调用工具
- 怎么回滚
- 怎么派生子 Agent
- 怎么处理权限
- 怎么把任务拆成计划

同一个模型，放在不同 Harness 里，体验会完全不同。

你用 Claude Code、Codex、Cursor Agent、OpenCode，本质上不只是换模型，也是在换 Harness。

Claude Code 厉害的地方在于，它的本地 Agent Harness 非常成熟。

## Claude Code 能做什么？

最直接的用途当然是编程。

比如你可以让它：

- 写一个番茄钟应用
- 修复项目里的报错
- 给已有代码加注释
- 重构页面结构
- 写测试
- 分析一个陌生项目
- 生成部署脚本
- 根据需求文档做一个网页

但它不只能写代码。

越来越多人把 Claude Code 用在非编程的知识工作里，比如：

- 写文案
- 整理资料
- 做调研报告
- 分析竞品
- 整理会议纪要
- 维护知识库
- 批量处理 Markdown 文件
- 调用 CLI 工具下载或压缩素材
- 自动生成文档结构

只要你的工作可以落到“文件、命令、资料、流程”上，Claude Code 就有机会帮你做。

## 你真正要学的是什么？

Claude Code 的重点不是多会一个命令。

真正重要的是，你开始从“一问一答地使用 AI”，转向“构建系统，让 AI 自己推进任务”。

这意味着你要学会：

- 给清晰目标
- 提供准确上下文
- 让它先计划
- 用 Git 管住风险
- 用文档沉淀规则
- 用 Skill 和工具扩展能力
- 用子 Agent 并行处理复杂任务

当你习惯这种协作方式后，未来再出现新的 Agent、新的 CLI、新的模型，你都会上手得更快。

下一篇：[Claude Code 完全教程 02：安装配置篇](/2026/05/06/claude-code-02-install-config/)
