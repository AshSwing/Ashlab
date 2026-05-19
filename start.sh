#!/usr/bin/env bash
set -euo pipefail

mkdir -p /var/lib/tailscale /run/tailscale

# Set root SSH password on container startup.
echo "root:${SSH_ROOT_PASSWORD:-root}" | chpasswd

# Start tailscaled.
tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/run/tailscale/tailscaled.sock &
sleep 1

# Optionally join tailnet automatically with an auth key.
if [[ -n "${TS_AUTHKEY:-}" ]]; then
  tailscale up --authkey="${TS_AUTHKEY}" --hostname="${TS_HOSTNAME:-devbox}" || true
fi

# Start sshd in foreground for container lifetime.
exec /usr/sbin/sshd -D -e
