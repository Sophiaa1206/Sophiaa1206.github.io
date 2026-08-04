#!/usr/bin/env bash
# Hugo 博客一键部署脚本
# 用法: ./deploy.sh "提交信息"
set -euo pipefail

BLOG_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BLOG_DIR"

COMMIT_MSG="${1:-deploy: update site}"

echo ">> 构建站点..."
hugo --gc --minify

echo ">> 推送源码到 main 分支..."
git add -A
git commit -m "$COMMIT_MSG" || echo "(无源码变更)"
git push origin main

echo ">> 部署到 gh-pages 分支..."
cd "$BLOG_DIR/public"
git add -A
git commit -m "$COMMIT_MSG" || echo "(无构建变更)"
git push origin gh-pages --force

echo ""
echo "✅ 部署完成！"
echo "   访问: https://sophiaa1206.github.io/"
echo ""
echo "注意: GitHub Pages 可能有最多 10 分钟的缓存延迟。"
