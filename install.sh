#!/bin/bash

echo "📦 初始化 SSH config..."

mkdir -p ~/.ssh
cp ssh/config_template ~/.ssh/config
chmod 600 ~/.ssh/config

echo "✅ SSH config 已部署到 ~/.ssh/config"
