#!/bin/bash

echo "🔐 正在初始化 SSH 密钥..."

mkdir -p ~/.ssh

KEY_PATH="$HOME/.ssh/id_ed25519"

# 检查密钥是否已存在
if [[ -f "$KEY_PATH" ]]; then
  echo "✅ SSH 密钥已存在：$KEY_PATH"
else
  echo "📦 生成新的 SSH 密钥..."
  ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f "$KEY_PATH" -N ""
fi

# 启动 ssh-agent 并添加密钥
eval "$(ssh-agent -s)"
ssh-add "$KEY_PATH"

# 输出公钥并复制（如果是 mac）
PUB_KEY="$KEY_PATH.pub"
echo "📎 SSH 公钥如下（请复制添加至 GitHub）："
echo "----------------------------------------"
cat "$PUB_KEY"
echo "----------------------------------------"

if [[ $(uname) == "Darwin" && -x "$(command -v pbcopy)" ]]; then
  pbcopy < "$PUB_KEY"
  echo "📋 已复制到剪贴板"
fi

echo "🔗 GitHub 添加地址：https://github.com/settings/ssh/new"

