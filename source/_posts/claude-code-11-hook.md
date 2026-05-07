---
title: Claude Code 完全教程 11：高级拓展五 Hook
slug: claude-code-11-hook
date: 2026-05-06 21:40:00
categories:
  - AI工具
tags:
  - Claude Code
  - Hook
  - 自动化
  - 新手教程
description: Claude Code 高级拓展 Hook 篇，讲清楚 Hook 是什么、它如何作为自动触发器减少重复提醒，以及常见使用场景和配置注意事项。
keywords:
  - Claude Code Hook
  - Claude Code 自动化
  - Agent Hook
cover: /img/claude.png
---

Hook 可以理解成 Claude Code 的条件反射。

你设定好“什么时候发生什么事”，它就自动触发某个动作。

比如任务完成后播放提示音，提交代码前自动运行格式检查。这些都是 Hook 适合做的事。

<!--more-->

## 系列导航

上一篇：[高级拓展四：Sub Agent](/2026/05/06/claude-code-10-sub-agent/)

下一篇：[高级拓展六：插件](/2026/05/06/claude-code-12-plugin/)

## Hook 是什么？

Hook 是一种自动触发器。

它的逻辑很简单：

```text
当某个事件发生时
自动执行某个动作
```

这和很多开发工具里的 Hook 概念类似。

区别是，在 Claude Code 里，Hook 更多是为了让 Agent 工作流更自动化、更可控。

## Hook 适合做什么？

Hook 适合处理那些你总是重复提醒 Claude Code 的事情。

比如：

- 每次任务完成后播放提示音
- 每次提交代码前自动运行格式检查
- 每次修改某类文件后自动运行测试
- 每次生成文档后自动同步到某个目录
- 每次执行危险命令前记录日志

如果一件事你经常说“以后每次都要……”，它就可能适合做成 Hook。

## 示例一：任务完成后提示音

很多时候 Claude Code 会跑比较久。

你不可能一直盯着终端。

这时可以配置一个 Hook：任务完成后发出提示音。

你可以直接对 Claude Code 说：

```text
请帮我配置一个 Hook：每次任务完成后播放提示音，并告诉我配置文件在哪里。
```

这样你就不用一直看屏幕。

## 示例二：提交前自动检查

开发项目时，你可能希望每次提交前都运行：

- 格式检查
- Lint
- 测试
- 构建

你可以让 Claude Code 帮你设计 Hook：

```text
请帮我配置一个 Hook：每次准备提交代码前，先运行 npm run build。如果失败，不要继续提交，并把错误原因总结给我。
```

这类 Hook 能减少低级错误。

## Hook 和 CLAUDE.md 的区别

`CLAUDE.md` 是规则。

Hook 是触发器。

比如你在 `CLAUDE.md` 里写：

```text
提交前要运行构建。
```

这只是提醒 Claude Code。

但 Hook 可以把这个提醒变成实际自动动作。

所以两者不是替代关系，而是互补关系。

## Hook 的风险

Hook 也有风险。

因为它会自动执行动作。

如果配置不当，可能出现：

- 频繁触发
- 执行错误命令
- 影响性能
- 在不该运行的时候运行
- 让工作流变得难以排查

所以新手不要一开始就配置很多 Hook。

先从低风险 Hook 开始，比如提示音、日志记录、非破坏性检查。

## 配置 Hook 的原则

建议遵守这些原则：

- 动作越自动，风险越要低
- 涉及删除、上传、提交、部署的 Hook 要谨慎
- Hook 做的事情要可解释
- Hook 失败时要有清晰提示
- 不要让 Hook 互相触发形成循环

如果不确定，可以让 Claude Code 先给计划，不要直接修改配置：

```text
请先说明这个 Hook 会如何配置、触发条件是什么、风险是什么，暂时不要写入文件。
```

## 什么时候不需要 Hook？

如果一件事你只是偶尔做，就不要做成 Hook。

Hook 适合稳定、重复、明确的自动化。

模糊任务更适合写进流程文档或 Skill。

下一篇：[Claude Code 完全教程 12：高级拓展六 插件](/2026/05/06/claude-code-12-plugin/)
