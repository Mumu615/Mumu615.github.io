---
title: Claude Code 完全教程 07：高级拓展一 Skill
slug: claude-code-07-skill
date: 2026-05-06 21:00:00
categories:
  - AI工具
tags:
  - Claude Code
  - Skill
  - AI Agent
  - 新手教程
description: Claude Code 高级拓展 Skill 篇，讲清楚 Skill 是什么、适合解决什么问题、怎么安装、怎么调用，以及为什么它不应该全部写进 CLAUDE.md。
keywords:
  - Claude Code Skill
  - Skill 教程
  - AI Agent Skill
cover: /img/claude.png
---

Skill 是 Claude Code 高级玩法里最重要的一类能力。

你可以把 Skill 理解成：给 Agent 的专业说明书和操作手册。

它不是模型本身，也不是一个单独 App，而是一套告诉 Claude Code “遇到某类任务时应该怎么做”的规则、流程和资源。

<!--more-->

## 系列导航

上一篇：[个性化篇](/2026/05/06/claude-code-06-personalization/)

下一篇：[高级拓展二：MCP](/2026/05/06/claude-code-08-mcp/)

## Skill 适合解决什么问题？

Skill 适合处理那些你不会每次都用，但会反复用到的专业流程。

比如：

- 前端 UI 优化手册
- SEO 内容写作流程
- 视频剪辑命令生成
- 公司报销流程
- 公众号排版规范
- 图片生成工具调用方法

这些内容不适合全部写进 `CLAUDE.md`。

因为 `CLAUDE.md` 每次都会占上下文，而 Skill 通常只在需要时加载。

## Skill 的常见类型

Skill 大致可以分成几类。

## 流程型 Skill

这类 Skill 主要告诉 Agent 按什么步骤做事。

比如做一次代码审查：

1. 先看变更范围
2. 再找高风险文件
3. 再检查测试覆盖
4. 最后按严重程度输出问题

流程型 Skill 的重点是顺序和标准。

## 知识型 Skill

这类 Skill 更像领域手册。

比如前端设计规范、品牌视觉规范、SEO 写作规范。

它告诉 Agent 在某个领域里什么是好，什么是不好。

## 工具型 Skill

这类 Skill 会教 Agent 怎么调用某个工具。

比如怎么用 FFmpeg 剪视频，怎么调用图片生成 API，怎么把文件发到某个系统。

## 混合型 Skill

现实中很多 Skill 都是混合型。

比如“公众号排版并发布”既有写作规范，又有排版流程，还可能调用外部工具。

## Skill 为什么不直接写进 CLAUDE.md？

因为 `CLAUDE.md` 是高频加载内容。

如果你把所有规则都写进去，每次启动 Claude Code 都会读一大堆不一定相关的信息。

这会带来几个问题：

- 占用上下文
- 降低模型注意力
- 增加 token 消耗
- 让规则之间互相干扰

Skill 的好处是：平时只暴露少量元信息，需要时再加载完整说明。

也就是说，模型知道“我有这个工具手册”，但不会每次都把整本手册塞进脑子里。

## 怎么安装 Skill？

本质上，Skill 通常就是一个按规范组织的文件夹。

它可以放在全局目录，也可以放在项目目录。

全局 Skill 适合所有项目通用。

项目 Skill 适合当前项目或团队共享。

你可以手动安装，也可以让 Claude Code 帮你安装：

```text
请帮我安装一个适合前端 UI 优化的 Claude Code Skill，并说明它会放在哪里。
```

使用时可以直接说：

```text
请使用前端设计相关 Skill，帮我优化当前页面 UI。
```

或者使用斜杠命令直接调用特定 Skill，具体取决于你的环境和安装方式。

## 怎么找 Skill？

常见方式有三种：

- 使用社区里已经整理好的 Skill
- 让 Claude Code 根据你的需求搜索和推荐 Skill
- 自己创建一个适合你工作流的 Skill

很多时候，最有价值的 Skill 不是别人写好的，而是你在自己工作中逐渐沉淀出来的。

比如你经常写某类周报，就可以让 Claude Code 帮你创建一个“周报写作 Skill”。

比如你经常做某类视频脚本，就可以创建一个“视频脚本 Skill”。

## 怎么创建自己的 Skill？

最原始的方法是按规范手写 Skill 文件夹。

更实际的方法是让 Claude Code 帮你创建：

```text
我想创建一个 Skill，用来把视频口播稿整理成适合博客发布的文章。请先问我必要的问题，然后帮我生成这个 Skill。
```

一个好 Skill 至少要写清楚：

- 什么时候应该使用
- 输入通常是什么
- 输出应该是什么
- 操作步骤是什么
- 有哪些质量标准
- 有哪些禁止事项

## 使用 Skill 的注意事项

不要装太多 Skill。

Skill 越多，触发判断越复杂，也越可能该用的时候不用，不该用的时候乱用。

更好的策略是：

- 高频工作流才做 Skill
- 复杂流程才做 Skill
- 经常重复的标准才做 Skill
- 每隔一段时间清理不用的 Skill

Skill 是把经验产品化，不是收藏夹。

下一篇：[Claude Code 完全教程 08：高级拓展二 MCP](/2026/05/06/claude-code-08-mcp/)
