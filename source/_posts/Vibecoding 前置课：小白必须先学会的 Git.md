---
title: Vibecoding 前置课：小白必须先学会的 Git
slug: vibecoding-git-beginner-guide
date: 2026-05-03 00:00:00
categories:
  - Vibecoding
tags:
  - Git
  - GitHub
  - Vibecoding
  - AI编程
  - 新手教程
  - Cursor
cover: /img/Git.png
---

## 写在前面：为什么小白必须先学 Git？

如果你准备用 Cursor、Trae、Claude Code、OpenCode 这类 AI 工具写代码，Git 不是"程序员才需要学的高级工具"。

Git 是你的存档系统。

对小白来说，Vibecoding 最大的问题不是"AI 写不出来"，而是：

> AI 一顿操作之后，项目突然坏了，你不知道怎么回去。

所以这篇文章不教复杂 Git 工作流，也不讲团队协作黑话。只讲 Vibecoding 小白真正需要的那一套：**安装、保存进度、回退版本、开分支试错、上传云端**，以及**怎么让 AI 帮你安全使用 Git**。

---

## 1. Git 是干嘛的？

Git 是一个"代码版本管理工具"。你可以把它理解成游戏里的存档系统：

- 写代码前，先存一个档
- AI 改完一版，觉得还不错，再存一个档
- 改崩了，回到上一个档
- 想试一个新功能，但不想污染主线，开一个新存档
- 想把项目放到云端，上传到 GitHub

不用 Git 的 Vibecoding，很像不存档打游戏。AI 生成代码很快，但也很容易"一次改太多"。你看不懂它改了什么，也不知道哪里开始坏的。

Git 的价值就是让你随时能说：

> 停，回到刚才那个还能跑的版本。

---

## 2. 零基础安装 Git

### Windows 安装

打开官网下载安装包：

```text
https://git-scm.com/downloads
```

一路默认安装即可。安装完成后，在终端（PowerShell / CMD / Cursor 终端）输入：

```bash
git --version
```

如果看到类似 `git version 2.x.x`，说明安装成功。

### macOS 安装

打开终端输入：

```bash
git --version
```

如果没装，系统通常会提示安装 Xcode Command Line Tools，按提示安装即可。也可以用 Homebrew：

```bash
brew install git
```

### Linux 安装

Ubuntu / Debian：

```bash
sudo apt update
sudo apt install git
```

安装后同样执行 `git --version` 验证。

---

## 3. 初始化配置：告诉 Git 你是谁

第一次使用 Git，需要配置用户名和邮箱。这个邮箱最好和你的 GitHub 邮箱一致。

```bash
git config --global user.name "你的名字"
git config --global user.email "你的邮箱@example.com"
```

查看配置是否成功：

```bash
git config --global --list
```

你应该能看到 `user.name` 和 `user.email` 两个字段。

---

## 4. Git 的 4 个核心概念

小白最容易被 Git 的名词吓住。其实只需要先理解这 4 个区域。

### 工作区

工作区就是你现在正在编辑的项目文件夹。你修改代码的地方，就是工作区。

> 工作区 = 你正在改的地方。

### 暂存区

暂存区可以理解成"准备提交的清单"。你可能改了 10 个文件，但这次只想保存其中 3 个，就可以只把这 3 个放进暂存区。

```bash
git add 文件名   # 添加单个文件
git add .        # 添加所有修改
```

> 暂存区 = 这次准备存档的内容。

### 本地仓库

本地仓库就是你电脑里的 Git 存档记录。执行 `git commit` 后，Git 会在你电脑里保存一个版本。

> 本地仓库 = 你电脑上的历史存档。

### 远程仓库

远程仓库就是云端代码仓库，比如 GitHub、Gitee、GitLab。执行 `git push` 后，本地代码会上传到云端。

> 远程仓库 = 云端备份和分享地址。

---

## 5. 本地基础操作：小白够用版

### 初始化 Git 仓库

在项目根目录执行：

```bash
git init
```

这表示：从现在开始，这个文件夹交给 Git 管理。执行后会生成一个隐藏文件夹 `.git`，不要手动删除它。

### 查看当前状态

这是最常用的命令之一，小白可以养成习惯：每次不知道发生了什么，就先敲 `git status`。

```bash
git status
```

