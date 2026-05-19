# Ashlab - 基于 Docker 的远程开发环境

## 核心软件

- `uv` 工具链
- `rustup` 工具链
- `tmux`
- `nginx`
- `tailscale`

## Nginx

已配置反向代理, 按照如下方式启动:

```bash
jupyter lab \
  --ip=0.0.0.0 \
  --port=8888 \
  --ServerApp.base_url=/jupyter \
  --ServerApp.allow_remote_access=True \
  --ServerApp.trust_xheaders=True \
  --ServerApp.password='argon2:$argon2id$v=19$m=10240,t=10,p=8$pzTwgqFsxmTPnoA+yuaCLQ$PnT0gbgEmwV/lzOs/9pf984OsQLZG1XLfkMB0Gk0wAQ' \
  --ServerApp.token='' \
  --allow-root
```