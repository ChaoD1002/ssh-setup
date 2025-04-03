# SSH Setup by Chao Dang

本项目用于快速配置安全的 SSH 连接环境（如 GitHub、VPS 服务器等），不包含任何私钥内容，可安全同步。

## 快速使用

```bash
git clone <your-repo-url>
cd ssh-setup
bash install.sh
```

## 内容说明

- `ssh/config_template`：你维护的 SSH 配置模板
- `install.sh`：部署配置到 `~/.ssh/config`
- `.gitignore`：默认忽略所有私钥文件（*.key / id_*）

## 推荐做法

将此仓库作为个人 dotfiles 子模块，结合 `sre-terminal` 使用。
