---
title: Claude Code 完全教程 06：个性化篇
slug: claude-code-06-personalization
date: 2026-05-06 20:50:00
categories:
  - AI工具
tags:
  - Claude Code
  - CLAUDE.md
  - Auto Memory
  - 新手教程
description: Claude Code 系列教程个性化篇，讲解 CLAUDE.md、/init、/memory、Auto Memory 和自建项目知识库，让 Claude Code 按你的习惯工作。
keywords:
  - Claude Code CLAUDE.md
  - Claude Code Memory
  - Claude Code 个性化
cover: /img/claude.png
---

Claude Code 默认对谁都差不多。要让它真正服务于你，就要让它记住你的习惯、项目规则和工作方式。

这一篇讲 Claude Code 的个性化能力：`CLAUDE.md`、`/init`、`/memory`、Auto Memory，以及你自己构建的项目知识库。

<!--more-->

## 系列导航

上一篇：[上下文管理篇](/2026/05/06/claude-code-05-context-management/)

下一篇：[高级拓展一：Skill](/2026/05/06/claude-code-07-skill/)

## 让 Claude Code 记住你：CLAUDE.md

Claude Code 最重要的个性化机制之一，是 `CLAUDE.md`。

你可以把它理解成：**写给 Claude Code 的项目说明书和行为规范。**

它会在 Claude Code 工作前被读入上下文，让它知道：

- 你是谁
- 这个项目是什么
- 项目怎么运行
- 代码风格是什么
- 哪些事情不能做
- 回答应该用什么语言
- 修改前后要如何验证

## 全局 CLAUDE.md

全局规则适合写你的个人偏好。

比如：

```markdown
# 全局规则

- 始终使用中文回复。
- 修改代码前先理解现有结构。
- 不要擅自删除用户已有文件。
- 涉及危险命令时必须先解释风险。
- 完成任务后简要说明改了什么和如何验证。
```

这些规则对所有项目生效。

适合放进全局规则的内容，通常是你无论做什么项目都希望它遵守的原则。

## 项目级 CLAUDE.md

项目级规则放在项目根目录。

它适合写当前项目的信息，比如：

```markdown
# 项目说明

这是一个 React 番茄钟应用。

## 常用命令

- 安装依赖：npm install
- 启动开发：npm run dev
- 构建：npm run build

## 开发约定

- UI 优先考虑移动端可用性。
- 不引入大型依赖，除非用户明确同意。
- 每完成一个稳定阶段，提醒用户提交 Git。
```

项目级 `CLAUDE.md` 可以提交到 Git 仓库，让团队共享同一套规则。

## 文件夹级 CLAUDE.md

大型项目里，你还可以在子文件夹下放 `CLAUDE.md`。

比如 `frontend/CLAUDE.md` 写前端规则，`docs/CLAUDE.md` 写文档规则。

普通小白一开始用不到这么细，但知道有这个能力即可。

## 用 /init 初始化项目记忆

当一个项目已经有了一定雏形后，可以让 Claude Code 自动初始化项目说明。

输入：

```text
/init
```

它会分析当前项目结构，然后生成或更新 `CLAUDE.md`。

通常会包含：

- 项目架构概览
- 常用命令
- 文件结构
- 开发注意事项
- 测试或构建方式

不建议在完全空项目一开始就急着写很复杂的 `CLAUDE.md`。

更好的方式是：项目有了基本形状后，再让它总结。

## Auto Memory 自动记忆

除了你主动写的 `CLAUDE.md`，Claude Code 还有自动记忆能力。

它会在使用过程中，把一些偏好、反馈、项目进度、外部资源索引记录下来。

比如你对它说：

```text
以后这个项目不要使用浅色 UI，我更喜欢深色、高对比、偏科技感的界面。
```

它可能会把这类偏好写入记忆文件。

自动记忆和 `CLAUDE.md` 的区别是：

- `CLAUDE.md` 是你主动立下的规则，优先级更高
- Auto Memory 是使用过程中逐渐积累的经验，按需注入

如果它记错了，你应该及时让它删除或修正。

## 用 /memory 管理记忆

`/memory` 可以帮助你查看和管理记忆相关内容。

你可以用它打开全局规则、项目规则或自动记忆。

建议定期检查记忆文件。

原因很简单：记忆不是越多越好，错误记忆会持续影响后续工作。

## 自己构建项目知识库

很多所谓 Agent 记忆，本质上都是：在合适的时候注入合适的上下文。

所以你也可以自己构建知识库。

比如一个产品项目里，你可以新建：

```text
docs/brand-guide.md
docs/copywriting-style.md
docs/product-rules.md
docs/user-persona.md
```

然后在 `CLAUDE.md` 里写：

```markdown
当你修改 UI 时，请参考 docs/brand-guide.md。
当你写页面文案时，请参考 docs/copywriting-style.md。
当你判断功能取舍时，请参考 docs/product-rules.md。
```

这样 Claude Code 就会在需要时读取对应资料，而不是每次都把所有内容塞进上下文。

这就是更可控的“长期记忆”。

## 个性化的原则

不要把所有内容都塞进 `CLAUDE.md`。

更好的分工是：

- 全局 `CLAUDE.md` 写个人通用偏好
- 项目 `CLAUDE.md` 写项目规则和常用命令
- Auto Memory 记录过程中积累的反馈
- `docs/` 文档保存大块背景知识
- Skill 保存可复用的专业流程

这样既能让 Claude Code 更懂你，又不会一开始就把上下文塞爆。

下一篇：[Claude Code 完全教程 07：高级拓展一 Skill](/2026/05/06/claude-code-07-skill/)
