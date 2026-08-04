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

推送到 `main` 分支后，GitHub Actions 会自动构建并部署到 GitHub Pages。

## License

MIT
