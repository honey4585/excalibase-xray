#!/bin/sh
set -e
: "${UUID:?UUID env required}"
WSPATH="${WSPATH:-/ray}"
PORT="${PORT:-8080}"
sed -e "s|__UUID__|$UUID|g" -e "s|__WSPATH__|$WSPATH|g" -e "s|__PORT__|$PORT|g" \
  /usr/local/xray/config.template.json > /usr/local/xray/config.json
exec /usr/local/xray/xray run -c /usr/local/xray/config.json
