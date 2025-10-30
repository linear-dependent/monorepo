#!/usr/bin/env sh
set -eu

TARGET_DIR=/app/dist
SRC_DIR=/opt/dist

echo "[client] Populating dist volume..."
mkdir -p "$TARGET_DIR"
rm -rf "$TARGET_DIR"/* || true
cp -r "$SRC_DIR"/. "$TARGET_DIR"/
echo "[client] Done."

exit 0
