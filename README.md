# Sophia's Blog

基于 Hugo + PaperMod 主题的个人博客，部署在 GitHub Pages。

## 技术栈

- **Hugo** — 静态站点生成器
- **PaperMod** — Hugo 主题
- **GitHub Pages** — 免费托管
- **Giscus** — 基于 GitHub Discussions 的评论系统

## 本地运行

```bash
# 克隆仓库（含子模块）
git clone --recurse-submodules https://github.com/Sophiaa1206/sophiaa1206.github.io.git
cd sophiaa1206.github.io

# 启动本地预览
hugo server -D

# 打开浏览器访问 http://localhost:1313
```

## 目录结构

```
├── content/          # 博客文章 Markdown 源文件
│   ├── about.md      # 关于页面
│   ├── archives/     # 归档页
│   ├── posts/        # 博客文章
│   └── search/       # 搜索页
├── layouts/          # 自定义模板（覆盖主题）
│   └── partials/
│       └── comments.html  # Giscus 评论模板
├── .github/workflows/     # GitHub Actions 部署工作流
├── hugo.yaml         # Hugo 配置文件
└── themes/PaperMod/  # 主题（git submodule）
```

## 写新文章

```bash
hugo new content posts/my-new-post.md
```

## 部署

本仓库的 GitHub Pages 已开启 GitHub Actions 部署模式（`build_type=workflow`）。
自动部署 workflow 已准备好：`.github/workflows/hugo.yaml`（因当前 gh token 缺少 `workflow` scope 尚未推送）。

### 启用自动部署（推 main 即自动发布）

1. 给 gh CLI 增加 `workflow` scope：
   ```bash
   gh auth refresh -h github.com --scopes workflow
   ```
   按提示在浏览器完成授权（打开 https://github.com/login/device 输入显示的一次性代码并 Authorize）。
2. 推送 workflow 文件（此时才有权限）：
   ```bash
   git add .github/workflows/hugo.yaml
   git commit -m "feat: enable GitHub Actions auto deploy"
   git push origin main
   ```
3. 之后每次推送 `main`，GitHub Actions 会自动构建并部署到 GitHub Pages。

### 本地手动部署（备用，不依赖 workflow）

```bash
hugo --gc --minify   # 生成 public/
git worktree add -b gh-pages /tmp/gh-pages-wt
cd /tmp/gh-pages-wt && git rm -rf . && cp -R ../public/. . && touch .nojekyll
git add -A && git commit -m "deploy" && git push origin gh-pages --force
cd .. && git worktree remove /tmp/gh-pages-wt
```
> 注意：本仓库为 GitHub Actions 部署模式，分支推送不会自动触发发布；如需分支部署请在 GitHub 设置里将 Pages source 改为 `gh-pages` 分支（Deploy from a branch）。

## License

MIT