它会告诉你：哪些文件被修改了、哪些文件还没被 Git 跟踪、哪些文件已经放进暂存区、当前有没有东西可以提交。

### 把修改加入暂存区

```bash
git add .
```

### 提交一个版本

```bash
git commit -m "初始化项目"
git commit -m "完成登录页面"
git commit -m "修复按钮点击无反应的问题"
```

提交信息不需要很高级，但要能让未来的你看懂。差的提交信息是 `git commit -m "update"`。

### 查看历史记录

```bash
git log --oneline
```

你会看到类似：

```text
a1b2c3d 修复登录按钮问题
e4f5g6h 完成首页布局
i7j8k9l 初始化项目
```

每一行就是一个存档点。前面的 `a1b2c3d` 是版本 ID（也叫 commit hash），回退时会用到。

---

## 6. 小白救命功能：版本回溯

这是 Vibecoding 的重中之重。AI 写代码最常见的灾难：本来能跑，让 AI 加一个功能，AI 改了很多文件，项目跑不起来了，你不知道怎么恢复。

### 文件改乱了但还没提交

查看当前改了啥：

```bash
git diff
```

丢弃某个文件的修改：

```bash
git restore 文件名
```

丢弃所有未提交修改（**谨慎**）：

```bash
git restore .
```

### 刚提交了一个坏版本

撤销最近一次提交，但保留代码修改：

```bash
git reset --soft HEAD~1
```

彻底回到上一个版本，连代码修改也不要（**谨慎**）：

```bash
git reset --hard HEAD~1
```

### 回到某个历史版本

先看历史：

```bash
git log --oneline
```

假设你想回到 `e4f5g6h`：

```bash
git reset --hard e4f5g6h
```

### 更安全的方式：不破坏历史

```bash
git revert 版本ID
```

它会创建一个新提交来抵消之前那次修改，不会删除历史。**如果你已经把代码上传到 GitHub，优先用 `git revert`，不要随便 `reset --hard`。**

---

## 7. 分支入门：只学够用，不学复杂流程

分支可以理解成"复制一条时间线出来试错"。主分支一般叫 `main`，稳定可运行的版本放在 `main`。想试新功能时，不要直接在 `main` 上改，开一个新分支。

### 创建并切换分支

```bash
git switch -c feature-login
```

### 查看当前分支

```bash
git branch
```

当前分支前面会有 `*`。

### 切回主分支

```bash
git switch main
```

### 合并分支

`feature-login` 分支测试没问题后：

```bash
git switch main
git merge feature-login
```

### 删除分支

```bash
git branch -d feature-login   # 已合并的
git branch -D feature-login   # 彻底不要了
```

小白记住这套就够了：

```bash
git switch -c 新功能分支
# 让 AI 改代码
git add .
git commit -m "完成某某功能"
git switch main
git merge 新功能分支
```

---

## 8. 远程仓库：把代码上传云端

本地 Git 只能保护你当前电脑里的代码。如果电脑坏了、文件丢了，还是危险。

### 第一步：创建 GitHub 仓库

