#!/bin/bash

# Hugo GitHub Pages 部署脚本
# 使用方法: ./deploy.sh [commit message]

set -e  # 遇到错误立即退出

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查是否在 master 分支
current_branch=$(git branch --show-current)
if [ "$current_branch" != "master" ]; then
    echo -e "${YELLOW}警告: 当前不在 master 分支，正在切换到 master 分支...${NC}"
    git checkout master
fi

# 检查 Hugo 是否安装
# 首先尝试在 PATH 中查找，如果找不到则尝试常见路径
HUGO_CMD=""
if command -v hugo &> /dev/null; then
    HUGO_CMD="hugo"
elif [ -f "/opt/homebrew/bin/hugo" ]; then
    HUGO_CMD="/opt/homebrew/bin/hugo"
elif [ -f "/usr/local/bin/hugo" ]; then
    HUGO_CMD="/usr/local/bin/hugo"
else
    echo -e "${RED}错误: Hugo 未安装。请先安装 Hugo。${NC}"
    echo "安装方法: brew install hugo (macOS) 或访问 https://gohugo.io/installation/"
    exit 1
fi

echo -e "${GREEN}开始部署流程...${NC}"

# 检查是否使用 git worktree
if [ -d "public" ] && [ -d "public/.git" ]; then
    echo -e "${GREEN}检测到 git worktree 设置，使用 worktree 方式部署${NC}"
    
    # 使用 worktree 方式
    echo "生成静态文件..."
    $HUGO_CMD --minify
    
    cd public
    
    # 检查是否有更改
    if [ -z "$(git status --porcelain)" ]; then
        echo -e "${YELLOW}没有更改需要提交${NC}"
        cd ..
        exit 0
    fi
    
    # 添加所有文件
    git add .
    
    # 提交信息
    commit_msg="${1:-Update site $(date +'%Y-%m-%d %H:%M:%S')}"
    git commit -m "$commit_msg"
    
    # 推送到远程
    echo "推送到 gh-pages 分支..."
    git push origin gh-pages
    
    cd ..
    echo -e "${GREEN}部署完成！${NC}"
    
else
    echo -e "${GREEN}使用直接分支方式部署${NC}"
    
    # 生成静态文件
    echo "生成静态文件..."
    $HUGO_CMD --minify
    
    # 检查 public 目录是否存在
    if [ ! -d "public" ]; then
        echo -e "${RED}错误: public 目录不存在，Hugo 生成失败${NC}"
        exit 1
    fi
    
    # 保存当前更改（如果有）
    if ! git diff-index --quiet HEAD --; then
        echo -e "${YELLOW}检测到未提交的更改，请先提交或暂存更改${NC}"
        read -p "是否继续部署？(y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
    
    # 创建临时目录保存 public 内容
    TEMP_DIR=$(mktemp -d)
    echo "保存生成的静态文件到临时目录..."
    cp -r public/* "$TEMP_DIR/" 2>/dev/null || cp -r public/. "$TEMP_DIR/" 2>/dev/null
    
    # 切换到 gh-pages 分支
    echo "切换到 gh-pages 分支..."
    if git show-ref --verify --quiet refs/heads/gh-pages; then
        git checkout gh-pages
    else
        # 如果本地没有 gh-pages 分支，从远程创建
        if git show-ref --verify --quiet refs/remotes/origin/gh-pages; then
            git checkout -b gh-pages origin/gh-pages
        else
            echo -e "${YELLOW}创建新的 gh-pages 分支...${NC}"
            git checkout --orphan gh-pages
            git rm -rf .
        fi
    fi
    
    # 删除旧文件（除了 .git）
    echo "清理旧文件..."
    find . -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +
    
    # 复制新文件
    echo "复制新文件..."
    cp -r "$TEMP_DIR"/* . 2>/dev/null || cp -r "$TEMP_DIR"/. . 2>/dev/null
    rm -rf "$TEMP_DIR"
    
    # 添加所有文件
    git add .
    
    # 检查是否有更改
    if [ -z "$(git status --porcelain)" ]; then
        echo -e "${YELLOW}没有更改需要提交${NC}"
        git checkout master
        exit 0
    fi
    
    # 提交信息
    commit_msg="${1:-Update site $(date +'%Y-%m-%d %H:%M:%S')}"
    git commit -m "$commit_msg"
    
    # 推送到远程
    echo "推送到远程 gh-pages 分支..."
    git push origin gh-pages
    
    # 切换回 master 分支
    echo "切换回 master 分支..."
    git checkout master
    
    echo -e "${GREEN}部署完成！${NC}"
fi

echo -e "${GREEN}网站将在几分钟内在 https://tengxiaoliu.github.io/ 更新${NC}"
