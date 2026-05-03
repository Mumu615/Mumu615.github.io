---
title: Hexo + Solitude + GitHub Pages 小白完整搭建教程
slug: hexo-solitude-github-pages-beginner-complete-guide
date: 2026-05-02 21:20:00
categories:
  - 建站教程
tags:
  - Hexo
  - Solitude
  - GitHub Pages
  - 博客搭建
  - 新手教程
cover: /img/Hexo.png
---

# Hexo + Solitude + GitHub Pages 小白完整搭建教程（终极版）

**🎯 目标**：手把手带你从零开始，搭建一个**完全免费**、快速优雅的个人博客。全程只需复制粘贴命令，跟着做就能成功。

**📦 最终效果**：访问 `https://你的用户名.github.io`，就能看到属于你自己的博客网站。

---

## 目录

1. [准备工作](#一准备工作)  
2. [安装与初始化 Hexo](#二安装并初始化-hexo)  
3. [第一篇文章](#三开始你的第一篇文章)  
4. [安装与配置 Solitude 主题](#四安装与配置-solitude-主题)  
5. [部署到 GitHub Pages](#五部署到-github-pages)  
6. [日常工作流与一键部署](#六日常工作流与一键部署)  
7. [进阶技巧](#七进阶技巧)  
8. [常见问题排查](#八常见问题排查)

---

## 一、准备工作

### 1.1 安装必备软件

| 软件            | 作用                    | 安装方法                                                     | 验证命令              |
| :-------------- | :---------------------- | :----------------------------------------------------------- | :-------------------- |
| **Git**         | 版本管理、部署到 GitHub | **Windows/Mac**：官网下载安装包 [git-scm.com](https://git-scm.com/)；**Linux (Ubuntu/Debian)**：`sudo apt install git-core` | `git --version`       |
| **Node.js**     | Hexo 运行环境           | 官网下载 **LTS 长期支持版** [nodejs.org/zh-cn](https://nodejs.org/zh-cn/)，安装时务必勾选 **Add to PATH** | `node -v`<br>`npm -v` |
| **GitHub 账号** | 免费托管博客代码        | 在 [github.com](https://github.com) 注册，记住你的**用户名**，稍后会用到。 | 无                    |

> 💡 **小贴士**：如果下载慢，可以搜索“Node.js 国内镜像”加速。Windows 用户安装 Git 时，一路默认选项即可。

### 1.2 配置 Git 用户信息（根据个人情况修改）

打开终端（Windows 搜索“命令提示符”或“PowerShell”，Mac/Linux 叫“终端”），输入：

```bash
git config --global user.name "你的GitHub用户名"
git config --global user.email "你的GitHub邮箱"
```

这两条命令只需要设置一次，会让你的代码提交带上身份签名。

### 1.3 配置 SSH 密钥（与 GitHub 建立加密连接）

这是**打通本地电脑和 GitHub 的钥匙**，必须配置好，否则后面无法推送代码。

**① 生成密钥（使用更安全的 ed25519 算法）**

```bash
ssh-keygen -t ed25519 -C "你的GitHub邮箱"
```

命令执行后，连续按 **三次回车键**（不要设置密码，否则每次部署都要输密码）。

**② 复制公钥内容**

- **Windows**：密钥文件在 `C:\Users\你的用户名\.ssh\id_ed25519.pub`，用记事本打开。
- **Mac / Linux**：终端执行 `cat ~/.ssh/id_ed25519.pub`，直接显示公钥内容。

复制整个公钥（以 `ssh-ed25519` 开头，以邮箱结尾）。

**③ 添加到 GitHub**

1. 登录 GitHub，点击右上角头像 → **Settings**。
2. 左侧菜单找到 **SSH and GPG keys** → 点击绿色按钮 **New SSH key**。
3. **Title** 随便填，比如“我的电脑”。
4. 在 **Key** 栏粘贴刚才复制的公钥。
5. 点击 **Add SSH key**。

**④ 验证连接是否成功**

在终端输入：

```bash
ssh -T git@github.com
```

如果出现 `Hi 你的用户名! You've successfully authenticated...` 就表示成功了。  
如果提示 `Permission denied`，请重新检查前面步骤。

---

## 二、安装并初始化 Hexo

### 2.1 全局安装 Hexo 命令行工具

```bash
npm install -g hexo-cli
```

安装完成后可以输入 `hexo -v` 查看版本，确认安装成功。

### 2.2 创建你的博客项目

这里 `my-blog` 是文件夹名称，可以随便起，例如 `blog`、`hexo-site` 都行。

```bash
hexo init my-blog
```

这条命令会自动创建 `my-blog` 文件夹，并下载好所有必需文件。

**进入项目目录并安装依赖**：

```bash
cd my-blog
npm install
```

### 2.3 本地预览（看看博客长什么样）

依次执行以下三个命令（即使没有手动写文章，Hexo 也会生成一篇示例文章）：

```bash
hexo clean      # 清除缓存
hexo generate   # 生成静态网页文件（可简写为 hexo g）
hexo server     # 启动本地服务器（可简写为 hexo s）
```

打开浏览器，访问 **http://localhost:4000**，你会看到一个默认的 Hexo 博客页面。按 `Ctrl + C` 可以停止预览。

### 2.4 了解项目文件结构（重要！）

进入 `my-blog` 文件夹，你会看到如下结构，先有个印象，会很有用：

| 文件/文件夹      | 说明                                                       |
| :--------------- | :--------------------------------------------------------- |
| `_config.yml`    | **博客主配置文件**（网站标题、作者、部署信息等都在这里改） |
| `source/_posts/` | **所有博客文章都放在这里**，Markdown 格式（`.md`）         |
| `themes/`        | **主题文件夹**，下载好的主题放在这里面                     |
| `public/`        | 执行 `hexo g` 后生成的最终网站文件，这就是部署到线上的内容 |
| `node_modules/`  | 项目依赖包，**不要手动修改**                               |
| `scaffolds/`     | 文章模板，一般不需要动                                     |

---

## 三、开始你的第一篇文章

### 3.1 创建新文章

```bash
hexo new "你好，世界"
```

执行后会在 `source/_posts/` 下生成 `你好-世界.md` 文件，用任意文本编辑器打开它（推荐 VS Code 或记事本）。

### 3.2 文章格式说明

文件的开头有一段被 `---` 包裹的内容，这叫 **Front-matter**，用于定义文章属性，必不可少：

```markdown
---
title: 你好，世界
date: 2025-04-03 10:00:00
tags: [生活, 教程]
categories: 日记
---
这里开始是正文，可以用 Markdown 语法自由书写。
```

- `title`：文章标题。
- `date`：发布时间，可随意修改（时区一般不影响）。
- `tags`：标签，多个标签用 `[标签1, 标签2]` 的形式。
- `categories`：分类，一篇文章只能属于一个分类。

正文部分使用标准的 Markdown 语法编写即可，比如 `#` 表示一级标题，`**文本**` 表示加粗等。

### 3.3 创建独立页面（如“关于我”）

```bash
hexo new page about
```

这会在 `source/about/` 下创建一个 `index.md` 文件，编辑后就可以通过 `https://你的域名/about` 访问。

---

## 四、安装与配置 Solitude 主题

### 4.1 为什么选择 Solitude？

Solitude 是一款专为极简与高性能设计的 Hexo 主题，亮点包括：

- ⚡ 加载速度快，支持懒加载
- 🌗 内置暗黑/明亮模式切换
- 💬 支持多种评论系统集成
- 📈 良好的 SEO 基础优化

### 4.2 安装主题

进入博客根目录（`my-blog`）执行。推荐使用 Git 克隆的方式，方便后续用 `git pull` 一键更新。

**方法一：Git 克隆（推荐）**

```bash
git clone https://github.com/everfu/hexo-theme-solitude.git themes/solitude
```

**方法二：npm 安装（备选）**

```bash
npm install hexo-theme-solitude --save
```

> 使用 npm 安装后，主题文件会放在 `node_modules/hexo-theme-solitude` 中，无需放进 `themes` 目录。

### 4.3 安装主题依赖的渲染器

Solitude 使用 Pug 和 Stylus 模板引擎，必须安装它们：

```bash
npm install hexo-renderer-pug hexo-renderer-stylus --save
```

### 4.4 启用主题

打开博客根目录下的 `_config.yml`（用记事本或代码编辑器），找到 `theme` 字段，修改为：

```yaml
theme: solitude
```

### 4.5 配置主题（核心）

主题的默认配置文件在 `themes/solitude/_config.yml.example`，我们需要把这份配置复制一份到博客根目录，然后进行个性化修改。**这样做的好处是升级主题时，你的自定义设置不会被覆盖。**

**复制配置文件（根据你的安装方式选择一条命令）：**

```bash
# 如果你用的是 Git 克隆方式
cp themes/solitude/_config.yml.example _config.solitude.yml

# 如果你用的是 npm 安装方式
cp node_modules/hexo-theme-solitude/_config.yml.example _config.solitude.yml
```

**打开 `_config.solitude.yml`，按需修改以下关键配置（使用表格方便查阅）：**

| 配置项     | 作用             | 建议修改值示例                                 |
| :--------- | :--------------- | :--------------------------------------------- |
| `title`    | 网站大标题       | `"小明的技术空间"`                             |
| `subtitle` | 副标题           | `"记录学习与成长"`                             |
| `author`   | 侧边栏作者名     | `"小明"`                                       |
| `avatar`   | 头像图片链接     | `https://example.com/avatar.jpg`（或本地路径） |
| `favicon`  | 浏览器标签小图标 | `https://example.com/favicon.ico`              |
| `menu`     | 导航栏菜单       | 按文档示例添加页面链接                         |
| `social`   | 侧边栏社交链接   | 填入 GitHub、微博等主页地址                    |

> 文件内格式为 YAML，**冒号后面一定要加一个空格**，比如 `title: 我的博客`，否则会报错。

### 4.6 预览主题效果

修改完配置后，保存文件，然后执行：

```bash
hexo clean && hexo s
```

再次访问 `http://localhost:4000`，博客已经换上了 Solitude 的新装。继续修改配置文件并刷新页面，能看到实时变化。

---

## 五、部署到 GitHub Pages

现在，我们要把本地这个漂亮的博客发布到互联网上。

### 5.1 创建 GitHub 仓库

1. 登录 GitHub，点击右上角的 **+** → **New repository**。
2. **仓库名称**必须严格填写为：**`你的用户名.github.io`**  
   （例如用户名是 `zhangsan`，就填 `zhangsan.github.io`）
3. 可见性选择 **Public**（公开）。
4. **⚠️ 千万不要勾选 “Add a README file”**，否则会导致后续推送冲突。
5. 点击 **Create repository**。

### 5.2 安装部署插件

在博客根目录下执行：

```bash
npm install hexo-deployer-git --save
```

### 5.3 配置部署信息

打开根目录的 `_config.yml`，找到文件末尾的 `deploy` 部分，修改为：

```yaml
deploy:
  type: git
  repo: git@github.com:你的用户名/你的用户名.github.io.git
  branch: main
```

**⚠️ 注意**：把 `你的用户名` 替换成你的真实 GitHub 用户名。`main` 是分支名，新仓库默认分支就是 `main`。

### 5.4 本地生成并首次部署

```bash
hexo clean && hexo deploy
```

首次部署可能需要几秒钟，过程中如需确认 SSH 指纹，输入 `yes` 即可。看到 `Deploy done` 表示推送成功。

### 5.5 🔥 关键一步：在 GitHub 网页端启用 Pages 服务

代码推送上去后，**GitHub Pages 服务并不会自动生效**，需要手动开启。

1. 打开你的仓库页面（`https://github.com/你的用户名/你的用户名.github.io`）。
2. 点击顶部的 **Settings** 选项卡。
3. 在左侧菜单中找到并点击 **Pages**（一般不需要往下滚太多）。
4. 在 “Build and deployment” 下的 **Source** 中，选择 **Deploy from a branch**。
5. 在 **Branch** 下拉框中选择 `main` 分支，右侧目录保持 `/ (root)`。
6. 点击 **Save** 按钮。

页面会刷新，上方会提示 “Your site is live at https://xxx.github.io”。稍等1分钟左右（初次构建需要时间），就可以在浏览器中访问你的博客了。

### 5.6 访问你的博客

在浏览器地址栏输入：**`https://你的用户名.github.io`**，你便拥有了一个永远在线、完全免费的独立博客！

---

## 六、日常工作流与一键部署

每次写完新文章或修改配置后，你只需要在博客根目录执行一条命令即可完成更新：

```bash
hexo g -d
```

这条命令会依次执行生成静态文件和部署。如果你更喜欢分开操作，也可以一步步来：

```bash
hexo clean
hexo g
hexo d
```

---

## 七、进阶技巧

### 7.1 更新 Solitude 主题

当主题作者发布新版本时，进入主题文件夹拉取更新即可（仅支持 Git 克隆方式）：

```bash
cd themes/solitude
git pull
cd ../..
```

### 7.2 添加自定义样式

在博客根目录创建 `source/_data` 文件夹（如果没有），在里面新建一个 `styles.styl` 文件，写入你自己的 CSS 代码。例如修改字体：

```css
body {
  font-family: "Microsoft YaHei", sans-serif;
}
```

重启预览或部署后生效。

### 7.3 启用搜索、评论等功能

Solitude 主题支持本地搜索、Valine/Giscus 等评论系统，具体可查阅主题官方配置文档。你需要做的就是在 `_config.solitude.yml` 中找到对应模块，填入自己申请的第三方服务 ID 即可。

---

## 八、常见问题排查

### ❓ 执行 `hexo server` 提示端口 4000 被占用
- **解决**：指定其他端口启动 `hexo server -p 4001`，然后访问 `http://localhost:4001`。

### ❓ 部署时出现 `Permission denied (publickey)`
- **原因**：SSH 密钥未正确添加或连接。
- **解决**：重新按第 1.3 节步骤检查，执行 `ssh -T git@github.com` 直到成功为止。

### ❓ 文章中文标题显示乱码
- **原因**：`.md` 文件编码不是 UTF-8。
- **解决**：用记事本打开文件，另存为时底部编码选择 **UTF-8**。

### ❓ 部署成功但打开网站显示 404
- **原因一**：仓库名没有严格按 `用户名.github.io` 格式命名。
- **原因二**：忘记在 GitHub 仓库 Settings -> Pages 中手动开启服务并选择分支（见 5.5 节）。
- **解决**：检查以上两点。

### ❓ 安装或生成时出现 npm 网络错误
- **解决**：临时切换淘宝镜像加速：  
  `npm config set registry https://registry.npmmirror.com`  
  配置完再重试命令。

### ❓ 页面样式混乱或文章不显示
- **解决**：先执行 `hexo clean`，再重新生成部署。

### ❓ 提示 YAML 格式错误
- **解决**：排查所有冒号后面是否都有空格，不要使用 Tab 键缩进，用空格。

---

**🎉 恭喜！你已经完整拥有了一个完全免费、高度自定义、外观优雅的独立博客。**  
现在，去坚持写下你的第一篇真正意义上的博文吧～
