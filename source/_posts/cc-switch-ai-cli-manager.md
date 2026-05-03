---
title: CC Switch：一个统一管理 Claude Code、Codex 和 Gemini CLI 的开源工具
slug: cc-switch-ai-cli-manager
date: 2026-05-03 15:30:00
categories:
  - 开源项目分享
tags:
  - GitHub
  - 开源项目
  - AI工具
  - Claude Code
  - Codex
  - Gemini CLI
description: CC Switch 是一个跨平台桌面管理器，用来统一管理 Claude Code、Codex、Gemini CLI、OpenCode 和 OpenClaw 等多种 AI 编程 CLI 工具。
keywords:
  - CC Switch
  - Claude Code
  - Codex
  - Gemini CLI
  - OpenCode
  - OpenClaw
  - AI 编程工具
  - MCP
cover: /img/cc-switch.png
---

如果你同时用过 Claude Code、Codex、Gemini CLI、OpenCode 或 OpenClaw，大概率会遇到一个很烦的问题：**AI CLI 工具越来越多，但配置管理越来越碎**。

不同工具有不同的配置格式。有人用 JSON，有人用 TOML，有人还要改 `.env`。换一个 API 服务商，切一个模型，改一个代理地址，本来只是一个很小的动作，最后却变成了到处翻配置文件。

**CC Switch** 想解决的就是这个问题。它不是另一个 AI 编程助手，而是一个统一管理多个 AI 编程 CLI 的跨平台桌面工具。

项目地址：<https://github.com/farion1231/cc-switch>

<!--more-->

## 项目简介

**CC Switch** 是一个面向 AI CLI 用户的开源桌面管理器，支持统一管理：

- Claude Code
- Codex
- Gemini CLI
- OpenCode
- OpenClaw

它基于 Tauri 2 构建，支持 Windows、macOS 和 Linux。技术栈包括 React 18、TypeScript、Vite、TailwindCSS、TanStack Query、Rust、tokio 和 sqlite/rusqlite。项目采用 MIT 许可证，研究时版本为 3.14.1。

从定位上看，它更像是 AI 编程工具链里的“控制面板”。

你不一定每天都打开它写代码，但当你需要切换服务商、管理 MCP、同步提示词、查看用量、整理工作区时，它能把很多原本分散的动作收拢到一个地方。

## 它解决的是配置混乱，不是模型能力问题

现在很多 AI 编程 CLI 的体验已经不错了。真正麻烦的地方，往往不是“能不能用”，而是“怎么稳定地用”。

比如你可能会遇到这些情况：

- Claude Code 用一套配置
- Codex 用另一套配置
- Gemini CLI 还有自己的环境变量
- OpenCode 和 OpenClaw 又有不同的扩展和工作区习惯
- 公司网络、家庭网络、海外服务、社区转发节点还要来回切

如果每次切换都要手动改文件，这套工作流很快就会变得不可维护。

CC Switch 的价值就在这里。它没有试图替代这些 CLI，而是站在更上层，把配置、服务商、代理、MCP、Skills、Prompts 和会话管理整合起来。

这类工具的意义不是炫技，而是减少心智负担。

## 核心功能

### 1）一个应用管理五类 AI CLI

CC Switch 支持 Claude Code、Codex、Gemini CLI、OpenCode 和 OpenClaw。对经常试用不同 AI 编程工具的人来说，这一点很实际。

很多工具单独看都不复杂，但放在一起就会乱。CC Switch 把它们放进同一个桌面应用里管理，至少能让你少记几套配置路径和文件格式。

它还支持安装和登录确认、禁用签名、插件扩展同步等能力。对于本来就会折腾 CLI 的用户来说，这些细节比单纯的“好看界面”更重要。

### 2）服务商切换更像正常产品功能

CC Switch 提供 50 多个服务商预设，包括 AWS Bedrock、NVIDIA NIM 和一些社区服务商。

它支持 provider management、universal providers、一键切换、拖拽排序、导入导出，也支持托盘区快速切换。

这解决的是一个很具体的痛点：不同 AI CLI 通常不是为多服务商频繁切换设计的。你当然可以手动改配置，但每次都改 JSON、TOML 或 `.env`，迟早会出错。

如果你的日常工作需要在官方 API、企业网关、社区 provider 和本地代理之间切换，这个功能会很有用。

### 3）代理、故障切换和可用性管理

AI CLI 的稳定性很多时候不只取决于模型，还取决于网络和服务商。

CC Switch 提供本地代理热切换、格式转换、failover、circuit breaker、健康监控，以及应用级代理接管。

这部分能力很关键。

因为对真实用户来说，“偶尔能跑通”没有太大意义。写代码时最怕的是工具突然不可用，或者某个服务商状态不稳定。CC Switch 把代理、失败切换和健康检查做成一组管理能力，本质上是在提高整套 AI CLI 工作流的可用性。

它不保证每个服务都永远稳定，但至少给了你一个集中处理问题的入口。

### 4）MCP、Prompts 和 Skills 统一管理

MCP 现在已经是 AI 工具链里绕不开的一层。问题是，不同工具对 MCP、提示词和技能的组织方式也不一样。

CC Switch 支持统一 MCP 和 Skills 管理，并提供双向同步。它还覆盖 Prompts 管理，支持从 GitHub 或 ZIP 安装相关内容。

