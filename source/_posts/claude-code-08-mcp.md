---
title: Claude Code 完全教程 08：高级拓展二 MCP
slug: claude-code-08-mcp
date: 2026-05-06 21:10:00
categories:
  - AI工具
tags:
  - Claude Code
  - MCP
  - AI Agent
  - 新手教程
description: Claude Code 高级拓展 MCP 篇，讲清楚 MCP 是什么、它如何连接外部服务、适合哪些场景，以及新手为什么不应该一开始就装太多 MCP。
keywords:
  - Claude Code MCP
  - MCP 教程
  - AI Agent 外部工具
cover: /img/claude.png
---

MCP 是 Claude Code 和各种外部服务之间的转接头。

如果 Skill 更像“操作手册”，那 MCP 更像“连接器”。它让 Claude Code 有机会访问 Notion、Figma、GitHub、数据库、飞书等外部系统。

<!--more-->

## 系列导航

上一篇：[高级拓展一：Skill](/2026/05/06/claude-code-07-skill/)

下一篇：[高级拓展三：CLI 工具](/2026/05/06/claude-code-09-cli-tools/)

## MCP 是什么？

MCP 可以理解成 Agent 连接外部服务的转接头。

比如你希望 Claude Code 能访问：

- Notion
- Figma
- GitHub
- 飞书
- 数据库
- 浏览器
- 云服务

就可以通过 MCP 把这些工具接进来。

MCP 的价值不是让 Claude Code “知道更多”，而是让它能真正操作更多系统。

## MCP 和 Skill 的区别

Skill 主要告诉 Claude Code “怎么做”。

MCP 主要提供 Claude Code “能操作什么”。

举个例子：

- Skill：告诉它如何写一篇 SEO 文章
- MCP：让它能把文章发布到某个 CMS

再比如：

- Skill：告诉它如何根据设计稿生成前端代码
- MCP：让它能读取 Figma 设计稿

两者经常配合使用，但职责不同。

## MCP 适合哪些场景？

MCP 适合那些需要深度连接外部服务的任务。

比如：

- 读取 Notion 知识库做总结
- 从 Figma 设计稿生成页面
- 查询数据库数据并生成报告
- 读取 GitHub Issue 并修复问题
- 操作飞书文档或日历
- 连接浏览器执行网页任务

如果任务只是在本地文件和命令行里完成，不一定需要 MCP。

## MCP 的优势

MCP 的优势是能力强、连接深。

一旦接好，Claude Code 就可以在更完整的工作流里行动。

比如你可以让它：

```text
读取 Notion 中这个项目的需求文档，根据最新需求修改当前代码，并把完成情况写回项目记录。
```

这种任务如果没有外部连接能力，就只能靠你复制粘贴。

## MCP 的成本

MCP 也不是越多越好。

它会带来一些成本：

- 配置成本
- 权限管理成本
- 安全风险
- 维护成本
- 上下文复杂度
- 工具调用失败的排查成本

普通用户不需要一开始就装一堆 MCP。

建议只保留你真的高频使用的几个。

## 新手怎么开始用 MCP？

新手可以按这个顺序：

1. 先不用 MCP，把本地文件工作流跑顺
2. 找到一个明确痛点，比如总要读 Notion 或 GitHub
3. 只接一个 MCP
4. 让 Claude Code 帮你测试它能不能正常读取和操作
5. 把使用方式写进项目文档或 Skill

不要因为 MCP 很火就一次装十个。

## MCP 的安全注意事项

MCP 往往涉及外部账号和权限。

配置时要特别注意：

- 不要给不必要的写权限
- 不要把密钥提交到 Git
- 不要连接你不信任的 MCP 服务
- 不要让 Claude Code 在未确认时执行高风险操作
- 定期检查授权和访问范围

Agent 能力越强，权限边界越重要。

## 我的建议

MCP 是高级能力，但不是新手第一天必须掌握的能力。

你可以先把 Claude Code 当成本地文件和终端 Agent 用起来。

当你明确发现“它要是能访问某个外部系统就好了”，再考虑 MCP。

这样 MCP 是为了解决问题，而不是为了追热点。

下一篇：[Claude Code 完全教程 09：高级拓展三 CLI 工具](/2026/05/06/claude-code-09-cli-tools/)