打开 [github.com](https://github.com)，登录后点击 New repository，填写仓库名（如 `my-vibecoding-project`），先不要勾选初始化 README，创建空仓库即可。

### 第二步：关联远程仓库

GitHub 会给你一个地址，比如：

```text
https://github.com/yourname/my-vibecoding-project.git
```

在本地项目里执行：

```bash
git remote add origin https://github.com/yourname/my-vibecoding-project.git
```

查看是否关联成功：

```bash
git remote -v
```

### 第三步：上传代码

第一次上传：

```bash
git branch -M main
git push -u origin main
```

以后再上传只需要 `git push`。

### 第四步：从云端拉取代码

换电脑或者 GitHub 上有更新的情况：

```bash
git pull
```

> `push` 是上传，`pull` 是下载同步。

---

## 9. Vibecoding 专属 Git 使用套路

### 套路一：每次让 AI 大改之前，先存档

```bash
git status
git add .
git commit -m "开始修改前的稳定版本"
```

然后再让 AI 改。就算改崩了也可以回退。

### 套路二：每完成一个能跑的小功能，就提交一次

不要等一天结束才提交。推荐节奏：完成首页→提交，完成登录页→提交，修复报错→提交，接入接口→提交，调整样式→提交。

### 套路三：让 AI 改代码前，先让它读 Git 状态

你可以对 AI 说：

```text
先运行 git status 和 git diff，理解当前改动，不要覆盖我已有修改。
```

### 套路四：AI 改完后，不要马上提交

先运行项目确认没问题：

```bash
npm run dev   # 或 npm run build
```

确认能跑通再提交：

```bash
git add .
git commit -m "完成登录功能"
```

### 套路五：高风险功能用分支试错

例如你想让 AI 重构整个项目、替换 UI 框架、接入登录系统、改数据库结构、接入支付功能——先开分支：

```bash
git switch -c experiment-login
```

让 AI 在分支里改。成功再合并，失败就删掉。

### 套路六：每天结束前上传 GitHub

```bash
git status
git add .
git commit -m "保存今日进度"
git push
```

---

## 10. Vibecoding 小白 Git 最小学习路线 + AI 提示词

如果你是零基础，不要一上来学完整 Git 教程。你只需要先掌握下面这套"够用路线"。**每个命令都配有含义、使用时机，以及你可以在 Cursor / Trae / Claude Code / OpenCode 里直接复制给 AI 的提示词。**

---

### ① `git init` —— 初始化仓库

**含义**：初始化 Git 仓库，让当前项目文件夹开始被 Git 管理。

**什么时候用**：你新建了一个项目，想开始保存版本。

```bash
git init
```

> 给 AI 的提示词：

```text
请帮我检查当前项目是否已经初始化 Git。如果还没有，请执行 git init。执行前先说明这个命令的作用。
```

---

### ② `git status` —— 查看当前状态

**含义**：查看当前 Git 状态，包括哪些文件被修改、哪些文件还没提交、哪些文件在暂存区。

**什么时候用**：**任何时候不知道项目现在是什么状态，都先用它。** 这是你使用频率最高的命令。

```bash
git status
```

> 给 AI 的提示词：

```text
请先运行 git status，告诉我当前项目有哪些文件被修改、哪些文件未跟踪、是否有内容等待提交。不要做任何修改。
```

---

### ③ `git diff` —— 查看具体改了什么

**含义**：查看当前文件具体改了什么内容。

**什么时候用**：AI 改完代码后，你想知道它到底改了哪些内容。

```bash
git diff
```

> 给 AI 的提示词：

```text
请运行 git diff，总结这次具体改动了什么。请用小白能听懂的话解释，不要直接提交。
```

---

### ④ `git add .` —— 加入暂存区

**含义**：把当前所有修改加入暂存区，表示"这些内容准备提交"。

**什么时候用**：你确认这些改动没问题，准备保存一个版本。

```bash
git add .
```

> 给 AI 的提示词：

```text
请先运行 git status 和 git diff，确认当前改动没有问题，也没有 .env、密钥、账号密码等敏感文件。确认后再执行 git add .。
```

---

### ⑤ `git commit -m "提交说明"` —— 正式存档

**含义**：正式保存一个版本，相当于"存档"。

**什么时候用**：完成一个小功能、修复一个问题、或者 AI 改完后项目能正常运行。

```bash
git commit -m "完成首页布局"
```

> 给 AI 的提示词：

```text
请帮我提交当前改动。提交前先检查 git status 和 git diff，确认没有敏感文件。然后用清晰的中文 commit message 提交，说明这次改动完成了什么。
```

---

### ⑥ `git log --oneline` —— 查看历史版本

**含义**：查看历史提交记录，每一行是一个版本。

**什么时候用**：你想找回之前的稳定版本，或者查看项目改动历史。

```bash
git log --oneline
```

> 给 AI 的提示词：

```text
请运行 git log --oneline，帮我找出最近几个版本分别做了什么，并判断哪个可能是稳定版本。不要执行回退命令。
```

---

### ⑦ `git restore .` —— 放弃未提交修改

**含义**：丢弃当前所有未提交修改，让文件回到最近一次提交时的状态。

**什么时候用**：AI 刚刚改坏了项目，而且这些修改还没有提交。

```bash
git restore .
```

> 给 AI 的提示词：

```text
项目刚刚被改坏了。请先运行 git status 和 git diff，判断当前修改是否可以丢弃。不要直接执行 git restore .，先告诉我会丢失哪些内容，等我确认后再操作。
```

---

### ⑧ `git reset --hard 版本ID` —— 强制回退到历史版本

**含义**：强制回到某个历史版本，并丢弃之后的修改。

**什么时候用**：项目已经彻底改坏，需要回到之前能运行的版本。

⚠️ **这是高风险命令，会丢弃代码。**

```bash
git reset --hard e4f5g6h
```

> 给 AI 的提示词：

```text
项目现在坏了，我想回到之前的稳定版本。请先运行 git log --oneline 和 git status，帮我分析应该回退到哪个版本。禁止直接执行 git reset --hard，必须等我确认版本 ID 后再操作。
```

---

### ⑨ `git switch -c 分支名` —— 创建并切换分支

**含义**：创建并切换到一个新分支。

**什么时候用**：你想让 AI 尝试一个高风险功能，但不想影响主分支。

```bash
git switch -c experiment-login
```

> 给 AI 的提示词：

```text
我要尝试一个高风险功能。请先创建一个新分支，不要在 main 上直接修改。分支名用 功能描述。创建后告诉我当前所在分支。
```

---

### ⑩ `git push` —— 上传到云端

**含义**：把本地提交上传到远程仓库，比如 GitHub。

**什么时候用**：你想把代码备份到云端，或者同步给其他设备。

```bash
git push
```

第一次上传通常需要：

```bash
git push -u origin main
```

> 给 AI 的提示词：

```text
请帮我把当前项目上传到 GitHub。先检查 git remote -v、git status 和是否有敏感文件。确认没有问题后，再执行 git push。如果还没有远程仓库，请先告诉我需要创建 GitHub 仓库。
```

---

### 终极万能提示词：贴在 AI 对话开头

如果你只想记一段，就把下面这段话贴在每次和 AI 对话的开头：

```text
你现在是我的 Git 助手。每次操作前，请先运行 git status 和 git diff，解释当前项目状态。不要覆盖我的已有修改。不要执行 git reset --hard、git clean、git push --force、git branch -D 等高风险命令，除非我明确确认。每次提交前，请检查是否包含 .env、密钥、账号密码等敏感文件，并帮我写清晰的中文提交信息。
```

---

这 10 个命令掌握后，你就已经能应对 80% 的 Vibecoding 场景。Git 不需要一开始学得很深。你最需要的不是理解所有底层原理，而是形成一个习惯：

> 每次让 AI 大改之前，先提交一个稳定版本。

---

## 11. 有没有 Git 相关 CLI 可以让 AI 使用？

有，而且非常建议让 AI 使用这些 CLI。

### Git CLI（基础必备）

最基础的就是 Git 自带的命令行。Cursor、Trae、Claude Code、OpenCode 这类 AI 编程工具通常都可以在终端里调用 Git CLI。

### GitHub CLI：gh

GitHub 官方 CLI，安装地址：[cli.github.com](https://cli.github.com)

安装后登录：

```bash
gh auth login
```

常用功能：

```bash
gh repo create my-project --public          # 创建 GitHub 仓库
gh pr create --title "添加登录功能"         # 创建 Pull Request
gh pr list                                   # 查看 PR 列表
gh issue list                                # 查看 Issue
```

如果你以后做开源项目、PR、Issue 管理，`gh` 很有用。

### GitHub MCP / Git MCP

如果你使用支持 MCP 的 AI 工具，还可以接入 GitHub MCP 或 Git MCP。MCP 可以理解成"让 AI 更安全、更结构化地调用外部工具的接口"。

不过对小白来说，一开始不必折腾 MCP。优先级：**先学 Git CLI → 再学 GitHub CLI → 最后再考虑 MCP**。

### AI 工具内置 Git 能力

很多 AI 编程工具本身也能帮你操作 Git。比如 Cursor 可以读终端和文件变更，Claude Code / OpenCode 可以运行 Git 命令、查看 diff、提交代码。但你要记住一条底线：

> AI 可以帮你操作 Git，但你要让它先解释它准备做什么。

---

## 写在最后

Vibecoding 的核心不是"让 AI 一次写对"，而是"**让 AI 快速试错，同时你永远有路可退**"。

Git 就是这条退路。先记住这 10 个命令和对应提示词，你就已经比大多数 Vibecoding 小白安全了。