这对重度用户很重要。

因为 AI CLI 的差异，正在从“模型差异”变成“上下文和扩展生态差异”。你积累的 MCP、Prompts、Skills 越多，越不希望它们被锁在某一个工具里。

CC Switch 的思路是把这些资产尽量抽出来管理，让它们可以在不同 CLI 工具之间更容易复用。

### 5）用量和成本追踪

很多人刚开始用 AI 编程工具时，并不会认真看成本。等到账单来了，才发现请求数、token 和模型价格其实都需要管理。

CC Switch 提供用量和成本追踪，包括花费、请求次数、token、趋势、请求日志，以及自定义模型价格。

这不是一个花哨功能，而是一个很现实的功能。

如果你只是偶尔用 CLI 写点代码，可能感知不强。但如果你把 AI CLI 放进日常开发流程，或者团队里多人一起使用，不看成本就很容易失控。

### 6）会话和工作区管理

CC Switch 还提供 session manager，并带有 OpenClaw workspace editor。

这说明它不只是做配置切换，也在往更完整的工作流管理方向走。对 OpenClaw 用户来说，工作区编辑器尤其值得关注，因为它能让桌面管理器和具体 Agent 工作区之间形成更直接的连接。

此外，它还支持 Deep Link `ccswitch://`、自动更新、原子写入、自动备份和 i18n。这些听起来不像核心卖点，但对桌面工具来说很重要。

配置工具最怕什么？

不是功能少，而是写坏配置。

原子写入和自动备份这类能力，恰恰是在降低这种风险。

## 安装方式

CC Switch 提供多平台安装方式。

macOS 可以通过 Homebrew 安装：

```bash
brew tap farion1231/ccswitch
brew install --cask cc-switch
```

更新：

```bash
brew upgrade --cask cc-switch
```

Arch Linux 用户可以使用：

```bash
paru -S cc-switch-bin
```

Windows 可以通过 GitHub Releases 下载 MSI 或 Portable 版本。Linux 则提供 deb、rpm 和 AppImage。

系统要求方面，Windows 需要 Windows 10 及以上，macOS 需要 12 及以上，Linux 侧写明支持 Ubuntu 22.04+、Debian 11+、Fedora 34+ 等环境。

需要注意的是，Flatpak 不是官方发布渠道。

## 适合谁用

我觉得 CC Switch 最适合三类人。

第一类，是同时使用多个 AI 编程 CLI 的开发者。你不一定每天都在五个工具之间来回跳，但只要你经常比较 Claude Code、Codex、Gemini CLI、OpenCode 和 OpenClaw，统一管理就有价值。

第二类，是经常切换 API 服务商的人。比如你会在官方 provider、企业代理、AWS Bedrock、NVIDIA NIM 和社区服务之间切换，那 CC Switch 的 50 多个预设和一键切换就很实用。

第三类，是已经开始沉淀 MCP、Prompts 和 Skills 的重度用户。对这类人来说，真正贵的不是工具本身，而是自己积累出来的配置资产。

如果你只用一个 CLI，只接一个官方 API，也不折腾 MCP，那 CC Switch 可能会显得有点重。直接用原工具就够了。

## 局限与现实问题

这类工具也不能只看优点。

首先，大多数工具在切换配置后仍然需要重启终端或 CLI 才能生效。README 中提到 Claude Code 支持 provider 热切换，但不要默认所有工具都有同样体验。

其次，活动中的 provider 不能删除。这是合理限制，但如果你在整理配置时遇到它，需要先切到其他 provider。

再者，跨平台不等于完全无差异。Windows、macOS、Linux 的安装包和系统权限环境不同，实际体验可能会受系统版本、网络环境和 CLI 本身行为影响。

最后，CC Switch 管的是配置和工作流，不是替你判断哪个模型更好。模型质量、价格、可用性，还是需要你自己根据场景选择。

## 我的评价

CC Switch 最有价值的地方，不是“又做了一个 AI 工具”，而是它看到了 AI 编程工具使用中的一个真实问题：**工具越多，配置越乱**。

很多 AI 产品喜欢把重点放在模型能力、Agent 能力、自动写代码能力上。那些当然重要。但真正长期使用时，配置、切换、成本、代理、扩展和工作区管理，才是每天都会碰到的摩擦。

CC Switch 做的是一件不性感但很必要的事：把这些摩擦集中处理。

我不会把它推荐给所有人。轻度用户没必要为了“统一管理”再加一个管理器。但如果你已经同时使用 Claude Code、Codex、Gemini CLI、OpenCode 或 OpenClaw，并且经常改 provider、调代理、装 MCP、看用量，那这个项目值得收藏和试用。

它代表了一类很有前景的开源工具方向：不是替代 AI CLI，而是管理 AI CLI 生态。

随着 AI 编程工具继续增多，这类“工具链控制台”只会越来越重要。

## 延伸阅读

- 如果你正在关注 AI Agent 工具链，也可以继续看 [ClawX：把 OpenClaw AI Agent 变成人人可用的桌面应用](/2026/03/13/clawx-desktop-ai-agent/)
- 如果你想看偏桌面创作工具的开源项目，可以继续看 [OpenScreen：一个值得关注的开源 Screen Studio 替代方案](/2026/05/02/openscreen-open-source-screen-studio-alternative/)
